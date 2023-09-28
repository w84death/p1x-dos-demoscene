#include <stdio.h>
#include <cstring>
#include <dos.h>
#include <conio.h>
#include <dpmi.h>
#include <math.h>

#define WIDTH       320
#define HEIGHT      200
#define CX          160
#define CY          100
#define PIXELS      64000
#define PIT_FREQ    1193182L
#define PI          M_PI
#define VFX_STARS_MAX   250
#define VFX_STARS_MAX_Z 500.0f

const float TARGET_FRAME_TIME=1.0f/70.0f;
const float ASPECT_RATIO=(4.0f/3.0f)/((float)WIDTH/(float)HEIGHT);
unsigned char buffer[PIXELS]={0};
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
  char name[12];
  float time;
  int palette;
};

Scene screenplay[] = {
  {"INTRO",11.0f,6},
  {"HIGHWAY",14.0f,1},
  {"FIREPLACE",24.0f,0},
  {"SNAKE",14.0f,2},
  {"SPIRALS",10.0f,3},
  {"MOON",22.0f,5},
  {"OUTRO",8.0f,4}
};

struct Vert {float x,y,z,speed;};
Vert vfx_stars_mem[VFX_STARS_MAX];

void hw_set_video_mode(unsigned char mode);
float hw_delta_time_get();
void hw_wait_for_vretrace_start();
void draw_pixel(int x, int y, unsigned char color);
void draw_line(int x1, int x2, int y, int color);
void draw_rectangle(int x1, int y1, int x2, int y2, int color);
void palette_hw_color_update(int index, Color pal);
void palette_set(int bank_id);
void palette_color_cycle(int start, int end);
void palette_draw_preview();
void vfx_stars_init();
void vfx_stars_tick(float timer, float speed);
void vfx_stars_render();
void sys_frame_ms_draw();
 
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
 * DRAWING
 */
void draw_pixel(int x, int y, unsigned char color) {
    buffer[(y<<8)+(y<<6)+x] = color;
}

void draw_line(int x1, int x2, int y, int color){
  int temp;
  if (x1>x2){
    temp = x1;
    x1 = x2;
    x2 = temp;
  }
  memset(buffer+((y<<8)+(y<<6)+x1),(unsigned char)color, x2-x1+1);
}

void draw_rectangle(int x1, int y1, int x2, int y2, int color){
  unsigned char *startOffset;
  int width;
  startOffset = buffer+( (y1<<8)+(y1<<6))+x1;
  width = 1+x2-x1;
  while(y1++<=y2){
    memset((unsigned char *)startOffset,(unsigned char)color,width);
    startOffset+=320;
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
            palette[192+i].r=60-(int)(58*sin(i*PI/127));
            palette[192+i].g=60-(int)(58*sin(i*PI/127));
            palette[192+i].b=60-(int)(38*sin(i*PI/127));
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
  for(i=end-1;i>start-1;i--){
    palette[i] = palette[i-1];
  }
  palette[start] = last_color;
  palette_set(palette_active_bank_id);
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


void sys_frame_ms_draw(){

};

/*
 * VFX / SCENES
 */
Vert vfx_stars_get_one(){
    int size = (int)VFX_STARS_MAX_Z<<1;
    return {
        (float)(size-rand()%(size<<1)),
        (float)(size-rand()%(size<<1)),
        (float)(rand()%(int)VFX_STARS_MAX_Z+1),
        (float)(10+rand()%100)
    };
}

void vfx_stars_init(){
  for (int i=0;i<VFX_STARS_MAX;i++){
    vfx_stars_mem[i]=vfx_stars_get_one();
  }
}

void vfx_stars_tick(float dt, float timer, float speed){
  int i;
  for (i=0;i<VFX_STARS_MAX;i++){
    vfx_stars_mem[i].z -= vfx_stars_mem[i].speed*speed*dt;
    vfx_stars_mem[i].x += sin(i+vfx_stars_mem[i].z*0.05f)*6.0f;
    vfx_stars_mem[i].y += cos(i+vfx_stars_mem[i].z*0.05f)*6.0f;
        
    if(vfx_stars_mem[i].z<0.0f){
      vfx_stars_mem[i]=vfx_stars_get_one();
    }
  }
}

void vfx_stars_render(float timer, int extra){
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

       if(extra>0 && x>4 && x<WIDTH-4 && y>4){
         buffer[((y)<<8)+((y)<<6)+x-2]=(int)(i+timer*100)%8>4?28:8;
         buffer[((y)<<8)+((y)<<6)+x+2]=(int)(i+timer*100)%8>4?8:28;
       }
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
      if(color>4 && color<16) buffer[(y<<8)+(y<<6)+x]=color;
    }
  }
}

void draw_moon(){
  int w=96;
  int h=96;
  float maxDist = 48;
  for(int y=0;y<h;y++){
    for(int x=160-48;x<160+48;x++){
      float ax = (x-CX)*ASPECT_RATIO;
      float ay = y-48;
      float dist = sqrt(ax*ax+ay*ay);
      int color = 24-(int)((dist/maxDist)*24);
      if(color>6) buffer[(y<<8)+(y<<6)+x]=color;
    }
  }

  // 120 - 200
  drawCrater(135,20,13);
  drawCrater(122,40,11);
  drawCrater(175,24,13);
  drawCrater(180,55,11);
  drawCrater(165,32,18);
  drawCrater(180,62,11);
}

void applyAA(int start, int end){
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
	//int safeX = x%WIDTH;
	//int safeY = y%HEIGHT;
	buffer[(y<<8)+(y<<6)+x] = color;
      }
    }
  }
}


/*
 * MAIN LOOP
 */
int main() {
    Timer timer={0,0,0};
    hw_set_video_mode(0x13);

    // INTRO
    palette_set(0);
    vfx_stars_init();

    while(1){
        /*
         * KEYBOARD
         */
        if (kbhit()) break;

        /*
         * DRAW SCENE
         */

        memset(buffer, 4, PIXELS);

        float speed=1.0f;
        if(timer.scene>4.0f && timer.scene<10.0f) speed=0.5f;
        if(timer.scene>20.0f && timer.scene<26.0f) speed=10.0f;
        vfx_stars_tick(timer.dt,timer.scene,speed);
        draw_moon();
        vfx_stars_render(timer.scene,1);
        applyAA(0,200);
        vfx_stars_render(timer.scene,-1);

        //palette_draw_preview();
        //sys_frame_ms_draw();

        /*
         * BLIP VGA SCREEN
         */
        dosmemput(buffer,PIXELS,0xA0000);
        
        hw_wait_for_vretrace();
        timer.dt = hw_delta_time_get();
        /*
        while(timer.dt<TARGET_FRAME_TIME){
            delay(1);
            timer.dt = hw_delta_time_get();
        }
        */
        timer.demo+=timer.dt;
        timer.scene+=timer.dt;
    }
    hw_set_video_mode(0x03);

    return 0;
}

