#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <stdio.h>
#include <cstdlib>
#include "font.h"

double PI = 3.14159265358979323846;
#define PALETTE_SIZE 256
const int SCREEN_WIDTH = 320;
const int SCREEN_HEIGHT = 200;
#define FONT_WIDTH 8
#define FONT_HEIGHT 8
#define FONT_SCALE 2
#define FONT_SPACE 1
#define FONT_JUMP 8
#define FONT_COLOR 1
#define FONT_GRADIENT 2

unsigned char* vga = (unsigned char*)0xA0000;
unsigned char buffer[SCREEN_WIDTH * SCREEN_HEIGHT];
unsigned char firePal[768];
struct Star {
  float x,y,z;
};
const int STARS_MAX=300;
Star stars[STARS_MAX];
const float FOV=25.0f;
const float centerX = SCREEN_WIDTH/2;
const float centerY = SCREEN_HEIGHT/2;

const char* MARQUEE = "P1X PRESENTS A (FREE)DOS INTRO FOR IBM PC 486DX2 @66MHZ - SEP/2023 BY KKJ";
const int textLength = strlen(MARQUEE);


void setVGAMode(){
  __asm {
    mov eax, 13h
    int 10h
  }
}

void resetTextMode(){
  __asm {
    mov eax, 3h
    int 10h
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
  } // 96

  for(int i=0;i<63+32;i++){
    firePal[96+i*3]=63;
    firePal[96+i*3+1]=i*0.65;
    firePal[96+i*3+2]=21;
  } // 384

  firePal[384-3]=63;
  firePal[384-2]=63;
  firePal[384-1]=63;

  for(int i=0;i<64;i++){
    firePal[384+i*3]=16;
    firePal[384+i*3+1]=i;
    firePal[384+i*3+2]=50;
  } //576
   for(int i=0;i<64;i++){
    firePal[576+i*3]=32+i/2;
    firePal[576+i*3+1]=32+i/2;
    firePal[576+i*3+2]=(i*2)%12; 
  } //255


  for(int i=0;i<256;i++){
    SetPalette(i, firePal[i * 3], firePal[i * 3 + 1], firePal[i * 3 + 2]);
  }
}

void DrawFire(unsigned int t) {
    unsigned int w = 32;
    unsigned int h = 128;
    int shiftX = 160-(w/2);
    int shiftY = 100-(h/2);


    for (int x=0; x<w; x++) {
      unsigned int color = 0;
      double theta = PI*x/w;
      double density = sin(theta);

      if (density*(sin(t>>3+std::rand()%8))>0.15){
	color = 96+(std::rand()%32)*density;
      }
      if (density>0.9){
	color = 128-(-0.5+sin(t>>2+x)+0.5)*96;
      }
      buffer[((h+shiftY)%SCREEN_WIDTH)*SCREEN_WIDTH+x+shiftX] = color;

    }

    for (int y = shiftY; y < h+shiftY; y++) {
	for (int x = shiftX; x < w+shiftX; x++) {
	    float value = 0.0f;

	    value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];
	    value += buffer[((y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x-1)];
	    value += buffer[((+y + 1) % SCREEN_WIDTH) * SCREEN_WIDTH + (x+1)];
	    value += buffer[((+y + 2) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)];
	    value /= 4.0125;

	    int color = (int)value%128;

	    buffer[((y) % SCREEN_WIDTH) * SCREEN_WIDTH + (x)] = color;
	}
    }
}

void drawPalette() {
    unsigned int w = SCREEN_WIDTH;
    unsigned int h = SCREEN_HEIGHT;

    for (int c = 0; c < 256; c++) {
      memset(buffer+c,c,1);
    }
    for (int y=0;y<24;y++){
      memcpy(buffer+y*w,buffer,w);
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
      buffer[(y%SCREEN_WIDTH)*SCREEN_WIDTH+x]=0;
    }
    stars[i].z += 1.5f;
    screenX = (stars[i].x/stars[i].z*FOV+centerX);
    screenY = (stars[i].y/stars[i].z*FOV+centerY);

    x = (int)screenX;
    y = (int)screenY;

    if(x>0 and x<SCREEN_WIDTH and y>0 and y<SCREEN_HEIGHT){
      double theta = PI*screenX/SCREEN_WIDTH;
      double dens = 1.0f-sin(theta)*0.6;
      buffer[(y%SCREEN_WIDTH)*SCREEN_WIDTH+x]=dens*(32-32.0*(stars[i].z*0.01));
    }

    if(stars[i].z >100){
      stars[i].x=(std::rand()%SCREEN_WIDTH)-centerX;
      stars[i].y=(std::rand()%SCREEN_HEIGHT)-centerY;
      stars[i].z=1; 
    }
  }
}

void drawCharOnBuffer(char ch, int x, int y, int color, int mode){
  int charIndex =  ch - '!';
  int LEFT = -(int)FONT_SCALE*0.5;
  int grad = 0;

  if (charIndex == -1) return;

  for (int j=0; j<FONT_HEIGHT; j++){

    for (int i=0; i<FONT_WIDTH; i++){
      if ( fontData[charIndex][j] & (0x80>>i)){
	for(int fy=LEFT;fy<FONT_SCALE;++fy){
	  for(int fx=LEFT;fx<FONT_SCALE;++fx){
	    int posx = x+FONT_SCALE*i+fx;
	    int posy = y+FONT_SCALE*j+fy;
	    if(posx>0 & posx<SCREEN_WIDTH){
	      int c = color;
	      if(mode==FONT_GRADIENT){
	       c = (color+grad-LEFT+fy)%255;
	      }
	      buffer[posy*SCREEN_WIDTH+posx]=c;
	    }
	  }
	}
      }
    }
    grad+=10;
  }
}

void drawStringOnBuffer(const char* str, int x, int y, int color, int time){
  float c=0.0f;
  float  pos=0;
  while(*str){
    if(x+FONT_WIDTH*FONT_SCALE>0 & x<SCREEN_WIDTH){
      int shift=(int)( sin( pos+time*0.2f )*FONT_JUMP );
      drawCharOnBuffer(*str, x, y+shift, color, FONT_GRADIENT);
      pos+=0.1;
    }
    x+=FONT_WIDTH*FONT_SCALE+FONT_SPACE;
    str++;
    c+=FONT_WIDTH*FONT_SCALE*0.5f;
  }
}

void drawSineText(int time, int x, int y, int color){
  for (int y=0;y<32;y++){
    unsigned int color = 128;
    if(y==1 or y==30) color=128+64;
    if(y>2 and y<29) color = 8 + sin(y+time*0.5)*4;

    memset(buffer+SCREEN_WIDTH*(168+y),color,SCREEN_WIDTH);
  }
  drawStringOnBuffer(MARQUEE, x, y, color, time);
}

int main() {
  setVGAMode();
  initPalette();
  initStars();
  memset(buffer, 0, sizeof(buffer));
  //drawStars();
  //drawPalette();
  int textPosition = SCREEN_WIDTH;
  unsigned int time=0;
  const char* k="X";
  unsigned int kX = 160-6;
  unsigned int kY = 100-8;
  while(1){
    if (kbhit()&&getch()==27) break; 
    drawStars();
    unsigned int charX = kX+sin(time*0.03)*8;
    unsigned int charY = kY+16+cos(time*0.07)*32;
    unsigned int mod = 0;
    if(charY>120) mod=charY-100;
    drawCharOnBuffer(*k,charX,charY, 32+mod, FONT_COLOR);
    DrawFire(time);
    drawCharOnBuffer(*k, charX,charY, 0+mod, FONT_COLOR);
    drawSineText(time, textPosition, 178, 127);

    memcpy(vga, buffer, SCREEN_WIDTH*SCREEN_HEIGHT);

    textPosition-=FONT_SCALE;
    if (textPosition < -textLength*FONT_WIDTH*FONT_SCALE){
      textPosition = SCREEN_WIDTH;
    }
    time++;
  }

  delete[] buffer;
  resetTextMode();
  return 0;
}
