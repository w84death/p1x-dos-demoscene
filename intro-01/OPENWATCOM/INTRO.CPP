/**

  P1X DOS INTRO 01

  wcl386 -ox -fp3 -mc -or -ol -ou intro.cpp
  upx intro.exe

  (c)2023.9 Krzysztof Krystian Jankowski

*/

#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "font.h"

#define PALETTE_BANKS   7
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
#define SNAKE_2D        0


#define DEMO_INTRO      1   // STARFIELD, LOGO APEAR      [DONE]
#define DEMO_HIGHWAY    12  // CAR RUNNING TO THE CITY    [DONE]
#define DEMO_FIREPLACE  26  // FIRE,CPU, ELECTRICITY      50%
#define DEMO_SINEBARS   50  // SINETEXT,SNAKE SPRITES     [DONE]
#define DEMO_SPIRALS    64  // GREETZ, ROTATING PIXELS    [DONE]
#define DEMO_UNKNOWN    78  // TODO                       30%
#define DEMO_OUTRO      100  // TUNNEL, THE END           90%
#define DEMO_END        110  // END                       [RESTART]/QUIT

#define DRAW_DEBUG  true


struct Scene{
  char name[12];
  float time;
  int palette;
};
Scene scenes[] = {
  {"INTRO",11.0f,6},
  {"HIGHWAY",14.0f,1},
  {"FIREPLACE",24.0f,0},
  {"SNAKE",14.0f,2},
  {"SPIRALS",10.0f,3},
  {"MOON",22.0f,5},
  {"OUTRO",8.0f,4}
};

#define C 130
#define D 146
#define E 164
#define F 174
#define G 196

int DEMO_START = 0;  // SCENE TO START


float sfxLastTimer = 0.0f;
int sfxNoteIndex = 0;
float sfxNoteStartTime=0.0f;
struct Note{
  int freq;
  float duration;
};

Note tune[] = {
  {E,0.333f},
  {C,0.333f},
  {C,0.333f},
  {D,0.333f},
  {E,0.333f},
  {E,0.333f},
  {F,0.666f},
  {C,0.333f}, 
  {D,0.333f},
  {E,0.666f},
  {F,0.333f},
  {G,0.333f},
  {G,0.666f},
  {E,0.333f},
  {C,0.333f},
  {F,0.333f},
  {F,0.333f},
  {E,0.333f},
  {E,0.333f},
  {D,0.333f},
  {E,0.333f},
  {D,0.333f},
  {F,0.333f},
  {E,0.333f},
  {D,0.333f},
  {C,0.666f},
};
const int NUM_NOTES = sizeof(tune)/sizeof(Note);

unsigned char* vga = (unsigned char*)0xA0000;
unsigned char buffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char floorBuffer[SCREEN_WIDTH*SCREEN_WIDTH/2]={0};
unsigned char tunnelBuffer[SCREEN_WIDTH*SCREEN_WIDTH]={0};
unsigned char lineBuffer[4][SCREEN_WIDTH]={{0}};
unsigned char mainPal[PALETTE_BANKS][768]={{0}};
unsigned char sprite[16][SPRITE_SIZE*SPRITE_SIZE]={{0}};
unsigned int DEMO_SCENE = 0;
const float TARGET_FRAME_TIME = 1.0f/70.0f;
const double PI = 3.14159265358979323846;
const float ASPECT_RATIO = (4.0f/3.0f)/((float)SCREEN_WIDTH/(float)SCREEN_HEIGHT);
unsigned int lastDT=0;
struct Star {float x,y,z,speed;};
const int STARS_MAX=300;
Star stars[STARS_MAX];
const int POINTS_MAX=64*64;
Star points[POINTS_MAX];
const float FOV=1.1f;
const float centerX = SCREEN_WIDTH/2;
const float centerY = SCREEN_HEIGHT/2;
int palBank=0;

const char* HELLO = ""
"AFTER MORE THAN TWENTY YEARS OF "
"FOLLOWING DEMOSCENE  IT IS TIME "
"FOR ME TO STEP-IN ! THIS IS THE "
"FIRST INTRO  FROM THE P1X GROUP."
"CODED ON FREEDOS WITH  C++ OPEN "
"WATCOM, UPX, AND FED.RUNNING ON "
"ASUS EEE PC 701SD.900MHZ/1024MB.";
const char* WORKHARD = ""
"  NO  PROCESSORS  WERE  HARMED  "
"DURING DEVELOPMENT OF THIS DEMO!";
const char* MARQUEE = ""
"THIS INTRO WAS CREATED TO LEARN BASIC SCENE TRICKS "
"AND ESTABLISH A WORING ENGINE FOR FUTURE DOS INTROS...";
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

void updatePalette(int paletteID){
  for(int i=0;i<256;i++){
    setPalette(i, mainPal[paletteID][i * 3], mainPal[paletteID][i * 3 + 1], mainPal[paletteID][i * 3 + 2]);
  }
  palBank=paletteID;
}

void initPalette() {
  for(int p=0;p<PALETTE_BANKS;p++){
    switch (p){
      case 0: // fireplace
	for(int i=0;i<32;i++){
	  mainPal[p][(i)*3]=i;
	  mainPal[p][(i)*3+1]=i;
	  mainPal[p][(i)*3+2]=i;
	} // grays 32
	for(int i=0;i<63+32;i++){
	  mainPal[p][96+i*3]=63;
	  mainPal[p][96+i*3+1]=i*0.65;
	  mainPal[p][96+i*3+2]=21;
	} // fire 96
	mainPal[p][384-3]=60;
	mainPal[p][384-2]=60;
	mainPal[p][384-1]=60;
	// white 1
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=16;
	  mainPal[p][384+i*3+1]=i;
	  mainPal[p][384+i*3+2]=50;
	} // blue 64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=i;
	  mainPal[p][576+i*3+1]=i;
	  mainPal[p][576+i*3+2]=(int)(i*0.75f); 
	} // gray 64
	break;

      case 1: // highway
	for(int i=0;i<64;i++){
	  mainPal[p][(i)*3]=i;
	  mainPal[p][(i)*3+1]=i;
	  mainPal[p][(i)*3+2]=i;
	} // grays 64
	for(int i=0;i<64;i++){
	  mainPal[p][192+i*3]=(int)(i>>2);
	  mainPal[p][192+i*3+1]=(int)(i>>1);
	  mainPal[p][192+i*3+2]=(int)(i>>2);
	} // greenish 64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=(int)(i>>2);
	  mainPal[p][384+i*3+1]=0;
	  mainPal[p][384+i*3+2]=16-(int)(i>>3);
	} // sunrise 64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=(int)(i*0.8);
	  mainPal[p][576+i*3+1]=(int)(i*0.75);
	  mainPal[p][576+i*3+2]=0; 
	} // orange stripes 64

	// custom colors
	//blue light
	mainPal[p][576]=31;
	mainPal[p][577]=36;
	mainPal[p][578]=63;
	//blue dark
	mainPal[p][576+3]=12;
	mainPal[p][577+3]=15;
	mainPal[p][578+3]=63;
	//red
	mainPal[p][576+6]=63;
	mainPal[p][577+6]=4;
	mainPal[p][578+6]=4;
      break; 

      case 2: // sinebars 
	for(int i=0;i<16;i++){
	  mainPal[p][(i)*3]=i>>1;
	  mainPal[p][(i)*3+1]=i>>1;
	  mainPal[p][(i)*3+2]=i>>1;
	} // grays 16 slow
	for(int i=0;i<96;i++){
	  mainPal[p][48+i*3]=63;
	  mainPal[p][48+i*3+1]=i*0.65;
	  mainPal[p][48+i*3+2]=40;
	} // sunset 96
	for(int i=0;i<32;i++){
	  mainPal[p][288+i*3]=63;
	  mainPal[p][288+i*3+1]=56+(int)(7*sin(i*PI/63));
	  mainPal[p][288+i*3+2]=50+(int)(13*sin(i*PI/63));
	} // sun 64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=16;
	  mainPal[p][384+i*3+1]=i;
	  mainPal[p][384+i*3+2]=50;
	} // blue 64 - logo
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=16+(int)(16*(sin(i*PI/63)));
	  mainPal[p][576+i*3+1]=16+(int)(32*(sin(i*PI/63)));
	  mainPal[p][576+i*3+2]=(int)(16*(sin(i*PI/63)));
	} // green 64
      break;

      case 3: // spirtals 
	for(int i=0;i<64;i++){
	  mainPal[p][(i)*3]=i;
	  mainPal[p][(i)*3+1]=i;
	  mainPal[p][(i)*3+2]=i;
	} // grays 64
	for(int i=0;i<64;i++){
	  mainPal[p][192+i*3]=(int)(i>>2);
	  mainPal[p][192+i*3+1]=(int)(i>>2);
	  mainPal[p][192+i*3+2]=(int)(i>>1);
	} // light plume 64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=(int)(i>>2);
	  mainPal[p][384+i*3+1]=0;
	  mainPal[p][384+i*3+2]=(int)(i>>1);
	} // dark plume 64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=0;
	  mainPal[p][576+i*3+1]=(int)(54*sin(i*PI/63));
	  mainPal[p][576+i*3+2]=(int)(64*sin(i*PI/63)); 
	} // blue gradient 64
      break;

      case 4: // outro 
	for(int i=0;i<64;i++){
	  mainPal[p][(i)*3]=3+(int)(60*sin(i*PI/63));
	  mainPal[p][(i)*3+1]=16+(int)(24*sin(i*PI/63));
	  mainPal[p][(i)*3+2]=3+(int)(60*sin(i*PI/63));
	} // 64
	for(int i=0;i<64;i++){
	  mainPal[p][192+i*3]=(int)(64*sin(i*PI/63));
	  mainPal[p][192+i*3+1]=(int)(64*sin(i*PI/63));
	  mainPal[p][192+i*3+2]=i;
	} //  64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=i;
	  mainPal[p][384+i*3+1]=i;
	  mainPal[p][384+i*3+2]=i;
	} //  64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=3+(int)(60*sin(i*PI/63));
	  mainPal[p][576+i*3+1]=3+(int)(60*sin(i*PI/63));
	  mainPal[p][576+i*3+2]=3+(int)(60*sin(i*PI/63)); 
	} //  64
      break;

      case 5: // unknown
	for(int i=0;i<64;i++){
	  mainPal[p][(i)*3]=(int)(i);
	  mainPal[p][(i)*3+1]=(int)(i*0.8);
	  mainPal[p][(i)*3+2]=(int)(i);
	} //  64
	for(int i=0;i<64;i++){
	  mainPal[p][192+i*3]=2+(int)(i*0.5);
	  mainPal[p][192+i*3+1]=2+(int)(i*0.2);
	  mainPal[p][192+i*3+2]=2+(int)(i*0.9);
	} //  64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=2+(int)(i*0.2); 
	  mainPal[p][384+i*3+1]=2+(int)(i*0.3); 
	  mainPal[p][384+i*3+2]=2+(int)(i*0.4); 
	} //  64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=4;
	  mainPal[p][576+i*3+1]=12+(int)(20*sin(i*PI/127));
	  mainPal[p][576+i*3+2]=14+(int)(40*sin(i*PI/127));
	} //  64

      break;

      case 6: // aliend intro
	for(int i=0;i<64;i++){
	  mainPal[p][(i)*3]=i;
	  mainPal[p][(i)*3+1]=i;
	  mainPal[p][(i)*3+2]=i;
	} // grays 64
	for(int i=0;i<64;i++){
	  mainPal[p][192+i*3]=2;
	  mainPal[p][192+i*3+1]=2;
	  mainPal[p][192+i*3+2]=2;
	} // black 64
	for(int i=0;i<64;i++){
	  mainPal[p][384+i*3]=60;
	  mainPal[p][384+i*3+1]=60;
	  mainPal[p][384+i*3+2]=60;
	} // white 64
	for(int i=0;i<64;i++){
	  mainPal[p][576+i*3]=60-(int)(58*sin(i*PI/127));
	  mainPal[p][576+i*3+1]=60-(int)(58*sin(i*PI/127));
	  mainPal[p][576+i*3+2]=60-(int)(58*sin(i*PI/127));
	} // gradient to black 64
      break;
    }

  }
  updatePalette(0);
}

void colorCycle(int start, int end){
  int startIndex = start*3;
  int endIndex = end*3;
  int lastColor[3] = {
    mainPal[palBank][endIndex-3],
    mainPal[palBank][endIndex-2],
    mainPal[palBank][endIndex-1]
  };
  for(int i=endIndex-1;i>startIndex+2;i-=3){
    mainPal[palBank][i] = mainPal[palBank][i-3];
    mainPal[palBank][i-1] = mainPal[palBank][i-4];
    mainPal[palBank][i-2] = mainPal[palBank][i-5];
  }

  mainPal[palBank][startIndex] = lastColor[0];
  mainPal[palBank][startIndex+1] = lastColor[1];
  mainPal[palBank][startIndex+2] = lastColor[2];

  updatePalette(palBank);
}

// SFX

void sfxStart(float sound){ 
  if(sound>10.0f){
    float sfxSound = sound;
    int sfxFreq = (int)(1193180/sfxSound);

    outp(0x43,0xB6);
    outp(0x42,sfxFreq&0xFF);
    outp(0x42,(sfxFreq>>8)&0xFF);
    outp(0x61,inp(0x61)|3);
  }
}

void sfxStop(){
  outp(0x61,inp(0x61)&0xFC);
}

void playTune(float timer, float dt){
  float reduction = 0.2f;
  float decay = 0.8f;
  float noteDuration = tune[sfxNoteIndex].duration*0.333;
  float var = 4*sin(timer*100.0f);
  if(timer-sfxLastTimer >= noteDuration){
    sfxStop();
    sfxNoteIndex = (sfxNoteIndex + 1)% NUM_NOTES;
    sfxStart(tune[sfxNoteIndex].freq*0.75+var);
    sfxLastTimer = timer;
    sfxNoteStartTime = timer;
  }

  float elapsed = (timer-sfxNoteStartTime)/noteDuration;
  if(elapsed>decay){
    sfxStart((tune[sfxNoteIndex].freq*0.75+var)*(1.0-reduction*elapsed));
  }

}

// VFX

void applyAA(int start, int end){
  float value=0.0f;
  for(int y=start+1;y<end-1;y++){
    for(int x=1;x<SCREEN_WIDTH-1;x++){
      value = buffer[((y) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];
      value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x+1)];
      value += buffer[((y - 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x+1)];
      value += buffer[((+y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x-1)];
      value += buffer[((+y - 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x-1)];

      if(value>0.0f){
	value /= 5.0525f;

	int color = (int)value%255;
	int safeX = x%SCREEN_WIDTH;
	int safeY = y%SCREEN_HEIGHT;
	buffer[(safeY<<8)+(safeY<<6)+safeX] = (unsigned int)color;
      }
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

void drawLogo(int x, int y, int color){
  drawRectangle(x,y,x+5,y+100,color);
  drawRectangle(x+6,y,x+25,y+5,color);
  drawRectangle(x+6,y+55,x+25,y+60,color);
  drawRectangle(x+26,y,x+30,y+60,color);

  drawRectangle(x+40,y,x+45,y+100,color);
  drawRectangle(x+35,y+6,x+39,y+10,color);

  drawRectangle(x+56,y,x+60,y+40,color);
  drawRectangle(x+76,y,x+80,y+40,color);
  drawRectangle(x+56,y+55,x+60,y+100,color);
  drawRectangle(x+76,y+55,x+80,y+100,color);

  drawRectangle(x+61,y+41,x+65,y+45,color);
  drawRectangle(x+61,y+51,x+65,y+55,color);
  drawRectangle(x+71,y+41,x+75,y+45,color);
  drawRectangle(x+71,y+51,x+75,y+55,color);
  drawRectangle(x+66,y+46,x+70,y+50,color);
} 

void addFire(unsigned int t, int w, int h){
    int shiftX = 160-(w/2);
    int safeX = 0;
    int safeY = 0;
    unsigned int color = 0;

    for (int x=0; x<w; x++) {
      if(std::rand()%100<15){
	color = 96+(std::rand()%32); 
	if(std::rand()%100<25) color=0;
	safeX = (x+shiftX)%SCREEN_WIDTH;
	safeY = h;
	buffer[((safeY<<8)+(safeY<<6))+safeX] = (unsigned int)color;
      }
    }
}

void animFire(int w, int h){
  int shiftX = 160-(w/2);
  int safeX = 0;
  int safeY = 0;
  unsigned int color = 0;
  for (int y = 0; y < h; y++) {
    for (int x = shiftX; x < w+shiftX; x++) {
      float value = 0.0f;
      value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];
      value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x-1)];
      value += buffer[((+y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x+1)];
      value += buffer[((+y + 2) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];

      if(value>0.0f){
	value /= 4.0525f;

	color = (int)value%128;
	safeX = x%SCREEN_WIDTH;
	safeY = y%SCREEN_HEIGHT;
	buffer[(safeY<<8)+(safeY<<6)+safeX] = (unsigned int)color;
      }
    }
  }
}

void drawFire(float t, int w, int h) {
  addFire((int)t,(int)(w*0.8f),h);
  animFire(w,h); 
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

// STARS

void initStars(){
  for (int i=0;i<STARS_MAX;i++){
    stars[i].x=(std::rand()%SCREEN_WIDTH);
    stars[i].y=(std::rand()%SCREEN_HEIGHT);
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

// POINTS

void initPoints(){
  for (int i=0;i<POINTS_MAX;i++){
    points[i].x=64.0f-(std::rand()%1280)*0.1f;
    points[i].y=64.0f-(std::rand()%1280)*0.1f;
    points[i].z=0.2f+(std::rand()%160)*0.1f;
    points[i].speed=1.0f+(std::rand()%100)*0.02f;
  }
}

void drawPoints(){
  float FOV = 10.0f;

  for (int i=0;i<POINTS_MAX;i++){
    int x=(int)(points[i].x/points[i].z*FOV+CENTER_X);
    int y=(int)(points[i].y/points[i].z*FOV+CENTER_Y); 

    if(x>0 and x<SCREEN_WIDTH and y>0 and y<SCREEN_HEIGHT){
      float pos=points[i].speed; 
       buffer[(y<<8)+(y<<6)+x] = 192+(int)(64*(sin(pos*PI/1.0f)) );
       if(x>1)
	buffer[(y<<8)+(y<<6)+x-1] = 192+(int)(24*(sin((pos)*PI/1.0f)) ); 

       if(x<SCREEN_WIDTH-1)
	buffer[(y<<8)+(y<<6)+x+1] = 192+(int)(24*(sin((pos)*PI/1.0f)) ); 
    }
  }
}

void animPoints(float timer, float dt){
  float speed = dt*24.0f;
  float t = timer*2.2f;
  for (int i=0;i<POINTS_MAX;i++){
    points[i].x+=points[i].speed*speed;
    if(points[i].x>64.0f) points[i].x=-64.0f;


    if(timer>3.0f && timer<6.0f){
      speed=dt*18.0f;
    }
    if(timer>7.0f && timer<10.0f){
      speed = dt*3.5f;
      t=timer*1.1f;
    }
    if(timer>=10.0f) speed=dt*14.0f;

    float horizon = 8.0f-16.0f*sin(t+points[i].x*PI/25);
    points[i].y+=points[i].y>horizon?-speed:speed;


    //points[i].z=50+std::rand()%50;
  }
}

// GFX

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

// TEXT
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
  int pos = x;
  while(*str){
    if(pos+FONT_WIDTH*scale>0 & pos<SCREEN_WIDTH){
      int shift=(FONT_JUMP)+(int)( sin((pos*0.03f)+(timer*0.1f))*FONT_JUMP );
      if(timer<0.0f) shift=0;
      drawCharOnBuffer(*str,pos, y+shift, color, scale, mode);
    }

    pos+=FONT_WIDTH*scale+FONT_SPACE;
    str++;
  }
}

int drawSineText(float dt, float timer, int x, int y, int color, int bg){
  float speed = 240.0f;
  float bgSpeed = 8.0f;

  for (int bgY=0;bgY<32;bgY++){
    int c = bg;
    if(bgY==1 or bgY==30) c=bg+15;
    if(bgY>2 and bgY<29) c = bg + 7 + sin(bgY+timer*bgSpeed)*7;
    memset(buffer+SCREEN_WIDTH*(y+bgY),c,SCREEN_WIDTH);
  }
  drawStringOnBuffer(MARQUEE, x, y, color,2,FONT_GRADIENT,timer);
  x-=(int)speed*dt;
  if (x < -textLength*FONT_WIDTH*FONT_SCALE-SCREEN_WIDTH){
    x = SCREEN_WIDTH;
  }
  applyAA(y,y+32);
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


void drawStats(float time, float deltaTime){
    drawRectangle(2,6,48,32,4);
    drawLineH(2,48,5,40);
    drawLineH(2,48,33,40);
    char timerStr[20];
    char deltaStr[10];
    char noteStr[3];
    sprintf(timerStr,"%.1f",time);
    sprintf(deltaStr,"%.2f",deltaTime*1000);
    sprintf(noteStr,"%d",sfxNoteIndex);
    const char* timer = timerStr;
    const char* delter = deltaStr;
    const char* noter = noteStr;
    drawStringOnBuffer(timer,4,8,127,1,FONT_COLOR,-1);
    drawStringOnBuffer(delter,4,16,127,1,FONT_COLOR,-1);
    drawStringOnBuffer(noter,4,24,127,1,FONT_COLOR,-1);
    drawPalette();
}

void drawLogoAlien(int x, int y){
  drawRectangle(x,y,x+5,y+100,64);
  drawRectangle(x+6,y,x+25,y+5,64+16);
  drawRectangle(x+6,y+55,x+25,y+60,64+48);
  drawRectangle(x+26,y,x+30,y+60,64+32);

  drawRectangle(x+40,y,x+45,y+100,64+16);
  drawRectangle(x+35,y+6,x+39,y+10,64);

  drawRectangle(x+56,y,x+60,y+40,64+48);
  drawRectangle(x+76,y,x+80,y+40,64+32);
  drawRectangle(x+56,y+55,x+60,y+100,64);
  drawRectangle(x+76,y+55,x+80,y+100,64+16);

  drawRectangle(x+61,y+41,x+65,y+45,64+32);
  drawRectangle(x+61,y+51,x+65,y+55,64+16);
  drawRectangle(x+71,y+41,x+75,y+45,64);
  drawRectangle(x+71,y+51,x+75,y+55,64+16);
  drawRectangle(x+66,y+46,x+70,y+50,64+48);
}

void drawIntro(float timer, int x, int y){
  const char* text = "INTRO-01";
  if(timer>DEMO_INTRO+6.0f){
    drawStringOnBuffer(text,125,170,15,1,FONT_COLOR,-1);
  }
  drawLogoAlien(x,y);

}

void initFloorBuffer(){
  int x,y;
  float fov=250;
  int color=64;

  for(y=0;y<100;y++){
    for(x=-160;x<160;x++){
      float z=y; if(z==0)z=0.0001f;
      float fx = x/z;
      float fy = fov/z;
      if(fx<0) fx=-fx+1;
      if(fy<0) fy=-fy+1;
      int c=color+(int)(63*sin((z)*PI/320));
      if((int)fx%2==(int)fy%2) c+=64;

      int screenX = CENTER_X+x;
      int screenY = y;
      floorBuffer[(screenY<<8)+(screenY<<6)+screenX] = (unsigned char)c;
    }
  }
}

void drawTunnel(){
  int size=(SCREEN_WIDTH*SCREEN_HEIGHT);
  memcpy(buffer,tunnelBuffer,size); 
}

void initOutro(){
  drawTunnel();
  const char* text1 = "THE";
  const char* text2 = "END";
  drawStringOnBuffer(text1,140,84,0,2,FONT_GRADIENT,-1);
  drawStringOnBuffer(text2,140,104,0,2,FONT_GRADIENT,-1);
}

void drawOutro(float timer, float st){

}

void drawFireplace(float timer){
  drawFire(timer,120,80);
}


void drawFloor(){
  int half=(SCREEN_WIDTH*SCREEN_HEIGHT)>>1;
  memcpy(buffer+half,floorBuffer,half);
}

void drawSineBars(float timer, int barShift){
  const float wobble = 12.0f;
  const float speed = 2.4f;

  for (int y=0; y<100; y++){
    float squish=10*640.0f;
    float yShift=wobble+wobble*sin(((y*0.1)+timer*speed));
    int shift = (int)(yShift)%SCREEN_WIDTH;
    int v = 1;
    memcpy(buffer+y*SCREEN_WIDTH, lineBuffer[v]+shift, SCREEN_WIDTH-shift);
    memcpy(buffer+y*SCREEN_WIDTH+SCREEN_WIDTH-shift, lineBuffer[v], shift);
  }

  drawFloor();
  applyAA(0,200);
}


void initTunnelToBuffer(){
  for(int y=-100;y<100;y++){
    for(int x=-160;x<160;x++){
      int screenX = CENTER_X+x;
      int screenY = CENTER_Y+y;
      float a=(atan2(y,x)+PI)*30.0f;
      float d=998/sqrt(x*x+y*y+1);
      int color=(int)(a+d)%63;
      tunnelBuffer[(screenY<<8)+(screenY<<6)+screenX] = (unsigned char)color;
    }
  }
}

void initUnknown(){
  int x,y;
  float fov=60;

  for(y=-100;y<100;y++){
      int yy=y;
      if(y<0){
	yy*=-1;
      }
      float z=yy; if(z==0)z=0.0001f;
      float fy = fov/z;
      if(fy<0) fy=-fy+1;
      int c=64+(int)(64*sin((z)*PI/200));
      if((int)y>0) c+=64;
      int screenY = CENTER_Y+y;
      memset(buffer+screenY*SCREEN_WIDTH,c,SCREEN_WIDTH);
  }
}

void initFireplace(){
  int horizon=80;
  const char* x86 = "X86";
  const char* intel = "INTEL";
  int left=160-48;
  int right=160+48;
  int top=140-32;
  int bot=140+32;

  // clear top
  drawRectangle(0,0,SCREEN_WIDTH,horizon+2,0);

  for(int y=0;y<horizon;y++){
    int len=96-(int)(64*sin(y*PI/horizon));
    int color=2+(int)(16*sin(y*PI/horizon));

    for(float i=1.0f;i>0.1f;i-=0.25f){
      drawLineH(0,(int)(len*i),y,color+(int)(i*8));
      drawLineH(SCREEN_WIDTH-(int)(len*i),SCREEN_WIDTH,y,color+(int)(i*8)); 
    }
  }

  applyAA(0,horizon);
  drawLineH(0,SCREEN_WIDTH,horizon+2,32);

  // bg
  for(int y=horizon+3;y<SCREEN_HEIGHT;y++){
    int color=191-(int)(63*sin((y-horizon-3)*PI/(SCREEN_HEIGHT-horizon-4)));
    drawLineH(0,SCREEN_WIDTH,y,color);
  }

  // shadow
  drawRectangle(left,top,right,bot,4);
  for(int y=top+2;y<bot-5;y+=5){
    //pads
    drawRectangle(left-4,y,left,y+3,4);
    drawRectangle(right,y,right+4,y+3,4);
  }

  left--;
  right--;
  top-=2;
  bot-=2;

  // color
  int i=0;
  for(int y=top+2;y<bot-5;y+=5){

    //io lines
    int color=192;
    int mod=(int)(64*sin((y-top-2)*PI/63));
    drawRectangle(mod,y+1,SCREEN_WIDTH-mod,y+2,color+i);
    drawRectangle(mod,y+2,mod+2,SCREEN_HEIGHT,color+i);
    drawRectangle(SCREEN_WIDTH-mod-2,y+2,SCREEN_WIDTH-mod,SCREEN_HEIGHT,color+i);
    i+=4;

    //pads
    drawRectangle(left-4,y,left,y+3,30);
    drawRectangle(right,y,right+4,y+3,30);
  }

  // cpu
  drawRectangle(left,top,right,bot,16);
  for(int y=top;y<bot;y++){
    int color=16+(int)(8*sin(y*PI/64));
    drawLineH(left+1,right-1,y,color);
  }
  drawStringOnBuffer(intel,left+8,bot-26,31,1,FONT_COLOR,-1);
  drawStringOnBuffer(x86,left+8,bot-16,31,2,FONT_COLOR,-1);
}


void initSpirals(){
  int half=(SCREEN_WIDTH*SCREEN_HEIGHT)>>1;
  memcpy(buffer+half,floorBuffer,half);
}

void drawSpirals(float timer){
  int half=SCREEN_WIDTH*SCREEN_HEIGHT/2;
  memcpy(buffer+half,floorBuffer,half);

  for(int i=0;i<64;i++){
    if(i<32){
      float s = i*0.1f;
      drawPixel(160+(int)(80*sin(s+timer*1.7f)),150+(int)(24*cos(s+timer*1.6f)),4+i*1.5);
      float s2=s-0.025f;
      drawPixel(160+(int)(80*sin(s2+timer*1.7f)),150+(int)(24*cos(s2+timer*1.6f)),4+i*1.5f-2);
      float s3=s-0.05f;
      drawPixel(160+(int)(80*sin(s3+timer*1.7f)),150+(int)(24*cos(s3+timer*1.6f)),4+i*1.5f-3);
    }
    for(int j=0;j<32;j+=2){
      drawPixel(160+(int)(100*sin(-j-(i*PI/32)-timer*1.3f)),132+j+(int)(28*cos(-j-(i*PI/32)-timer*1.8f)),192+(int)(64*sin(i*PI/63)));
    }
  }
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
  drawStringOnBuffer(text,CENTER_X-((strlen(text)*FONT_WIDTH*2)>>1),50,textColor,2,FONT_COLOR,-1);

  // draw landscape far
  for(int i=20;i<300;i+=5){
    int high=3+(int)((std::rand()%32)*sin(i*PI/280));
    int size=2+std::rand()%15;
    drawRectangle(i,horizon-high,i+size,horizon,0);
  }
}

void drawCar(int carX, int carY, int maxWobble){
  int wobble = 0;
  int size=14;
  int half = (size>>1);
  int q = (size>>2);
  int wq=0;
  int i=0;
  int p=0;
  if(carX<CENTER_X-4){
    wobble = -(maxWobble*(CENTER_X-carX)/CENTER_X);
  }else if(carX>CENTER_X+4){
    wobble = (maxWobble*(carX-CENTER_X)/CENTER_X);
  }
  for(int y=carY-size;y<carY+5;y++){
    int force=wobble*(carY-y)/(size+wq);
    int c=252;

    if(i==0)      {p=15;c=192;}
    if(i==1)      {p=16;c=193;}
    if(i>1&&i<=4) {p=16;c=0;} //glass
    if(i==5)      {p=20;c=193;}
    if(i==6)      {p=21;c=193;}
    if(i==7)      {p=22;c=192;}
    if(i>7&&i<=10) {p=22;c=193;}
    if(i>10&&i<=12){p=22;c=194;} // lights
    if(i==13)     {p=23;c=63;} // bumper
    if(i==14)     {p=24;c=63;}
    if(i==15)     {p=23;c=50;}
    if(i==16)     {p=22;c=4;} // bottom
    if(i==17)     {p=21;c=4;}
    if(i==18)     {p=19;c=14;}

    drawLineH(carX-p+force,carX+p+force,y,c);

    i++;
  }
  drawRectangle(carX-15,carY+3,carX-11,carY+5,0);
  drawRectangle(carX+11,carY+3,carX+15,carY+5,0);
  drawRectangle(carX-5,carY-3,carX+5,carY-1,240);

}

void drawHighway(float timer, int horizon, int bottom){
  float roadWidth = 160.0f;
  float stripeWidth = 10.0f;
  float speed = 250.0f;
  float bendSpeed = 4.0f;
  float center = CENTER_X;

  for(int y=horizon;y<SCREEN_HEIGHT;y++){
    float factor = FOV*(float)(y-horizon)/(bottom-horizon);
    center = CENTER_X + (int)(32.0f*(sin(timer*bendSpeed*0.2+y*0.02f)+(sin(timer*bendSpeed*0.3+y*0.02f)))*factor);
    int color = (int)(40*sin((factor*y)*PI/(SCREEN_HEIGHT*2)));
    int color2 = 64+(int)(64*sin((factor*y)*PI/(SCREEN_HEIGHT*2)));
    int color3 = color2+131;
    if(color3>255)color3=255;
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
    if(x>0) drawLineH(safeX,safeX+1+(int)(factor*4.0f),y,color3);
    if(x2<SCREEN_WIDTH) drawLineH(safeX2-1-(int)(factor*4.0f),safeX2,y,color3);


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
    switch (layer){
      case SNAKE_BACK:
	if(sin(s*PI/16+timer*3.7)<0.5){
	  drawSprite(s,sx,sy);
	}
      break;
      case SNAKE_FRONT:
	if(sin(s*PI/16+timer*3.7)>=0.5){
	  drawSprite(s,sx,sy);
	} 
      break;
      case SNAKE_2D:
	 drawSprite(s,sx,sy); 
      break;
    }
  }
}

void drawCrater(int ox, int oy, int size){
  float maxDist = size>>1;
  for(int y=oy;y<oy+size*2;y++){
    for(int x=ox;x<ox+size*2;x++){
      float ax = (x-ox-(size>>1))*ASPECT_RATIO;
      float ay = y-oy-(size>>1);
      float dist = sqrt(ax*ax+ay*ay);
      int color = 32-(int)((dist/maxDist)*32);
      if(color>4 && color<16) drawPixel(x,y,color); 
    }
  }
}

void drawMoon(){
  int w=96;
  int h=96;
  float maxDist = 48;
  for(int y=0;y<h;y++){
    for(int x=160-48;x<160+48;x++){
      float ax = (x-CENTER_X)*ASPECT_RATIO;
      float ay = y-48;
      float dist = sqrt(ax*ax+ay*ay);
      int color = 24-(int)((dist/maxDist)*24);
      if(color>6) drawPixel(x,y,color); 
    }
  }

  // 120 - 200
  drawCrater(135,20,13);
  drawCrater(122,40,11);
  drawCrater(175,24,13);
  drawCrater(180,55,11);
  drawCrater(165,32,18);
  drawCrater(180,62,11);

  applyAA(0,100);
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

int main(int argc, char* argv[]) {

  setGraphicsMode();
  sfxStop();

  if(argc>1) DEMO_START=std::atoi(argv[1]);

  initPalette();
  initLineBuffer();
  initTunnelToBuffer();
  initFloorBuffer();
  initStars();
  initPoints();
  for(int i=0;i<16;i++) initSprite(i,16+(int)((i*PI/96)*96));

  int textPosition = SCREEN_WIDTH;
  unsigned int kX = CENTER_X-6;
  unsigned int kY = CENTER_Y-8;
  int horizon = 80;
  int bottom = SCREEN_HEIGHT;
  int nextStripe = horizon;
  int debugLinePos = CENTER_Y;
  float dt = 1.0f;
  float timer = DEMO_START;
  float sceneTimer = 0;
  float transitionIn = 0.0f;
  float transitionOut = 0.0f;
  bool redraw = true;
  float timeSync=0.0f;
  int hShift=0;
  int palShift=0;

  memset(buffer, 0, sizeof(buffer));

  while(1){
    if (kbhit()&&getch()==KEY_ESC) break; 
    playTune(timer,dt);

    // SCENE SWITCHER
    switch((int)timer){
      case DEMO_INTRO:
	if(DEMO_SCENE==DEMO_INTRO) break;
	memset(buffer, 0, sizeof(buffer));
	sceneTimer=0;
	palShift=0;
	redraw=true;
	updatePalette(6);
	transitionIn=100;
	DEMO_SCENE=DEMO_INTRO;
	break;
      case DEMO_HIGHWAY-FADE_TIME:
	transitionOut=100;
	break;
      case DEMO_HIGHWAY: 
	if(DEMO_SCENE==DEMO_HIGHWAY) break;
	memset(buffer, 0, sizeof(buffer));
	sceneTimer=0;
	redraw=true;
	updatePalette(1);
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
	sceneTimer=0;
	updatePalette(0);
	initFireplace();
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 180;
	writerIndex = 0;
	DEMO_SCENE=DEMO_FIREPLACE;
	break;
      case DEMO_SINEBARS-FADE_TIME:
	transitionOut=100;
	//redraw=true;
	break;
      case DEMO_SINEBARS:
	if(DEMO_SCENE==DEMO_SINEBARS) break;
	memset(buffer,0, sizeof(buffer));
	redraw=true;
	sceneTimer=0;
	transitionIn=100;
	updatePalette(2);
	textPosition = SCREEN_WIDTH;
	DEMO_SCENE=DEMO_SINEBARS;
	break;
      case DEMO_SPIRALS-FADE_TIME:
	transitionOut=100;
	break;

      case DEMO_SPIRALS:
	if(DEMO_SCENE==DEMO_SPIRALS) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	sceneTimer=0;
	updatePalette(3);
	initSpirals();
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 25;
	writerIndex = 0;
	DEMO_SCENE=DEMO_SPIRALS;
	break;

      case DEMO_UNKNOWN -FADE_TIME:
	transitionOut=100;
	break;

      case DEMO_UNKNOWN:
	if(DEMO_SCENE==DEMO_OUTRO) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	sceneTimer=0;
	updatePalette(5);
	initUnknown();
	DEMO_SCENE=DEMO_UNKNOWN;
	break;

      case DEMO_OUTRO -FADE_TIME:
	transitionOut=100;
	break;

      case DEMO_OUTRO:
	if(DEMO_SCENE==DEMO_OUTRO) break;
	memset(buffer, 0, sizeof(buffer));
	redraw=true;
	sceneTimer=0;
	updatePalette(4);
	initOutro();
	writerDelayCount = 0;
	writerX = writerStart;
	writerY = 88;
	writerIndex = 0;
	DEMO_SCENE=DEMO_OUTRO;
	break;

      case DEMO_END -FADE_TIME:
	transitionOut=100;
	break;

      case DEMO_END:
	memset(buffer, 0, sizeof(buffer));
	DEMO_SCENE=DEMO_START;
	timer = 0;
	sceneTimer= 0;
	sfxLastTimer = 0;
	sfxNoteIndex = dt;
	sfxStop();
	break;
    }

    // SCENES

    if(redraw){

      switch(DEMO_SCENE){
	case DEMO_INTRO:
	  drawStars(dt);
	  drawIntro(timer,120,45);
	  if(palShift<127 && sceneTimer>2.0f && (int)(timer*10.0f)%2==0){
	    colorCycle(64,255);
	    palShift++;
	  } 
	  break;

	case DEMO_HIGHWAY:
	  drawHighway(timer,horizon,bottom);
	  drawCar(CENTER_X+sin(timer*0.9f)*36,128,10);
	  drawTypewriter(HELLO,dt,63,1);
	  break;

	case DEMO_FIREPLACE: 
	  drawFireplace(timer);
	  drawTypewriter(WORKHARD,dt,127,1);
	  colorCycle(192,256);
	  break;

	case DEMO_SINEBARS: 
	  //hShift = (int)(sin(timer*0.5f)*32);
	  drawSineBars(timer, 0);
	  drawSnake(timer, hShift, SNAKE_BACK);
	  textPosition = drawSineText(dt,timer, textPosition,84, 128,0);
	  drawSnake(timer ,hShift, SNAKE_FRONT);
	  colorCycle(128,192);
	  colorCycle(128,192);
	  colorCycle(128,192);
	  break;

	case DEMO_SPIRALS:
	  drawTypewriter(GREETZ,dt,63,1);
	  drawSpirals(timer);
	  colorCycle(192,256);
	break;

	case DEMO_UNKNOWN:
	  memset(buffer, 2, sizeof(buffer));
	  drawFloor();
	  drawMoon();
	  drawLogo(120,45,32);
	  animPoints(sceneTimer,dt);
	  drawPoints();
	  //colorCycle(64,192);
	  //colorCycle(192,255);
	break;

	case DEMO_OUTRO:
	  drawOutro(timer,sceneTimer);
	  drawTypewriter(BYE,dt,63,1); 
	  colorCycle(0,64);
	break;

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
    if(DRAW_DEBUG) drawStats(timer, dt);

    // BLIP
    memcpy(vga, buffer, SCREEN_WIDTH*SCREEN_HEIGHT);

    waitForVRetraceStart();
    dt = getDeltaTime();
    while(dt<TARGET_FRAME_TIME){
      delay(1);
      dt = getDeltaTime();
    }

    timer+=dt;
    sceneTimer+=dt;
  }

  sfxStop();
  delete[] buffer;
  delete[] floorBuffer;
  delete[] tunnelBuffer;
  delete[] lineBuffer;
  delete[] mainPal;
  delete[] sprite;

  setTextMode();
  return 0;
}
