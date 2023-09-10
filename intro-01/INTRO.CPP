/* INTRO */

#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <stdio.h>
#include <time.h>
#include <cstdlib>

#include "font.h"

#define PALETTE_SIZE    256
#define SPRITE_SIZE     32
#define FONT_WIDTH      8
#define FONT_HEIGHT     8
#define FONT_SCALE      2
#define FONT_SPACE      1
#define FONT_JUMP       8
#define FONT_COLOR      1
#define FONT_GRADIENT   2
#define FONT_LINE_H     8
#define FADE_TIME       3
#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   200
#define CENTER_X        160
#define CENTER_Y        100
#define KEY_UP          72
#define KEY_DOWN        80
#define KEY_ESC         27
#define PIT_FREQ        1193182L
#define SNAKE_BACK      -1
#define SNAKE_FRONT     1

#define DEMO_START      0
#define DEMO_INTRO      1
#define DEMO_HIGHWAY    10
#define DEMO_FIREPLACE  23
#define DEMO_SINEBARS   32
#define DEMO_OUTRO      70
#define DEMO_END        80

unsigned int DEMO_SCENE = 0;
const float TARGET_FRAME_TIME = 1.0f/60.0f;
const double PI = 3.14159265358979323846;
const float ASPECT_RATIO = (4.0f/3.0f)/((float)SCREEN_WIDTH/(float)SCREEN_HEIGHT);
unsigned int lastDT=0;
unsigned char* vga = (unsigned char*)0xA0000;
unsigned char buffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char lineBuffer[4][SCREEN_WIDTH]={{0}};
unsigned char mainPal[768];
unsigned char sprite[16][SPRITE_SIZE*SPRITE_SIZE]={{0}};
struct Star {float x,y,z;};
const int STARS_MAX=300;
Star stars[STARS_MAX];
const float FOV=1.4f;
const float centerX = SCREEN_WIDTH/2;
const float centerY = SCREEN_HEIGHT/2;

const char* MARQUEE = ""
"P1X PRESENTS A (FREE)DOS INTRO FOR IBM PC I486DX2-66. "
"A 66MHZ BEAST FROM 1989 RUNNING 2023 CODE BY W84DEATH: "
"IT WAS MY FIRST COMPUTER IN THE 90'S WHERE I LEARN HOW TO CODE IN BASIC. "
"MANY YEARS IN GAMEDEV PREPARED ME FOR THIS C++ INTRO!      ";
const char* HELLO = ""
"AFTER MORE THAN TWENTY YEARS OF "
"FOLLOWING DEMOSCENE  IT IS TIME "
"FOR US TO STEP-IN ! THIS IS THE "
"FIRST INTRO  FROM THE P1X GROUP."
"CODED ON FREE-DOS WITH C++ OPEN "
"WATCOM, UPX, AND FED. RUNNING ON"
"VIRTUAL PC (86BOX/DOSBOX).";
const char* WORKHARD = ""
"OVER ONE MILLION TRANSISTORS ARE"
"BURNING  RIGHT NOW  TO BRING YOU"
"THIS VISUALS.. HAIL THE SILICON!";
const char* GREETZ = ""
"GREETZ TO  ALL THE  DEMOSCENERS,"
"MASTODON FOLLOWES, FREEDOS DEVS,"
"@DAMIENG FOR  A FONT, SHAWN FOR "
"FOLDING EDITOR (FED), AND  LAST "
"BUT  NOT  LEAST, TO  MY  LOVELY "
"MONIS  FOR  ALL  THE  SUPPORT ! ";
const char* BYE = ""
"     M M X X I I I   P 1 X      "
"  KRZYSZTOF KRYSTIAN JANKOWSKI  "
" HTTPS://KRZYSZTOFJANKOWSKI.COM ";
const int textLength = strlen(MARQUEE);
int writerStart = 32;
int writerEnd = SCREEN_WIDTH-writerStart;
int writerX = writerStart;
int writerY = 0;
int writerIndex = 0;
float writerDelayCount = 0;
const float WRITER_DELAY=0.033f;

void setGraphicsMode(){
  __asm {
    mov eax, 13h
    int 10h
  }
}

void setTextMode(){
  __asm {
    mov eax, 3h
    int 10h
  }
}

void fillScreen(int color){
  __asm{
    les   di,buffer
    mov   al,BYTE PTR color;
    mov   ah,al
    mov   cx,320*200/2
    rep   stosw
  }
}

void drawPixel(int x, int y, int color){
   buffer[(y<<8)+(y<<6)+x] = (unsigned char)color;
}

void drawLineH(int x1, int x2, int y, int color){
  int temp;
  if (x1>x2){
    temp = x1;
    x1 = x2;
    x2 = temp;
  }
  memset(buffer+((y<<8)+(y<<6)+x1),(unsigned char)color, x2-x1+1);
}

void drawRectangle(int x1, int y1, int x2, int y2, int color){
  unsigned char far *startOffset;
  int width;
  startOffset = buffer+( (y1<<8)+(y1<<6))+x1;
  width = 1+x2-x1;
  while(y1++<=y2){
    memset((unsigned char *)startOffset,(unsigned char)color,width);
    startOffset+=320;
  }
}

void setPalette(int index, int r, int g, int b) {
    outp(0x03C8, index);
    outp(0x03C9, r);
    outp(0x03C9, g);
    outp(0x03C9, b);
}

void updatePalette(){
  for(int i=0;i<256;i++){
    setPalette(i, mainPal[i * 3], mainPal[i * 3 + 1], mainPal[i * 3 + 2]);
  }
}

void initPalette(int paletteID) {
  switch (paletteID){
    case 0: // default
      for(int i=0;i<32;i++){
	mainPal[(i)*3]=i;
	mainPal[(i)*3+1]=i;
	mainPal[(i)*3+2]=i;
      } // grays 32
      for(int i=0;i<63+32;i++){
	mainPal[96+i*3]=63;
	mainPal[96+i*3+1]=i*0.65;
	mainPal[96+i*3+2]=21;
      } // fire 96
      mainPal[384-3]=63;
      mainPal[384-2]=63;
      mainPal[384-1]=63;
      // white 1
      for(int i=0;i<64;i++){
	mainPal[384+i*3]=16;
	mainPal[384+i*3+1]=i;
	mainPal[384+i*3+2]=50;
      } // blue 64
      for(int i=0;i<64;i++){
	mainPal[576+i*3]=i;
	mainPal[576+i*3+1]=i;
	mainPal[576+i*3+2]=i; 
      } // free 64
      break;

    case 1: // intro/highway
      for(int i=0;i<64;i++){
	mainPal[(i)*3]=i;
	mainPal[(i)*3+1]=i;
	mainPal[(i)*3+2]=i;
      } // grays 64
      for(int i=0;i<64;i++){
	mainPal[192+i*3]=(int)(i>>2);
	mainPal[192+i*3+1]=(int)(i>>1);
	mainPal[192+i*3+2]=(int)(i>>2);
      } // greenish 64
      for(int i=0;i<64;i++){
	mainPal[384+i*3]=(int)(i>>2);
	mainPal[384+i*3+1]=0;
	mainPal[384+i*3+2]=16-(int)(i>>3);
      } // sunrise 64
      for(int i=0;i<64;i++){
	mainPal[576+i*3]=(int)(i*0.8);
	mainPal[576+i*3+1]=(int)(i*0.75);
	mainPal[576+i*3+2]=0; 
      } // orange stripes 64
    break; 
    case 2: // sinebars 
      for(int i=0;i<16;i++){
	mainPal[(i)*3]=i>>1;
	mainPal[(i)*3+1]=i>>1;
	mainPal[(i)*3+2]=i>>1;
      } // grays 16 slow
      for(int i=0;i<96;i++){
	mainPal[48+i*3]=63;
	mainPal[48+i*3+1]=i*0.65;
	mainPal[48+i*3+2]=40;
      } // sunset 96
      for(int i=0;i<32;i++){
	mainPal[288+i*3]=63;
	mainPal[288+i*3+1]=56+(int)(7*sin(i*PI/63));
	mainPal[288+i*3+2]=50+(int)(13*sin(i*PI/63));
      } // sun 64
      for(int i=0;i<64;i++){
	mainPal[384+i*3]=16;
	mainPal[384+i*3+1]=i;
	mainPal[384+i*3+2]=50;
      } // blue 64 - logo
      for(int i=0;i<64;i++){
	mainPal[576+i*3]=16+(int)(16*(sin(i*PI/63)));
	mainPal[576+i*3+1]=16+(int)(32*(sin(i*PI/63)));
	mainPal[576+i*3+2]=(int)(16*(sin(i*PI/63)));
      } // green 64
    break;
  }
  updatePalette();
}

void colorCycle(int start, int end){
  int startIndex = start*3;
  int endIndex = end*3;
  int lastColor[3] = {
    mainPal[endIndex-3],
    mainPal[endIndex-2],
    mainPal[endIndex-1]
  };
  for(int i=endIndex-1;i>startIndex+2;i-=3){
    mainPal[i] = mainPal[i-3];
    mainPal[i-1] = mainPal[i-4];
    mainPal[i-2] = mainPal[i-5];
  }

  mainPal[startIndex] = lastColor[0];
  mainPal[startIndex+1] = lastColor[1];
  mainPal[startIndex+2] = lastColor[2];

  updatePalette();
}

void addFire(unsigned int t, int w, int h){
    int shiftX = 160-(w/2);
    int shiftY = 100-(h/2);
    int safeX = 0;
    int safeY = 0;
    unsigned int color = 0;

    for (int x=0; x<w; x++) {
      if(std::rand()%100<15){
	color = 96+(std::rand()%32); 
	if(std::rand()%100<25) color=0;
	safeX = (x+shiftX)%SCREEN_WIDTH;
	safeY = (h+shiftY)%SCREEN_HEIGHT;
	buffer[((safeY<<8)+(safeY<<6))+safeX] = (unsigned int)color;
      }
    }
}

void animFire(int w, int h){
  int shiftX = 160-(w/2);
  int shiftY = 100-(h/2);
  int safeX = 0;
  int safeY = 0;
  unsigned int color = 0;
  for (int y = shiftY; y < h+shiftY; y++) {
    for (int x = shiftX; x < w+shiftX; x++) {
      float value = 0.0f;
      value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];
      value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x-1)];
      value += buffer[((+y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x+1)];
      value += buffer[((+y + 2) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];

      if(value>0.0f){
	value /= 4.0525;

	color = (int)value%128;
	safeX = x%SCREEN_WIDTH;
	safeY = y%SCREEN_HEIGHT;
	buffer[(safeY<<8)+(safeY<<6)+safeX] = (unsigned int)color;
      }
    }
  }
}

void drawFire(float t, int w, int h) {
  addFire((int)t,w/2,h);
  animFire(w,h); 
}

void drawCPU(int x, int y){
  // PACKAGE
  drawLineH(x-35,x+35,y,30);
  for(int i=0;i<=6;i++) drawLineH(x-35-(int)(i>>1),x+35+(int)(i>>1),y+i,12+i);
  drawLineH(x-36,x+36,y+4,28);
  drawLineH(x-37,x+37,y+7,6);
  // DIE
  drawRectangle(x-16,y-1,x+16,y+1,0);
  // PINS
  drawLineH(x-34,x+34,y+8,220); 
  for(int p=-30;p<=30;p+=5){
    drawRectangle(x+p-1,y+9,x+p+1,y+10,240);
  }
}

void initFireplace(){
  for (int y=0; y<SCREEN_HEIGHT; y++){
    memcpy(buffer+y*SCREEN_WIDTH, lineBuffer[3], SCREEN_WIDTH);
  }
  drawRectangle(CENTER_X-22,0,CENTER_X+22,SCREEN_HEIGHT,0);
  drawCPU(CENTER_X, 148);
}

void drawPalette() {
    unsigned int w = SCREEN_WIDTH;
    unsigned int h = SCREEN_HEIGHT;

    for (int c = 0; c < 256; c++) {
      memset(buffer+c,c,1);
    }
    for (int y=1;y<4;y++){
      memcpy(buffer+y*w,buffer,256);
    }
}

void initStars(){
  for (int i=0;i<STARS_MAX;i++){
    stars[i].x=(std::rand()%SCREEN_WIDTH)-centerX;
    stars[i].y=(std::rand()%SCREEN_HEIGHT)-centerY;
    stars[i].z=std::rand()%100+1;
  }
}

void drawStars(float dt){
  float speed=150.0f;
  float FOV = 25.0f;

  memset(buffer, 2, sizeof(buffer));

  for (int i=0;i<STARS_MAX;i++){
    stars[i].z -= speed*dt;
    int x=(int)(stars[i].x/stars[i].z*FOV+CENTER_X);
    int y=(int)(stars[i].y/stars[i].z*FOV+CENTER_Y); 

    if(x>0 and x<SCREEN_WIDTH and y>0 and y<SCREEN_HEIGHT){
       buffer[(y<<8)+(y<<6)+x] = 64-(int)(64*(sin(stars[i].z*PI/200)) );
    }

    if(stars[i].z<0){
      stars[i].x=(std::rand()%SCREEN_WIDTH)-CENTER_X;
      stars[i].y=(std::rand()%SCREEN_HEIGHT)-CENTER_Y;
      stars[i].z=100; 
    }
  }
}

void drawGradient(int startColor, int gap){
  float maxDist = sqrt(CENTER_X*CENTER_X+CENTER_Y*CENTER_Y);
  for(int y=0;y<SCREEN_HEIGHT;y++){
    for(int x=0;x<SCREEN_WIDTH;x++){
      float ax = (x-CENTER_X)*ASPECT_RATIO;
      float ay = (y-CENTER_Y);
      float dist = sqrt((ax*ax)+(ay)*(ay));
      if(dist>gap){
	int color = (int)(startColor+gap+(dist/maxDist)*128)%255;
	drawPixel(x,y,color);
      }
    }
  }
}

void drawCharOnBuffer(char ch, int x, int y, int color, int scale, int mode){
  int charIndex =  ch - '!';
  int LEFT = -(int)scale*0.5;
  int grad = 0;

  if (charIndex == -1) return;

  for (int j=0; j<FONT_HEIGHT; j++){
    for (int i=0; i<FONT_WIDTH; i++){
      if ( fontData[charIndex][j] & (0x80>>i)){
	for(int fy=LEFT;fy<scale;++fy){
	  for(int fx=LEFT;fx<scale;++fx){
	    int posx = x+scale*i+fx;
	    int posy = y+scale*j+fy;
	    if(posx>0 & posx<SCREEN_WIDTH){
	      int c = color;
	      if(mode==FONT_GRADIENT){
	       c = (color+grad-LEFT+fy)%255;
	      }
	      buffer[(posy<<8)+(posy<<6)+posx] = c;
	    }
	  }
	}
      }
    }
    grad+=10;
  }
}

void drawStringOnBuffer(const char* str, int x, int y, int color, int scale, int mode, float timer){
  float c=0.0f;
  float  pos=0;
  while(*str){
    if(x+FONT_WIDTH*scale>0 & x<SCREEN_WIDTH){
      int shift=(FONT_JUMP)+(int)( sin((x*0.03f)+(timer*0.1f))*FONT_JUMP );
      if(timer<0.0f) shift=0;
      drawCharOnBuffer(*str, x, y+shift, color, scale, mode);
      pos+=0.1;
    }
    x+=FONT_WIDTH*scale+FONT_SPACE;
    str++;
    c+=FONT_WIDTH*scale*0.5f;
  }
}

void initSprite(int bank, int startColor){
  int colors = 32;
  for(int y=0;y<SPRITE_SIZE;y++){
    for(int x=0;x<SPRITE_SIZE;x++){
      float ax = (x-SPRITE_SIZE/2);
      float ay = (y-SPRITE_SIZE/2);
      float dist = sqrt((ax*ax)+(ay)*(ay));
      int color = (int)(startColor+(dist/(SPRITE_SIZE*0.5))*colors);
      if(color>startColor+colors) color=0;
      sprite[bank][(y<<5)+x] = color;
    }
  }
}

void drawSprite(int bank, int x, int y){
  int shift=SPRITE_SIZE>>1;
  for (int j=0; j<SPRITE_SIZE; j++){
    for (int i=0; i<SPRITE_SIZE; i++){
      int c = sprite[bank][(j<<5)+i];
      if (c>0){
	int posx = x+i-shift;
	int posy = y+j-shift;
	if(posx>0 and posx<SCREEN_WIDTH){
	  buffer[(posy<<8)+(posy<<6)+posx] = c;
	}
      } 
    }
  }
}

int drawSineText(float dt, float timer, int x, int y, int color, int bg){
  float speed = 120.0f;
  float bgSpeed = 8.0f;

  for (int bgY=0;bgY<32;bgY++){
    int c = bg;
    if(bgY==1 or bgY==30) c=bg+15;
    if(bgY>2 and bgY<29) c = bg + 7 + sin(bgY+timer*bgSpeed)*7;
    memset(buffer+SCREEN_WIDTH*(y+bgY),c,SCREEN_WIDTH);
  }
  drawStringOnBuffer(MARQUEE, x, y, color,FONT_SCALE,FONT_GRADIENT,timer);
  x-=(int)speed*dt;
  if (x < -textLength*FONT_WIDTH*FONT_SCALE-SCREEN_WIDTH){
    x = SCREEN_WIDTH;
  }
  return x;
}

void drawTypewriter(const char* str, float dt, int color, int scale){
  writerDelayCount += dt;
  if(writerDelayCount>WRITER_DELAY && writerIndex<strlen(str)){
    writerDelayCount = 0;
    char ch = str[writerIndex]; 
    if(writerX + FONT_WIDTH*scale > writerEnd){
      writerX = writerStart;
      writerY += FONT_LINE_H;
    }else{
      drawCharOnBuffer(ch,writerX+1, writerY+1, 0,scale,FONT_COLOR);
      drawCharOnBuffer(ch,writerX, writerY, color,scale,FONT_COLOR);
      writerX += FONT_WIDTH*scale; 
      writerIndex++;
    } 
  }
}

void initLineBuffer(){
  for (int x=0; x<SCREEN_WIDTH; x++){
    lineBuffer[0][x] = (unsigned char)(32+(sin(x*PI/SCREEN_WIDTH)*63));
    lineBuffer[1][x] = (unsigned char)(32+(sin(x*PI/SCREEN_WIDTH)*95));
    lineBuffer[2][x] = (unsigned char)(192+(sin(x*PI/SCREEN_WIDTH)*63));
    lineBuffer[3][x] = (unsigned char)(256-32-(sin(x*PI/SCREEN_WIDTH)*31));
  }
}

void drawSineBars(float timer, int barShift){
  const float wobble = 160.0f;
  const float speed = 10.0f;

  for (int y=0; y<SCREEN_HEIGHT; y++){
    float squish=10*640.0f;
    float yShift=wobble+wobble*sin(((y*0.1)+timer*speed));
    int shift = (int)(yShift)%SCREEN_WIDTH;
    int v = 2; 
    if(y<100+barShift){
      v=1;
      shift =0;
    }
    memcpy(buffer+y*SCREEN_WIDTH, lineBuffer[v]+shift, SCREEN_WIDTH-shift);
    memcpy(buffer+y*SCREEN_WIDTH+SCREEN_WIDTH-shift, lineBuffer[v], shift);
  }
}

void drawStats(float time, float deltaTime){
    drawRectangle(2,6,48,24,4);
    drawLineH(2,48,5,40);
    drawLineH(2,48,25,40);
    char timerStr[20];
    char deltaStr[10];
    sprintf(timerStr,"%.1f",time);
    sprintf(deltaStr,"%.2f",deltaTime*1000);
    const char* timer = timerStr;
    const char* delter = deltaStr;
    drawStringOnBuffer(timer,4,8,127,1,FONT_COLOR,-1);
    drawStringOnBuffer(delter,4,16,127,1,FONT_COLOR,-1);
    drawPalette();
}

void drawIntro(float t){
  const char* text = "P 1 X";
  drawStringOnBuffer(text,135,100,63,1,FONT_COLOR,-1);
}

void initOutro(){
  for(int y=-100;y<100;y++){
    for(int x=-160;x<160;x++){
      float a=(atan2(y,x)+PI)*80.0f;
      float d=999/sqrt(x*x+y*y+1);
      int c=192+(int)(a+d)%64;
      drawPixel(CENTER_X+x,CENTER_Y+y,c);
    }
  }
}

unsigned int drawRoad(float factor, int y, int horizon, int bottom, unsigned int roadColor){
  int x1 = CENTER_X-factor*CENTER_X;
  int x2 = CENTER_X+factor*CENTER_X;
  //int groundColor = (y-horizon)>>3;
  //drawLineH(0,SCREEN_WIDTH,y,groundColor);
  //drawLineH(x1,x2,y,roadColor);
  int step = (int)((y-horizon)*0.05f);
  if(roadColor+step<48) roadColor+=step;
  return roadColor;
}

int drawStripes(int y, int horizon, int bottom, int nextStripe, int anim){
  unsigned int stripeColor = 192;
  int stripeMin = 1;
  int stripeMax = 18;
  int spaceMin = 1;
  int spaceMax = 120;
  int stripeLen = 60;
  float FOV=1.0f;

  float lerpFactor = FOV*(float)(y-horizon)/(bottom-horizon);
  int stripe = stripeMin+lerpFactor*(stripeMax-spaceMin);
  int space = spaceMin+lerpFactor*(stripeMax-spaceMin);
  int a = (int)(anim*lerpFactor);
  if(y==nextStripe+a){
    for (int sy=y+a; sy<y+a+(stripeLen*lerpFactor) && sy<=bottom; sy++){
      float sf = FOV*(float)(sy-horizon)/(bottom-horizon);
      int x1 = CENTER_X-(sf*(stripe>>1));
      int x2 = CENTER_X+(sf*(stripe>>1));
      unsigned int color = stripeColor+(int)(sy*lerpFactor);
      if(color>255) color=255;
      drawLineH(x1, x2, sy, color);
    }
    nextStripe = y+space+(stripeLen*lerpFactor);
  } 
  return nextStripe;
}

void initHighway(int horizon){
  const char* text = "SEPTEMBER 2023";
  unsigned int skyColor = 128;
  unsigned int textColor = 170;

  for(int y=0;y<horizon;y++){
    int color = skyColor+(int)(y>>1);
    if(color>191) color = 191;
    drawLineH(0,SCREEN_WIDTH,y,color);
  }

  drawLineH(0,SCREEN_WIDTH,horizon,1);
  drawStringOnBuffer(text,CENTER_X-((strlen(text)*FONT_WIDTH*2)>>1),40,textColor,2,FONT_COLOR,-1);
}

void drawHighway(float timer, int horizon, int bottom){
  float roadWidth = 160.0f;
  float stripeWidth = 10.0f;
  float speed = 250.0f;
  float bendSpeed = 4.0f;
  float center = CENTER_X;

  for(int y=horizon;y<SCREEN_HEIGHT;y++){
    float factor = FOV*(float)(y-horizon)/(bottom-horizon);
    center = CENTER_X + (int)(32.0f*(sin(timer*bendSpeed*0.6+y*0.02f)+(sin(timer*bendSpeed*0.7+y*0.02f)))*factor);
    int color = (int)(40*sin((factor*y)*PI/(SCREEN_HEIGHT*2)));
    int color2 = 64+(int)(64*sin((factor*y)*PI/(SCREEN_HEIGHT*2)));
    int color3 = color2+128; 
    int x = (int)(center-factor*roadWidth);
    int safeX = (x>0)?x:0;
    int x2 = (int)(center+factor*roadWidth);
    int safeX2 = (x2<SCREEN_WIDTH)?x2:SCREEN_WIDTH;

    // terrain
    if((int)((timer*speed)+(y/factor))%200>100){
      color2 = (color2+4<128)?color2+4:127;
    }
    drawLineH(0,SCREEN_WIDTH,y,color2);

    // road
    drawLineH(safeX,safeX2,y,color);

    // stripes
    x = (int)(center-factor*stripeWidth);
    safeX = (x>0)?x:0;
    x2 = (int)(center+factor*stripeWidth);
    safeX2 = (x2<SCREEN_WIDTH)?x2:SCREEN_WIDTH;
    if( (int)((timer*speed)+(y/factor))%100>50 ) drawLineH(safeX,safeX2,y,color3);
  }
}

void drawSnake(float timer, int hShift, int layer){
  for(int s=0;s<16;s++){
    int sx=160+(int)(80*sin(s*PI/16+timer*2.2));
    int sy=hShift+100+(int)(50*cos(s*PI/16+timer*3.7));
    if(layer==SNAKE_BACK){
      if(sin(s*PI/16+timer*3.7)<0.5){
	drawSprite(s,sx,sy);
      }
    }else{
      if(sin(s*PI/16+timer*3.7)>=0.5){
	drawSprite(s,sx,sy);
      }
    }
  }
}

int drawDebugLine(int y){
  if(kbhit()){
    switch (getch()) {
      case KEY_UP:
	y--;
	break;
      case KEY_DOWN:
	y++;
	break;
    }
  }

  int posY = y%SCREEN_HEIGHT;
  drawLineH(0, SCREEN_WIDTH, posY, 127);
  char posStr[3];
  sprintf(posStr,"%d",posY);
  const char* pos = posStr;
  drawStringOnBuffer(pos,1,(y-8)%SCREEN_HEIGHT,127,1,FONT_COLOR,-1);
  return posY; 
}

float getDeltaTime(){
  outp(0x43,0x00);
  unsigned int count = inp(0x40);
  count |= (unsigned int)inp(0x40)<<8;
  unsigned int elapsed;
  if(count<=lastDT){
    elapsed = lastDT - count;
  }else{
    elapsed = (0x10000-count)+lastDT;
  }
  lastDT = count;
  return (float)elapsed/PIT_FREQ;
}

void waitForVRetraceStart(){
  while(inp(0x3DA)&8);
  while(!(inp(0x3DA)&8));
}

int main() {
  setGraphicsMode();
  initPalette(0);
  initLineBuffer();
  initStars();
  for(int i=0;i<16;i++) initSprite(i,16+(int)((i*PI/96)*96));
  int textPosition = SCREEN_WIDTH;
  unsigned int time=0;
  float fps=0.0f;
  const char* cpuStr="I486";
  const char* nickStr="W84DEATH";
  unsigned int kX = CENTER_X-6;
  unsigned int kY = CENTER_Y-8;
  int horizon = 80;
  int bottom = SCREEN_HEIGHT;
  int nextStripe = horizon;
  int debugLinePos = CENTER_Y;
  float dt = 1.0f;
  float timer = DEMO_START;
  float transitionIn = 0.0f;
  float transitionOut = 0.0f;
  bool redraw = true;
  float timeSync=0.0f;

  memset(buffer, 0, sizeof(buffer));

  while(1){
    if (kbhit()&&getch()==KEY_ESC) break; 

    // SCENE SWITCHER
    switch((int)timer){
      case DEMO_INTRO:
	if(DEMO_SCENE==DEMO_INTRO) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	transitionIn=100;
	initPalette(1);
	DEMO_SCENE=DEMO_INTRO;
	break;
      case DEMO_HIGHWAY-FADE_TIME:
	transitionOut=100;
	break;
      case DEMO_HIGHWAY: 
	if(DEMO_SCENE==DEMO_HIGHWAY) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	initPalette(1);
	initHighway(horizon);
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 16;
	writerIndex = 0;
	DEMO_SCENE=DEMO_HIGHWAY;
	break;
      case DEMO_FIREPLACE-FADE_TIME:
	transitionOut=100;
	break;
      case DEMO_FIREPLACE:
	if(DEMO_SCENE==DEMO_FIREPLACE) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	initPalette(0);
	initFireplace();
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 170;
	writerIndex = 0;
	DEMO_SCENE=DEMO_FIREPLACE;
	break;
      case DEMO_SINEBARS-FADE_TIME:
	transitionOut=100;
	redraw=false;
	break;
      case DEMO_SINEBARS:
	if(DEMO_SCENE==DEMO_SINEBARS) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	transitionIn=100;
	initPalette(2);
	textPosition = SCREEN_WIDTH;
	DEMO_SCENE=DEMO_SINEBARS;
	break;
      case DEMO_OUTRO-FADE_TIME:
	transitionOut=100;
	break;
      case DEMO_OUTRO:
	if(DEMO_SCENE==DEMO_OUTRO) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	initPalette(2);
	initOutro();
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 50;
	writerIndex = 0;
	DEMO_SCENE=DEMO_OUTRO;
	break;
      case DEMO_END:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_START;
	timer = DEMO_START;
	break;
    }

    // SCENES

    if(redraw){
      if(DEMO_SCENE==DEMO_INTRO){
	drawStars(dt);
	drawIntro(timer);
      }
      if(DEMO_SCENE==DEMO_HIGHWAY){ 
	drawHighway(timer,horizon,bottom);
	drawTypewriter(HELLO,dt,63,1);
      }

      if(DEMO_SCENE==DEMO_FIREPLACE){ 
	drawFire(timer,32,96);
	drawTypewriter(WORKHARD,dt,127,1);
      }

      if(DEMO_SCENE==DEMO_SINEBARS){ 
	int hShift = (int)(sin(timer*0.5f)*32);
	drawSineBars(timer, hShift);
	drawSnake(timer, hShift, SNAKE_BACK);
	textPosition = drawSineText(dt,timer, textPosition,84+hShift, 128,0);
	drawSnake(timer, hShift, SNAKE_FRONT);
	colorCycle(128,192);
	colorCycle(192,256);
      }

      if(DEMO_SCENE==DEMO_OUTRO){
	drawTypewriter(GREETZ,dt,50,1);
	colorCycle(192,256);
      }
    }

    // FADES
    if(transitionOut>0 or transitionIn>0){
      int speed=120.0f;
      int ty=0; 
      if(transitionIn>0){
	ty = (int)transitionIn;
	transitionIn-=speed*dt; 
	transitionOut=0.0f;
	redraw = true; 
      }else
      if(transitionOut>0){
	ty = (int)(100-transitionOut);
	transitionOut-=speed*dt;
	if(transitionOut<0){
	  ty=100;
	  redraw = false;
	}
      }
      drawRectangle(0,0,SCREEN_WIDTH,ty,0);
      drawRectangle(0,SCREEN_HEIGHT-ty,SCREEN_WIDTH,SCREEN_HEIGHT,0); 
    }

    // STATS
    drawStats(timer, dt);
    //debugLinePos = drawDebugLine(debugLinePos);

    // BLIP
    memcpy(vga, buffer, SCREEN_WIDTH*SCREEN_HEIGHT);


    waitForVRetraceStart();
    dt = getDeltaTime();
    while(dt<TARGET_FRAME_TIME){
      delay(1);
      dt = getDeltaTime();
    }

    time++;
    timer+=dt;

    /*
    if(dt<targetFrameTime){
      delay((int)( (targetFrameTime-dt)*1000) );
      timer-=targetFrameTime-dt;
    }*/
  }

  delete[] buffer;
  setTextMode();
  return 0;
}
