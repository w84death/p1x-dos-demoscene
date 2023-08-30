

/** 
 *    P1X DOS INTRO #01
 *
 *    Targetted hardware:
 *      - 486DX2/66Mhz
 *      - 4MB RAM
 *      - VGA
 *
 *    Open Software:
 *      - FreeDOS
 *      - OpenWatcom
 *
 *    by Krzysztof Krystian Jankowski
 *    https://krzysztofjankowski.com
 *
 *    2023/08/28: Init
 *    2023/08/30: Last update
 **/

#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include "font.h"
#include "wirerend.h"

#define PIT_CTRL 0x43
#define PIT_COUNTER0 0x40
#define SPEAKER_PORT 0x61
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 200
#define FONT_WIDTH 8
#define FONT_HEIGHT 8
#define FONT_SCALE 4
#define FONT_SPACE -2

#define TIME_SINBARS = 200
#define TIME_CUBE = 10000
#define TIME_P1X = 20000
#define TIME_END_INTRO = 50000

Vertex pyraVert[] = {
    {0, 0, 0},
    {1, 0, 0},
    {1, 0, 1},
    {0, 0, 1},
    {0.5, 1, 0.5}
};

Polygon pyraPoly[] = {
    {0, 1, 4},
    {1, 2, 4},
    {2, 3, 4},
    {3, 0, 4},
    {0, 1, 2},
    {2, 3, 0}
};

const char* MARQUEE = "P1X PRESENTS A (FREE)DOS INTRO FOR IBM PC 486DX2 @66MHZ - SEP/2023 BY KKJ";
const int textLength = strlen(MARQUEE);
unsigned char vgaBuffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char textBuffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char lineBuffer[2][SCREEN_WIDTH]={{0}};
unsigned char scrBuffer[SCREEN_WIDTH * SCREEN_HEIGHT]={0};

unsigned char bytebeat(unsigned int t) {
  return (t * (t>>8)) & t>>4;
}

void setVGAMode(){
  __asm {
    mov eax, 0013h
    int 10h
  }
}

void resetTextMode(){
  __asm {
    mov eax, 003h
    int 10h
  }
}

void setupPCSpeaker(unsigned int freq) {
  int divisor = 1193180 / freq;
  outp(0x43, 0xB6);
  outp(0x42, divisor & 0xFF);
  outp(0x42, divisor >> 8);
}

void playBeat() {
  outp(0x61, inp(0x61) | 3);
}

void resetPCSpeaker() {
  outp(0x61, inp(0x61) & 0xFC);
}

void drawCharOnBuffer(char ch, int x, int y){
  int charIndex =  ch - '!';
  int LEFT = -(int)FONT_SCALE*0.5;
  if (charIndex == -1) return;

  for (int j=0; j<FONT_HEIGHT; j++){
    for (int i=0; i<FONT_WIDTH; i++){
      if ( fontData[charIndex][j] & (0x80>>i)){
        int c = vgaBuffer[(y+FONT_SCALE*j)*SCREEN_WIDTH+(x+FONT_SCALE*i)];
        for(int fy=LEFT;fy<FONT_SCALE;++fy){
          for(int fx=LEFT;fx<FONT_SCALE;++fx){
            int posx = x+FONT_SCALE*i+fx;
            int posy = y+FONT_SCALE*j+fy;
            if(posx>0 & posx<SCREEN_WIDTH){
              textBuffer[posy*SCREEN_WIDTH+posx]=(c+32)%255;
            }
          }
        }
      }
    }
  }
}

void drawStringOnBuffer(const char* str, int x, int y, int time){
  float c=0.0f;
  float  pos=0;
  while(*str){
    if(x+FONT_WIDTH*FONT_SCALE>0 & x<SCREEN_WIDTH){
      int shift=(int)(sin(pos+time*0.2f)*FONT_HEIGHT*FONT_SCALE);
      drawCharOnBuffer(*str, x, y+shift);
      pos+=0.1;
    }
    x+=FONT_WIDTH*FONT_SCALE+FONT_SPACE;
    str++;
    c+=FONT_WIDTH*FONT_SCALE*0.5f;
  }
}

void initLineBuffer(){
  for (int x=0; x<SCREEN_WIDTH; x++){
    lineBuffer[0][x] = (unsigned char)(64+(0.5f+sin(x*0.01f)*0.5f)*24);
    lineBuffer[1][x] = (unsigned char)((0.5f+sin(x*0.01f)*0.5f)*24);
  }
}

void drawGradient(int time){
  unsigned char* vga = (unsigned char*)0xA0000;
  const float wobble = 64.0f;
  const float speed = 0.02f;
  static int textPosition = SCREEN_WIDTH;
  const int bar_size = 16;

  memset(textBuffer,0,sizeof(textBuffer));
  int bar_shift = (int)(sin(time*0.1f)*bar_size);

  for (int y=0; y<SCREEN_HEIGHT; y++){

    float squish=sin(time*speed*0.25f)*4;
    float yShift=wobble * sin((y+time)*speed);

    int shift = (int)(yShift*squish+SCREEN_WIDTH)%SCREEN_WIDTH;

    int v = 0;
    if(y>100+bar_shift-bar_size & y<100+bar_shift+bar_size){
      v=1;
    }

    memcpy(vgaBuffer+y*SCREEN_WIDTH, lineBuffer[v]+shift, SCREEN_WIDTH-shift);
    memcpy(vgaBuffer+y*SCREEN_WIDTH+SCREEN_WIDTH-shift, lineBuffer[v], shift);

  }

  drawStringOnBuffer(MARQUEE, textPosition, 96, time);
  for (int i=0;i<SCREEN_WIDTH*SCREEN_HEIGHT;i++){
    if(textBuffer[i]!=0) vgaBuffer[i]=textBuffer[i];
  }
  memcpy(vga,vgaBuffer,SCREEN_WIDTH*SCREEN_HEIGHT);

  textPosition-=FONT_SCALE;
  if (textPosition < -textLength*FONT_WIDTH*FONT_SCALE){
    textPosition = SCREEN_WIDTH;
  }
}

int main(){
  setVGAMode();
  initLineBuffer();
  int time = 0;

  while(1){
    if (kbhit()&&getch()==27) break;
    setupPCSpeaker((100+bytebeat(time+200)*100)%8000);
    playBeat();
    /* drawGradient(time); */
    WireRend::render(pyraVert, sizeof(pyraVert) / sizeof(Vertex), pyraPoly, sizeof(pyraPoly) / sizeof(Polygon), scrBuffer, SCREEN_WIDTH, SCREEN_HEIGHT);
    time++;
  }

  resetPCSpeaker();
  resetTextMode();
  return 0;
}
