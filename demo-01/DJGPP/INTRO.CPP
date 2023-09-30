#include <stdio.h>
#include <cstring>
#include <dos.h>
#include <conio.h>
#include <dpmi.h>
#include <math.h>
#include "font.h"

#define WIDTH           320
#define HEIGHT          200
#define CX              160
#define CY              100
#define PIXELS          64000
#define PIT_FREQ        1193182L
#define PI              M_PI
#define VFX_STARS_MAX   300
#define VFX_STARS_MAX_Z 500.0f
#define VFX_MOTHS_MAX   150
#define FONT_SIZE       8
#define FONT_COLOR      1
#define FONT_GRADIENT   2
#define FONT_TRANS      3

const float TARGET_FRAME_TIME=1.0f/70.0f;
const float ASPECT_RATIO=(4.0f/3.0f)/((float)WIDTH/(float)HEIGHT);
unsigned char buffer[PIXELS]={0};
unsigned char buffer2[PIXELS]={0};
int palette_active_bank_id=0;
int delta_time_last=0;

struct Color {
        unsigned char r;
        unsigned char g;
        unsigned char b;
};
Color palette[256];

struct Timer {
    float dt;
    float demo;
    float scene;
};

struct Scene{
  int id;
  char name[12];
  float length;
  int palette;
};

Scene screenplay[] = {
  {0,"...",0.0f,0},
  {1,"INTRO",10.0f,0},
  {2,"MOTHS",20.0f,0},
  {8,"OUTRO",4.0f,0}
  /*
  {"HIGHWAY",14.0f,1},
  {"FIREPLACE",24.0f,0},
  {"SNAKE",14.0f,2},
  {"SPIRALS",10.0f,3},
  {"MOON",22.0f,5},
  */
};
int current_scene=0;

struct Vert {float x,y,z,speed;};
Vert vfx_stars_mem[VFX_STARS_MAX];
Vert vfx_moths_mem[VFX_MOTHS_MAX];
int scene_intro_cycle = 0;


void hw_set_video_mode(unsigned char mode);
float hw_delta_time_get();
void hw_wait_for_vretrace_start();
void sys_frame_ms_draw(Timer timer);
void gfx_pixel_draw(int x, int y, unsigned char color);
void gfx_line_simple_draw(int x1, int x2, int y, int color);
void gfx_rectangle_draw(int x1, int y1, int x2, int y2, int color);
void gfx_sphere_draw(int x, int y, int size);
void palette_hw_color_update(int index, Color pal);
void palette_set(int bank_id);
void palette_color_cycle(int start, int end);
void palette_draw_preview();
void font_string_render(const char* str, int x, int y, int color, int scale, int mode);
void font_char_render(char ch, int x, int y, int color, int scale, int mode);
void sprite_moon_draw(int x, int y);
void sprite_crater_draw(int ox, int oy, int size);
void vfx_stars_init();
void vfx_stars_tick(float timer, float speed);
void vfx_stars_render();
void vfx_sinetext_render(char *string, float dt, float timer, int x, int y, int color, int bg);
void vfx_moths_tick(float dt, float timer, float speed);
void vfx_moths_render(float timer, int extra);
void vfx_aa_apply(int start, int end);
void scene_intro_init();
void scene_intro_render(Timer timer);
void scene_intro_reset();
void scene_moths_init();
void scene_moths_render(Timer timer);
void scene_moths_reset();
void scene_outro_init();
void scene_outro_render(Timer timer);

/*
 * VGA
 */
void hw_set_video_mode(unsigned char mode) {
    __dpmi_regs regs;
    regs.x.ax=mode;
    __dpmi_int(0x10,&regs);
}

float hw_delta_time_get(){
  outp(0x43,0x00);
  unsigned int count = inp(0x40);
  count |= (unsigned int)inp(0x40)<<8;
  unsigned int elapsed;
  if(count<=delta_time_last){
    elapsed = delta_time_last - count;
  }else{
    elapsed = (0x10000-count)+delta_time_last;
  }
  delta_time_last = count;
  return (float)elapsed/PIT_FREQ;
}

void hw_wait_for_vretrace(){
  while(inp(0x3DA)&8);
  while(!(inp(0x3DA)&8));
}


/*
 * SYSTEM HELPERS
 */
void sys_frame_ms_draw(Timer timer){
  char timer_demo_str[20];
  char timer_delta_str[20];
  char timer_scene_str[20];

  sprintf(timer_demo_str,"%.1f",timer.demo);
  sprintf(timer_scene_str,"%.1f",timer.scene);
  sprintf(timer_delta_str,"%.2f",timer.dt*1000);

  const char* timer_demo = timer_demo_str;
  const char* timer_scene = timer_scene_str;
  const char* timer_delta = timer_delta_str;

  gfx_rectangle_draw(2,2,48,32,8);
  font_string_render(timer_delta,4,4,63,1,FONT_COLOR);
  font_string_render(timer_scene,4,13,63,1,FONT_COLOR);
  font_string_render(timer_demo,4,22,63,1,FONT_COLOR);
};


/* 
 * FONT
 */
void font_char_render(char ch, int x, int y, int color, int scale, int mode){
  const int char_index =  ch - '!';
  if (char_index == -1) return;
  
  const int LEFT = -(int)scale*0.5;
  int gradient_pos = 0;
  int j,i,fx,fy,posx,posy,c;
  
  for (j=0; j<FONT_SIZE; j++){
    for (i=0; i<FONT_SIZE; i++){
      if ( font_data[char_index][j] & (0x80>>i)){
        for(fy=LEFT;fy<scale;++fy){
          for(fx=LEFT;fx<scale;++fx){
            posx = x+scale*i+fx;
            posy = y+scale*j+fy;
            if(posx>0 & posx<WIDTH){
              c = color;
              if(mode==FONT_GRADIENT){
               c = (color+gradient_pos-LEFT+fy)%255;
              }
              buffer[(posy<<8)+(posy<<6)+posx] = c;
            }
          }
        }
      }
    }
    gradient_pos+=FONT_SIZE;
  }
}

void font_string_render(const char* str, int x, int y, int color, int scale, int mode){
  int pos = x;

  while(*str){
    font_char_render(*str,pos,y,color,scale,mode);
    pos+=FONT_SIZE*scale+1;
    str++;
  }
}


/*
 * GFX (2D DRAWING PRIMITIVES)
 */
void gfx_pixel_draw(int x, int y, unsigned char color) {
    buffer[(y<<8)+(y<<6)+x] = color;
}

void gfx_line_simple_draw(int x1, int x2, int y, int color){
  int temp;
  if (x1>x2){
    temp = x1;
    x1 = x2;
    x2 = temp;
  }
  memset(buffer+((y<<8)+(y<<6)+x1),(unsigned char)color, x2-x1+1);
}

void gfx_rectangle_draw(int x1, int y1, int x2, int y2, int color){
  unsigned char *startOffset;
  int width;
  startOffset = buffer+( (y1<<8)+(y1<<6))+x1;
  width = 1+x2-x1;
  while(y1++<=y2){
    memset((unsigned char *)startOffset,(unsigned char)color,width);
    startOffset+=320;
  }
}

void gfx_sphere_draw(int ox, int oy, int size){
  float dist = size>>1;
  int half = size>>1;
  for(int y=oy-half;y<oy+half;y++){
    for(int x=ox-half;x<ox+half;x++){
      if(x>0 && x<WIDTH && y>0 && y<HEIGHT){
        float ax = (x-ox)*ASPECT_RATIO;
        float ay = y-oy;
        float d = sqrt(ax*ax+ay*ay);
        int color = 32-(int)((d/dist)*32);
        if(color>4) buffer[(y<<8)+(y<<6)+x]=color;
      }
    }
  }
}

/*
 * PALETTE
 */
void palette_hw_color_update(int index, Color pal) {
    outp(0x03C8, index);
    outp(0x03C9, pal.r);
    outp(0x03C9, pal.g);
    outp(0x03C9, pal.b);
}

void palette_set(int bank_id){
    int i;
    switch(bank_id){
      case 0: // INTRO
        for(i=0;i<64;i++){
            palette[i].r=i;
            palette[i].g=i;
            palette[i].b=i;
        }
        for(i=0;i<64;i++){
            palette[64+i].r=4;
            palette[64+i].g=4;
            palette[64+i].b=4;
        }
        for(i=0;i<64;i++){
            palette[128+i].r=60;
            palette[128+i].g=60;
            palette[128+i].b=60;
        }
        for(i=0;i<64;i++){
            palette[192+i].r=60-(int)(52*sin(i*PI/127));
            palette[192+i].g=60-(int)(52*sin(i*PI/127));
            palette[192+i].b=60-(int)(52*sin(i*PI/127));
        }
        break;
    }

    for(i=0;i<256;i++){
        palette_hw_color_update(i, palette[i]);
    }
    palette_active_bank_id=bank_id;
}

void palette_color_cycle(int start, int end){
  int i;
  Color last_color = palette[end];
  for(i=end;i>start;i--){
    palette[i] = palette[i-1];
    palette_hw_color_update(i, palette[i]);
  }
  palette[start] = last_color;
  palette_hw_color_update(i, palette[i]);
}


void palette_draw_preview() {
    int i;
    for (i = 0; i < 256; i++) {
      memset(buffer+i,i,1);
    }
    for (i=1;i<4;i++){
      memcpy(buffer+i*320,buffer,256);
    }
}


/*
 * VISUAL EFFECTS
 */
Vert vfx_stars_get_one(){
    int size = (int)VFX_STARS_MAX_Z<<1;
    return {
        (float)(size-rand()%(size<<1)),
        (float)(size-rand()%(size<<1)),
        (float)(rand()%(int)VFX_STARS_MAX_Z+1),
        (float)(20+rand()%100)
    };
}

void vfx_stars_init(){
  for (int i=0;i<VFX_STARS_MAX;i++){
    vfx_stars_mem[i]=vfx_stars_get_one();
  }
}

void vfx_stars_tick(float dt, float speed){
  int i;
  for (i=0;i<VFX_STARS_MAX;i++){
    vfx_stars_mem[i].z -= vfx_stars_mem[i].speed*speed*dt;       
    if(vfx_stars_mem[i].z<0.0f){
      vfx_stars_mem[i]=vfx_stars_get_one();
    }
  }
}

void vfx_stars_render(float timer){
  const int FOV=20;
  int i,x,y;
  float sx,sy,sz;
  
  for (i=0;i<VFX_STARS_MAX;i++){
    sx=vfx_stars_mem[i].x;
    sy=vfx_stars_mem[i].y;
    sz=vfx_stars_mem[i].z;
    x=(int)(sx/sz*FOV+CX);
    y=(int)(sy/sz*FOV+CY);

    if(x>0 && x<WIDTH && y>0 && y<HEIGHT){    
        buffer[(y<<8)+(y<<6)+x] = 63-(int)(60*(sin(sz*PI/(VFX_STARS_MAX_Z*2))));
    }
  }
}

Vert vfx_moths_get_one(){
    int size = (int)VFX_STARS_MAX_Z<<1;
    return {
        (float)(100-rand()%200),
        (float)(100-rand()%200),
        (float)(10+rand()%50),
        (float)(25+rand()%125)
    };
}

void vfx_moths_init(){
  int i;
  for (i=0;i<VFX_MOTHS_MAX;i++){
    vfx_moths_mem[i]=vfx_moths_get_one();
  }
}
void vfx_moths_tick(float dt, float timer, float speed){
  int i;
  for (i=0;i<VFX_MOTHS_MAX;i++){
    vfx_moths_mem[i].z += sin(i+timer*0.2f)*.3f;
    vfx_moths_mem[i].x += sin(i+vfx_moths_mem[i].z*0.6f)*.5f;
    vfx_moths_mem[i].y += cos(i+vfx_moths_mem[i].z*0.7f)*.5f;
  }
}

void vfx_moths_render(float timer, int extra){
  const int FOV=20;
  int i,x,y;
  float sx,sy,sz;

  for (i=0;i<VFX_MOTHS_MAX;i++){
    sx=vfx_moths_mem[i].x;
    sy=vfx_moths_mem[i].y;
    sz=vfx_moths_mem[i].z;
    x=(int)(sx/sz*FOV+CX);
    y=(int)(sy/sz*FOV+CY);

    if(x>0 && x<WIDTH && y>0 && y<HEIGHT){    
      buffer[(y<<8)+(y<<6)+x] = 63-(int)(60*(sin(sz*PI/(VFX_STARS_MAX_Z*2))));

      if(extra>0 && x>4 && x<WIDTH-4 && y>4){
       buffer[((y)<<8)+((y)<<6)+x-2]=(int)(i+timer*100)%24>12?32:6;
       buffer[((y)<<8)+((y)<<6)+x+2]=(int)(i+timer*100)%24>12?6:32;
      }
    }
  }
}


void vfx_sinetext_render(char *string, float dt, float timer, int x, int y, int color, int bg){
  float speed = 240.0f;
  float bgSpeed = 8.0f;

  for (int bgY=0;bgY<32;bgY++){
    int c = bg;
    if(bgY==1 or bgY==30) c=bg+15;
    if(bgY>2 and bgY<29) c = bg + 7 + sin(bgY+timer*bgSpeed)*7;
    memset(buffer+WIDTH*(y+bgY),c,WIDTH);
  }
  
  font_string_render(string, x, y, color,2,FONT_GRADIENT);
}

void vfx_aa_apply(int start, int end){
  float value=0.0f;
  for(int y=start+1;y<end-1;y++){
    for(int x=1;x<WIDTH-1;x++){
      value = buffer[((y) % WIDTH)*WIDTH+(x)];
      value += buffer[((y + 1) % WIDTH)*WIDTH + (x+1)];
      value += buffer[((y - 1) % WIDTH)*WIDTH + (x+1)];
      value += buffer[((+y + 1) %WIDTH)*WIDTH + (x-1)];
      value += buffer[((+y - 1) %WIDTH)*WIDTH + (x-1)];

      if(value>0.0f){
      value /= 5.0525f;

      unsigned char color = (unsigned char)value%255;
      buffer[(y<<8)+(y<<6)+x] = color;
      }
    }
  }
}


/*
 * SPRITES
 */
void sprite_crater_draw(int ox, int oy, int size){
  float maxDist = size>>1;
  for(int y=oy;y<oy+size*2;y++){
    for(int x=ox;x<ox+size*2;x++){
      float ax = (x-ox-(size>>1))*ASPECT_RATIO;
      float ay = y-oy-(size>>1);
      float dist = sqrt(ax*ax+ay*ay);
      int color = 32-(int)((dist/maxDist)*32);
      
      if(color>4 && color<16) buffer[(y<<8)+(y<<6)+x]=color;
    }
  }
}

void sprite_moon_draw(int x, int y){
  int r,i,cx,cy,cr;
  int moon_size=96;
  gfx_sphere_draw(x,y,moon_size);

  for(i=0;i<12;i++){
    cx=x+20-rand()%(moon_size>>1);
    cy=y+20-rand()%(moon_size>>1);
    cr=6+rand()%12;
    sprite_crater_draw(cx,cy,cr);
  }
}

void sprite_logo_animated_draw(int x, int y){  
  gfx_rectangle_draw(x,y,x+5,y+100,64);
  gfx_rectangle_draw(x+6,y,x+25,y+5,64+16);
  gfx_rectangle_draw(x+6,y+55,x+25,y+60,64+48);
  gfx_rectangle_draw(x+26,y,x+30,y+60,64+32);

  gfx_rectangle_draw(x+40,y,x+45,y+100,64+16);
  gfx_rectangle_draw(x+35,y+6,x+39,y+10,64);

  gfx_rectangle_draw(x+56,y,x+60,y+40,64+48);
  gfx_rectangle_draw(x+76,y,x+80,y+40,64+32);
  gfx_rectangle_draw(x+56,y+55,x+60,y+100,64);
  gfx_rectangle_draw(x+76,y+55,x+80,y+100,64+16);

  gfx_rectangle_draw(x+61,y+41,x+65,y+45,64+32);
  gfx_rectangle_draw(x+61,y+51,x+65,y+55,64+16);
  gfx_rectangle_draw(x+71,y+41,x+75,y+45,64);
  gfx_rectangle_draw(x+71,y+51,x+75,y+55,64+16);
  gfx_rectangle_draw(x+66,y+46,x+70,y+50,64+48);
}

void scene_intro_init(){
  vfx_stars_init();
  scene_intro_cycle=0;
}

void scene_intro_render(Timer timer){
  const char* text = "DEMO-01";
  vfx_stars_tick(timer.dt,2.0f);
  vfx_stars_render(timer.scene);
  sprite_logo_animated_draw(120,45);
  if(timer.scene>4.0f && scene_intro_cycle<128){
    palette_color_cycle(64,255);
    scene_intro_cycle++;
  }
  if(timer.scene>6.0f){
    font_string_render(text,125,170,15,1,FONT_COLOR);
  }
}

/*
 * SCENES
 */
void scene_intro_reset(){
  scene_intro_init();
}
void scene_moths_init(){
  vfx_moths_init();
  sprite_moon_draw(CX,24);
  gfx_sphere_draw(CX,CY,32);
  vfx_aa_apply(0,200);
  memcpy(buffer2,buffer,PIXELS);
}
void scene_moths_render(Timer timer){
  vfx_moths_tick(timer.dt,timer.scene,4.0f);
  memcpy(buffer,buffer2,PIXELS);
  vfx_moths_render(timer.scene,1);
}
void scene_moths_reset(){
  scene_moths_init();
}

void scene_outro_init(){
}

void scene_outro_render(Timer timer){
  const char* text="THE END";
  font_string_render(text,CX-24,CY-4,15,1,FONT_COLOR);
}

/*
 * MAIN LOOP
 */
int main() {
  Timer timer={0,0,0};
  hw_set_video_mode(0x13);

  // MAIN LOOP
  while(1){
    /*
     * KEYBOARD
     */
    if (kbhit()) break;

    /*
     * DRAW SCENE
     */
    memset(buffer, 4, PIXELS);

    
    /*
     * SCENE SWITCHER
     */
    if((int)timer.scene==screenplay[current_scene].length){
      current_scene++;
      timer.scene=0.0f;
      palette_set(screenplay[current_scene].palette);
      switch(screenplay[current_scene].id){
       case 1:
         scene_intro_init();
         break;
       case 2:
         scene_moths_init();
         break;
       case 8:
         scene_outro_init();
         break;
      }

      if(current_scene>(sizeof(screenplay)/sizeof(Scene))){
        current_scene=0;
        timer.demo=0.0f;
      }
    }

    /*
     * SCENE RENDERER
     */
    switch(screenplay[current_scene].id){
      case 1:
        scene_intro_render(timer);
        break;
      case 2:
        scene_moths_render(timer);
        break;
      case 8:
        scene_outro_render(timer);
        break;
    }

    /*
     * DEBUG
     */
    palette_draw_preview();
    sys_frame_ms_draw(timer);

    /*
     * BLIP VGA SCREEN
     */
    dosmemput(buffer,PIXELS,0xA0000);

    /*
     * TIMERS
     */
    hw_wait_for_vretrace();
    timer.dt = hw_delta_time_get();
    timer.demo+=timer.dt;
    timer.scene+=timer.dt;
  }

  hw_set_video_mode(0x03);
  return 0;
}

