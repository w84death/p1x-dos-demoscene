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
 *    2023/08/29: Last update
 **/

#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include font.h

const char* MARQUEE = "P1X DOS DEMO - IBM PC 486DX2/66MHZ...";
int textLength = strlen(MARQUEE);

const int SCREEN_WIDTH = 320;
const int SCREEN_HEIGHT = 200;
const int FONT_WIDTH = 8;
const int FONT_HEIGHT = 8;
const int FONT_SCALE = 4;
const int FONT_SPACE = -6;
unsigned char vgaBuffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char textBuffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};
unsigned char buffer[SCREEN_WIDTH*SCREEN_HEIGHT]={0};

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

void drawCharOnBuffer(char ch, int x, int y){
  int charIndex = ch - '!';
  int LEFT = -(int)FONT_SCALE*0.5;
  if (charIndex == -1) return;

  for (int j=0; j<FONT_HEIGHT; j++){
    for (int i=0; i<FONT_WIDTH; i++){
      if ( fontData[charIndex][j] & (0x80>>i)){
        int c =
        vgaBuffer[(y+FONT_SCALE*j)*SCREEN_WIDTH+(x+FONT_SCALE*i)];
        for(int fy=LEFT;fy<FONT_SCALE;++fy){
          for(int fx=LEFT;fx<FONT_SCALE;++fx){
            int posx = x+FONT_SCALE*i+fx;
            int posy = y+FONT_SCALE*j+fy;
            if(posx>0 & posx<SCREEN_WIDTH){
              textBuffer[posy*SCREEN_WIDTH+posx]=(c-32)%255;
            }
          }}
      }
    }
  }
}

void drawStringOnBuffer(const char* str, int x, int y, int t){
  float c=0.0f;
  while(*str){
    if(x+FONT_WIDTH*FONT_SCALE>0 & x<SCREEN_WIDTH){
      drawCharOnBuffer(*str, x, y+(int)(sin(c+t*0.25)*FONT_HEIGHT));
    }
    x+=FONT_WIDTH*FONT_SCALE+FONT_SPACE;
    str++;
    c+=FONT_WIDTH*FONT_SCALE*0.5;
  }
}

void initLineBuffer(){
  for (int x=0; x<SCREEN_WIDTH; x++){
    buffer[x] = (unsigned char)(64+(0.5f+sin(x*0.01f)*0.5f)*24);
  }
}

void drawGradient(int time){
  unsigned char* vga = (unsigned char*)0xA0000;
  const float wobble = 64.0f;
  const float speed = 0.02f;
  static int textPosition = SCREEN_WIDTH;

  memset(textBuffer,0,sizeof(textBuffer));

  for (int y=0; y<SCREEN_HEIGHT; y++){

    float squish=sin(time*speed*0.25f)*4;
    float yShift=wobble * sin((y+time)*speed);

    int shift =
    (int)(yShift*squish+SCREEN_WIDTH)%SCREEN_WIDTH;

    memcpy(vgaBuffer+y*SCREEN_WIDTH, buffer+shift, SCREEN_WIDTH-shift);
    memcpy(vgaBuffer+y*SCREEN_WIDTH+SCREEN_WIDTH-shift, buffer, shift);
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
    drawGradient(time);
    time++;
  }

  resetTextMode();
  return 0;
}
