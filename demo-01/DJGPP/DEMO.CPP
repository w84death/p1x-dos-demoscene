/*
 * P1X DOS DEMO-01
 * 
 * Made in RHIDE, DJGPP, UPX
 * 
 * (c)2023.9 Krzysztof Krystian Jankowski
 * http(s)://krzysztofjankowski.com
*/

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

#define FONT_SIZE       8
#define FONT_COLOR      1
#define FONT_GRADIENT   2
#define FONT_TRANS      3

#define SCENES          9
#define VFX_STARS_MAX   300
#define VFX_STARS_MAX_Z 500.0f
#define VFX_MOTHS_MAX   150

const float TARGET_FRAME_TIME=1.0f/70.0f;
const float ASPECT_RATIO=(4.0f/3.0f)/((float)WIDTH/(float)HEIGHT);
unsigned char buffer[PIXELS]={0};
unsigned char buffer2[PIXELS]={0};

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


struct Vert {
  float x,y,z,speed;
};

Scene screenplay[SCENES] = {
  {0,"...",0.0f,0},
  {1,"INTRO",10.0f,0},
  {2,"HIGHWAY",18.0f,1},
  {3,"MOTHS",10.0f,0},
  {4,"FIREPLACE",2.0f,2},
  {5,"SNAKE",2.0f,3},
  {6,"SPIRALS",2.0f,4},
  {7,"MOON",2.0f,5},
  {8,"OUTRO",2.0f,0}
};

int current_scene=0;
int palette_active_bank_id=0;
int delta_time_last=0;

int scene_intro_cycle = 0;
Vert vfx_stars_mem[VFX_STARS_MAX];
Vert vfx_moths_mem[VFX_MOTHS_MAX];

/*
 * --------------------------------------------------------- FUNCTIONS
 */
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
 * --------------------------------------------------------- VGA
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
 * --------------------------------------------------------- SYSTEM HELPERS
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

  gfx_rectangle_draw(WIDTH-50,2,WIDTH-2,32,8);
  font_string_render(timer_delta,WIDTH-48,4,63,1,FONT_COLOR);
  font_string_render(timer_scene,WIDTH-48,13,63,1,FONT_COLOR);
  font_string_render(timer_demo,WIDTH-48,22,63,1,FONT_COLOR);
};


/* 
 * --------------------------------------------------------- FONT
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
 * --------------------------------------------------------- GFX (2D DRAWING PRIMITIVES)
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
 * --------------------------------------------------------- PALETTE
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
      case 0: // INTRO, MOTHS
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
      case 1: // HIGHWAY
        for(i=0;i<64;i++){
            palette[i].r=i;
            palette[i].g=i;
            palette[i].b=i;
        }
        for(i=0;i<64;i++){
            palette[64+i].r=(int)(i>>2);
            palette[64+i].g=(int)(i>>1);
            palette[64+i].b=(int)(i>>2);
        }
        for(i=0;i<64;i++){
            palette[128+i].r=(int)(i>>2);
            palette[128+i].g=0;
            palette[128+i].b=16-(int)(i>>3);
        }
        for(i=0;i<64;i++){
            palette[192+i].r=(int)(i*0.8);
            palette[192+i].g=(int)(i*0.75);
            palette[192+i].b=0;
        }
        	// custom colors
            //blue light
            palette[192].r=31;
            palette[192].g=36;
            palette[192].b=63;
            //blue dark
            palette[193].r=12;
            palette[193].g=15;
            palette[193].b=63;
            //red
            palette[194].r=63;
            palette[194].g=4;
            palette[194].b=4;
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
 * --------------------------------------------------------- VISUAL EFFECTS
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
 * --------------------------------------------------------- SPRITES
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



/*
 * --------------------------------------------------------- SCENES
 */

/*
 * --------------------------------------------------------- INTRO
 */
void scene_intro_init(){
  vfx_stars_init();
  scene_intro_cycle=0;
}
void scene_intro_reset(){
  scene_intro_init();
}
void scene_intro_render(Timer timer){
  const char* text = "DEMO-01";
  vfx_stars_tick(timer.dt,2.0f);

  memset(buffer,4,PIXELS);
  vfx_stars_render(timer.scene);
  sprite_logo_animated_draw(120,45);
  if(timer.scene>4.0f && scene_intro_cycle<128){
    palette_color_cycle(64,255);
    scene_intro_cycle++;
  }
  if(timer.scene>6.0f){
    font_string_render(text,CX-(strlen(text)*FONT_SIZE>>1),170,15,1,FONT_COLOR);
  }
}

/*
 * --------------------------------------------------------- HIGHWAY
 */
void scene_highway_init(){}
void scene_highway_reset(){
  const char* text = "SEPTEMBER 2023";
  const int horizon = 80;
  int i,y;
  memset(buffer, 4, PIXELS);
  for(y=0;y<horizon;y++){
    int color = 128+(int)(y>>1);
    if(color>191) color = 191;
    gfx_line_simple_draw(0,WIDTH,y,color);
  }

  gfx_line_simple_draw(0,WIDTH,horizon,1);
  font_string_render(text,CX-((strlen(text)*FONT_SIZE*2)>>1),40,170,2,FONT_COLOR);

  // draw cityscape
  for(i=20;i<300;i+=5){
    int high=3+rand()%32*sin(i*PI/280);
    int size=2+rand()%15;
    gfx_rectangle_draw(i,horizon-high,i+size,horizon,0);
  }
}
void sprite_car_draw(int car_x, int car_y, int wobble_size){
  int wobble = 0;
  int size=14;
  int half = (size>>1);
  int q = (size>>2);
  int wq=0;
  int i,y;
  int p=0;
  if(car_x<CX-4){
    wobble = -(wobble_size*(CX-car_x)/CX);
  }else if(car_x>CX+4){
    wobble = (wobble_size*(car_x-CX)/CX);
  }
  for(y=car_y-size;y<car_y+5;y++){
    int force=wobble*(car_y-y)/(size+wq);
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

    gfx_line_simple_draw(car_x-p+force,car_x+p+force,y,c);

    i++;
  }
  gfx_rectangle_draw(car_x-15,car_y+3,car_x-11,car_y+5,0);
  gfx_rectangle_draw(car_x+11,car_y+3,car_x+15,car_y+5,0);
  gfx_rectangle_draw(car_x-5,car_y-3,car_x+5,car_y-1,240);
}

void vfx_highway_draw(float timer, int horizon, int bottom){
  const float road_wide = 160.0f;
  const float stripe_wide = 10.0f;
  const float speed = 250.0f;
  const float bend_speed = 4.0f;
  const float FOV=1.1f;
  float center = CX;

  for(int y=horizon;y<HEIGHT;y++){
    float factor = FOV*(float)(y-horizon)/(bottom-horizon);
    center = CX + (int)(32.0f*(sin(timer*bend_speed*0.2+y*0.02f)+(sin(timer*bend_speed*0.3+y*0.02f)))*factor);
    int color = (int)(40*sin((factor*y)*PI/(HEIGHT*2)));
    int color2 = 64+(int)(64*sin((factor*y)*PI/(HEIGHT*2)));
    int color3 = color2+131;
    if(color3>255)color3=255;
    int x = (int)(center-factor*road_wide);
    int safeX = (x>0)?x:0;
    int x2 = (int)(center+factor*road_wide);
    int safeX2 = (x2<WIDTH)?x2:WIDTH;

    // terrain
    if((int)((timer*speed)+(y/factor))%200>100){
      color2 = (color2+4<128)?color2+4:127;
    }
    gfx_line_simple_draw(0,WIDTH,y,color2);

    // road
    gfx_line_simple_draw(safeX,safeX2,y,color);
    if(x>0) gfx_line_simple_draw(safeX,safeX+1+(int)(factor*4.0f),y,color3);
    if(x2<WIDTH) gfx_line_simple_draw(safeX2-1-(int)(factor*4.0f),safeX2,y,color3);

    // stripes
    x = (int)(center-factor*stripe_wide);
    safeX = (x>0)?x:0;
    x2 = (int)(center+factor*stripe_wide);
    safeX2 = (x2<WIDTH)?x2:WIDTH;
    if( (int)((timer*speed)+(y/factor))%100>50 ) gfx_line_simple_draw(safeX,safeX2,y,color3);
  }

}

void scene_highway_render(Timer timer){
    vfx_highway_draw(timer.scene,80,HEIGHT);
    sprite_car_draw(CX+sin(timer.scene*0.9f)*36,128,14);
//  drawTypewriter(HELLO,dt,63,1);
}

/*
 * --------------------------------------------------------- MOTHS
 */
void scene_moths_init(){
  vfx_moths_init();
  memset(buffer, 4, PIXELS);
  sprite_moon_draw(CX,24);
  gfx_sphere_draw(CX,CY,32);
  vfx_aa_apply(0,200);
  memcpy(buffer2,buffer,PIXELS);
}
void scene_moths_reset(){
  vfx_moths_init();
}
void scene_moths_render(Timer timer){
  vfx_moths_tick(timer.dt,timer.scene,4.0f);
  memcpy(buffer,buffer2,PIXELS);
  vfx_moths_render(timer.scene,1);
}


/*
 * --------------------------------------------------------- FIREPLACE
 */
void scene_fireplace_init(){}
void scene_fireplace_reset(){}
void scene_fireplace_render(Timer timer){
  const char* text="FIREPLACE SCENE";
  memset(buffer, 63, PIXELS);
  font_string_render(text,24,24,15,1,FONT_COLOR);
}

/*
 * --------------------------------------------------------- SNAKE
 */
void scene_snake_init(){}
void scene_snake_reset(){}
void scene_snake_render(Timer timer){
  const char* text="SNAKE SCENE";
  memset(buffer, 63, PIXELS);
  font_string_render(text,24,24,15,1,FONT_COLOR);
}


/*
 * --------------------------------------------------------- SPIRALS
 */
void scene_spirals_init(){}
void scene_spirals_reset(){}
void scene_spirals_render(Timer timer){
  const char* text="SPIRALS SCENE";
  memset(buffer, 63, PIXELS);
  font_string_render(text,24,24,15,1,FONT_COLOR);
}


/*
 * --------------------------------------------------------- MOON
 */
void scene_moon_init(){}
void scene_moon_reset(){}
void scene_moon_render(Timer timer){
  const char* text="MOON SCENE";
  memset(buffer, 63, PIXELS);
  font_string_render(text,24,24,15,1,FONT_COLOR);
}

/*
 * --------------------------------------------------------- OUTRO
 */
void scene_outro_init(){}
void scene_outro_reset(){}
void scene_outro_render(Timer timer){
  const char* text="THE END";
  memset(buffer, 63, PIXELS);
  font_string_render(text,CX-24,CY-4,15,1,FONT_COLOR);
}

/*
 * --------------------------------------------------------- MAIN LOOP
 */
int main() {
  Timer timer={0,0,0};
  hw_set_video_mode(0x13);
  memset(buffer, 0, PIXELS);
  scene_intro_init();
  scene_highway_init();
  scene_moths_init();
  
  // MAIN LOOP
  while(1){
    /*
     * ----------------------------------------------------- KEYBOARD
     */
    if (kbhit()) break;

    /*
     * ----------------------------------------------------- SCENE SWITCHER
     */
    if((int)timer.scene==screenplay[current_scene].length){
      current_scene++;
      timer.scene=0.0f;
      
      if(current_scene>=SCENES){
        timer.demo=0.0f;
        timer.scene=0.0f;
        current_scene=0;
      }
      
      palette_set(screenplay[current_scene].palette);
      switch(screenplay[current_scene].id){
       case 1:
         scene_intro_reset();
         break;
       case 2:
         scene_highway_reset();
         break;
       case 3:
         scene_moths_reset();
         break;
       case 4:
         scene_fireplace_reset();
         break;
       case 5:
         scene_snake_reset();
         break;
       case 6:
         scene_spirals_reset();
         break;
       case 7:
         scene_moon_reset();
         break;
       case 8:
         scene_outro_reset();
         break;
      }      
    }

    /*
     * ----------------------------------------------------- SCENE RENDERER
     */
    switch(screenplay[current_scene].id){
      case 1:
        scene_intro_render(timer);
        break;
      case 2:
         scene_highway_render(timer);
         break;        
      case 3:
        scene_moths_render(timer);
        break;
      case 4:
        scene_fireplace_render(timer);
        break;
      case 5:
        scene_snake_render(timer);
        break;
      case 6:
        scene_spirals_render(timer);
        break;
      case 7:
        scene_moon_render(timer);
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
     * ----------------------------------------------------- TIMERS
     */
    hw_wait_for_vretrace();
    timer.dt = hw_delta_time_get();
    timer.demo+=timer.dt;
    timer.scene+=timer.dt;
  }

  /*
   * ------------------------------------------------------- CLEAR MEM, RETURN
   */
  hw_set_video_mode(0x03);
  return 0;
}

