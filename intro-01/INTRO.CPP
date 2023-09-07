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
#define FONT_WIDTH      8
#define FONT_HEIGHT     8
#define FONT_SCALE      2
#define FONT_SPACE      1
#define FONT_JUMP       8
#define FONT_COLOR      1
#define FONT_GRADIENT   2
#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   200
#define CENTER_X        160
#define CENTER_Y        100

#define DEMO_START      0
#define DEMO_INTRO      0
#define DEMO_HIGHWAY    150
#define DEMO_FIREPLACE  500
#define DEMO_SINEBARS   700
#define DEMO_OUTRO      1000
#define DEMO_END        1200

unsigned int DEMO_SCENE = 0;
double PI = 3.14159265358979323846;
unsigned char* vga = (unsigned char*)0xA0000;
unsigned char buffer[SCREEN_WIDTH * SCREEN_HEIGHT];
unsigned char lineBuffer[4][SCREEN_WIDTH]={{0}};
unsigned char firePal[768];
struct Star {float x,y,z;};
const int STARS_MAX=300;
Star stars[STARS_MAX];
const float FOV=25.0f;
const float centerX = SCREEN_WIDTH/2;
const float centerY = SCREEN_HEIGHT/2;
const char* MARQUEE = "P1X PRESENTS A (FREE)DOS INTRO FOR IBM PC 486DX2 @66MHZ - SEP/2023 BY KKJ";
const char* GREETZ = "GREETZ TO ALL THE DEMO SCENERS, MASTODON/FOSSTODON FOLLOWES, AND MY LOVELY MONIS!";
const int textLength = strlen(MARQUEE);
const int text2Length = strlen(GREETZ);
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

void SetPalette(int index, int r, int g, int b) {
    outp(0x03C8, index);
    outp(0x03C9, r);
    outp(0x03C9, g);
    outp(0x03C9, b);
}

void initPalette() {
  for(int i=0;i<32;i++){
    firePal[(i)*3]=i;
    firePal[(i)*3+1]=i;
    firePal[(i)*3+2]=i;
  } // grays

  for(int i=0;i<63+32;i++){
    firePal[96+i*3]=63;
    firePal[96+i*3+1]=i*0.65;
    firePal[96+i*3+2]=21;
  } // fire

  firePal[384-3]=63;
  firePal[384-2]=63;
  firePal[384-1]=63;
  // white

  for(int i=0;i<64;i++){
    firePal[384+i*3]=16;
    firePal[384+i*3+1]=i;
    firePal[384+i*3+2]=50;
  } // text

  for(int i=0;i<64;i++){
    firePal[576+i*3]=i;
    firePal[576+i*3+1]=i;
    firePal[576+i*3+2]=0; 
  } // free


  for(int i=0;i<256;i++){
    SetPalette(i, firePal[i * 3], firePal[i * 3 + 1], firePal[i * 3 + 2]);
  }
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

void animFire(unsigned int t, int w, int h){
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
      value /= 4.0525;

      color = (int)value%128;
      safeX = x%SCREEN_WIDTH;
      safeY = y%SCREEN_HEIGHT;
      buffer[(safeY<<8)+(safeY<<6)+safeX] = (unsigned int)color;
    }
  }

}
void drawFire(unsigned int t, int w, int h) {
  addFire(t,w/2,h);
  animFire(t,w,h); 
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

void drawStars(){
  for (int i=0;i<STARS_MAX;i++){
    float screenX = (stars[i].x/stars[i].z*FOV+centerX);
    float screenY = (stars[i].y/stars[i].z*FOV+centerY);

    int x = (int)screenX;
    int y = (int)screenY;
    if(x>0 and x<SCREEN_WIDTH and y>0 and y<SCREEN_HEIGHT){
      buffer[(y<<8)+(y<<6)+x] = 0;
    }
    stars[i].z -= 1.5f;
    screenX = (stars[i].x/stars[i].z*FOV+centerX);
    screenY = (stars[i].y/stars[i].z*FOV+centerY);

    x = (int)screenX;
    y = (int)screenY;

    if(x>0 and x<SCREEN_WIDTH and y>0 and y<SCREEN_HEIGHT){
      double theta = PI*screenX/SCREEN_WIDTH;
      double dens = 1.0f-sin(theta)*0.6;
       buffer[(y<<8)+(y<<6)+x] = dens*(32-32.0*(stars[i].z*0.01));
    }

    if(stars[i].z <0){
      stars[i].x=(std::rand()%SCREEN_WIDTH)-centerX;
      stars[i].y=(std::rand()%SCREEN_HEIGHT)-centerY;
      stars[i].z=100; 
    }
  }
}

void drawGradient(int startColor, int gap){
  float aspectRatio = (4.0f/3.0f)/((float)SCREEN_WIDTH/(float)SCREEN_HEIGHT);
  float maxDist = sqrt(CENTER_X*CENTER_X+CENTER_Y*CENTER_Y);
  for(int y=0;y<SCREEN_HEIGHT;y++){
    for(int x=0;x<SCREEN_WIDTH;x++){
      float ax = (x-CENTER_X)*aspectRatio;
      float ay = (y-CENTER_Y);
      float dist = sqrt((ax*ax)+(ay)*(ay));
      if(dist>gap){
	int color = (int)(startColor+(dist/maxDist)*128);
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

void drawStringOnBuffer(const char* str, int x, int y, int color, int scale, int mode, int time){
  float c=0.0f;
  float  pos=0;
  while(*str){
    if(x+FONT_WIDTH*scale>0 & x<SCREEN_WIDTH){
      int shift=(int)( sin( pos+time*0.2f )*FONT_JUMP );
      if(time<0) shift=0;
      drawCharOnBuffer(*str, x, y+shift, color, scale, mode);
      pos+=0.1;
    }
    x+=FONT_WIDTH*scale+FONT_SPACE;
    str++;
    c+=FONT_WIDTH*scale*0.5f;
  }
}

int drawSineText(int time, int x, int y, int color){
  for (int y=0;y<32;y++){
    unsigned int color = 128;
    if(y==1 or y==30) color=128+64;
    if(y>2 and y<29) color = 8 + sin(y+time*0.5)*4;
    memset(buffer+SCREEN_WIDTH*(168+y),color,SCREEN_WIDTH);
  }
  drawStringOnBuffer(MARQUEE, x, y, color,FONT_SCALE,FONT_GRADIENT,time);
  x-=FONT_SCALE;
  if (x < -textLength*FONT_WIDTH*FONT_SCALE-SCREEN_WIDTH){
    x = SCREEN_WIDTH;
  }
  return x;

}

void initSineBarsBuffer(){
  for (int x=0; x<SCREEN_WIDTH; x++){
    lineBuffer[0][x] = (unsigned char)(64+(sin(x*0.01f*0.5f)*32));
    lineBuffer[1][x] = (unsigned char)(128+32+(sin(x*0.01f*0.5f)*32));
  }
}

void drawSineBars(int time){
  const float wobble = 64.0f;
  const float speed = 0.02f;
  int barShift = (int)(sin(time*0.1f)*64);

  for (int y=0; y<SCREEN_HEIGHT; y++){
    float squish=sin(time*speed*0.25f)*4;
    float yShift=wobble * sin((y+time)*speed);
    int shift = (int)(yShift*squish+SCREEN_WIDTH)%SCREEN_WIDTH;
    int v = 0; 
    if(y<100+barShift){
      v=1;
    }

    memcpy(buffer+y*SCREEN_WIDTH, lineBuffer[v]+shift, SCREEN_WIDTH-shift);
    memcpy(buffer+y*SCREEN_WIDTH+SCREEN_WIDTH-shift, lineBuffer[v], shift);
  }
}

void drawStats(int time, float deltaTime){
    drawRectangle(2,6,128,24,4);
    drawLineH(2,128,5,40);
    drawLineH(2,128,25,40);
    char timerStr[20];
    char deltaStr[10];
    sprintf(timerStr,"DEMOTIME %d",time);
    sprintf(deltaStr,"DELTA %.0f",deltaTime);
    const char* timer = timerStr;
    const char* delter = deltaStr;
    drawStringOnBuffer(timer,4,8,127,1,FONT_COLOR,-1);
    drawStringOnBuffer(delter,4,16,127,1,FONT_COLOR,-1);
    drawPalette();
}

void drawIntro(unsigned int time){
  const char* text = "INTRO";
  if(time>DEMO_INTRO+120){
    animFire(time,128,64);
  }else{
    drawStringOnBuffer(text,135,100,127,1,FONT_COLOR,-1);
  }
}

void drawOutro(){
  const char* text = "END";
  drawStringOnBuffer(text,150,100,127,1,FONT_COLOR,-1);
}


unsigned int drawRoad(int y, int horizon, int bottom, unsigned int roadColor){
  float FOV = 1.2;
  float factor = FOV*(float)(y-horizon)/(bottom-horizon);
  int x1 = CENTER_X-factor*CENTER_X;
  int x2 = CENTER_X+factor*CENTER_X;
  drawLineH(x1,x2,y,roadColor);
  int step = (int)(0.5+factor);
  if(roadColor+step<32) roadColor+=step;
  return roadColor;
}

int drawStripes(int y, int horizon, int bottom, int nextStripe, int anim){
  unsigned int stripeColor = 192;
  float FOV = 1.2;
  int stripeMin = 1;
  int stripeMax = 18;
  int spaceMin = 1;
  int spaceMax = 120;
  int stripeLen = 60;

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
  const char* text = "HIGHWAY";
  unsigned int skyColor = 0;
  for(int y=0;y<horizon;y++){
    drawLineH(0,SCREEN_WIDTH,y,skyColor+(int)(y>>4));
  }
  drawLineH(0,SCREEN_WIDTH,horizon,1);
  drawStringOnBuffer(text,100, 40,16,2,FONT_COLOR,-1);
}

void drawHighway(unsigned int time, int horizon, int bottom){
  unsigned int roadColor = 1;
  for(int y=horizon;y<bottom;y++){
    roadColor = drawRoad(y, horizon, bottom, roadColor);
  }
}

int main() {
  setGraphicsMode();
  initPalette();
  initStars();
  initSineBarsBuffer();
  int textPosition = SCREEN_WIDTH;
  unsigned int time=DEMO_START;
  float fps=0.0f;
  const char* k="X";
  unsigned int kX = CENTER_X-6;
  unsigned int kY = CENTER_Y-8;
  int horizon = 80;
  int bottom = SCREEN_HEIGHT;
  int nextStripe = horizon;
  clock_t prevFrameTime = clock();
  memset(buffer, 0, sizeof(buffer));
  while(1){
    if (kbhit()&&getch()==27) break; 
    clock_t currentFrameTime = clock();
    float deltaTime = static_cast<float>(currentFrameTime-prevFrameTime);

    // SCENE SWITCHER
    switch(time){
      case DEMO_INTRO:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_INTRO;
	break;
      case DEMO_HIGHWAY:
	memset(buffer, 0, sizeof(buffer));
	initHighway(horizon);
	DEMO_SCENE=DEMO_HIGHWAY;
	break;
      case DEMO_FIREPLACE:
	memset(buffer, 0, sizeof(buffer));
	drawGradient(0,64);
	DEMO_SCENE=DEMO_FIREPLACE;
	break;
      case DEMO_SINEBARS:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_SINEBARS;
	break;
      case DEMO_OUTRO:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_OUTRO;
	break;
      case DEMO_END:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_START;
	time = 0;
	break;
    }

    // SCENES

    if(DEMO_SCENE==DEMO_INTRO){
      drawStars();
      drawIntro(time);
    }
    if(DEMO_SCENE==DEMO_HIGHWAY){ 
      drawHighway(time,horizon,bottom);
      nextStripe = horizon;
      int anim = (int)(time*0.75)%19; 
      for(int y=horizon;y<bottom;y++){
	nextStripe = drawStripes(y, horizon, bottom, nextStripe, anim);
      }
    }

    if(DEMO_SCENE==DEMO_FIREPLACE){ 
      unsigned int charX = kX+sin(time*0.03)*16;
      unsigned int charY = kY+8+cos(time*0.07)*24;
      drawCharOnBuffer(*k,charX,charY, 96, FONT_SCALE, FONT_COLOR);
      drawFire(time,48,104);
      drawCharOnBuffer(*k, charX,charY, 0, FONT_SCALE,FONT_COLOR);
    }

    if(DEMO_SCENE==DEMO_SINEBARS){
      drawSineBars(time);
      textPosition = drawSineText(time, textPosition, 178, 127);
    }

    if(DEMO_SCENE==DEMO_OUTRO){
      drawOutro(); 
    }

    // STATS
    drawStats(time, deltaTime);

    // BLIP
    memcpy(vga, buffer, SCREEN_WIDTH*SCREEN_HEIGHT);
    time++;
    prevFrameTime = currentFrameTime;
  }

  delete[] buffer;
  setTextMode();
  return 0;
}
