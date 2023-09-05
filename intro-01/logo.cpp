#include <iostream>
#include <fstream>
#include <vector>
#include <dos.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <stdio.h>

#pragma pack(1)  // Ensure structure is packed
struct PCXHeader {
    uint8_t  identifier;
    uint8_t  version;
    uint8_t  encoding;
    uint8_t  bitsPerPixel;
    uint16_t xStart;
    uint16_t yStart;
    uint16_t xEnd;
    uint16_t yEnd;
    uint16_t horzRes;
    uint16_t vertRes;
    uint8_t  palette[48];
    uint8_t  reserved;
    uint8_t  numPlanes;
    uint16_t bytesPerLine;
    uint16_t paletteType;
    uint8_t  filler[58];
};

const int SCREEN_WIDTH = 320;
const int SCREEN_HEIGHT = 200;
const float TARGET_FPS=60.0f;
const float TARGET_MS=1.0/TARGET_FPS;
struct RGB {
    uint8_t r, g, b;
};
unsigned char* vga = (unsigned char*)0xA0000;

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

unsigned char* loadPCX(const char* filename) {
    std::ifstream file(filename, std::ios::binary);
    PCXHeader header;

    file.read(reinterpret_cast<char*>(&header), sizeof(header));

    int width = header.xEnd - header.xStart + 1;
    int height = header.yEnd - header.yStart + 1;
    unsigned char* imageData = new unsigned char[width * height];

    int index = 0;
    while (index < width * height) {
	uint8_t byte;
	file.read(reinterpret_cast<char*>(&byte), 1);

	if ((byte & 0xC0) == 0xC0) {
	    int count = byte & 0x3F;
	    file.read(reinterpret_cast<char*>(&byte), 1);
	    while (count-- && index < width * height) {
		imageData[index++] = byte;
	    }
	} else {
	    imageData[index++] = byte;
	}
    }

    file.close();

    return imageData;
}

int main() {
    setVGAMode();
    while(1){
      if (kbhit()&&getch()==27) break;

      memcpy(vga,loadPCX("p1xlogo.pcx"),SCREEN_WIDTH*SCREEN_HEIGHT);
   }

    resetTextMode();
    return 0;
}
