#include <iostream>
#include <fstream>
#include <dos.h>

#include <conio.h>
#include <string.h>
#include <math.h>
#include <stdio.h>

#pragma pack(push, 1)
struct PCXHeader {
    char Manufacturer;
    char Version;
    char Encoding;
    char BitsPerPixel;
    short Xmin;
    short Ymin;
    short Xmax;
    short Ymax;
    short Hres;
    short Vres;
    char Palette[48];
    char Reserved;
    char ColorPlanes;
    short BytesPerLine;
    short PaletteType;
    char Filler[58];
};
#pragma pack(pop)

#define PALETTE_SIZE 256
struct RGB {
    unsigned char r, g, b;
};
RGB palette[PALETTE_SIZE];
const int SCREEN_WIDTH = 320;
const int SCREEN_HEIGHT = 200;
const float TARGET_FPS=60.0f;
const float TARGET_MS=1.0/TARGET_FPS;
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

void setVGAPalette(RGB* palette, int size) {
    outp(0x03C8, 0);  // Start writing at color  0

    for (int i = 0; i < size; ++i) {
	outp(0x03C9, palette[i].r >> 2);  // VGA wants 6-bit values
	outp(0x03C9, palette[i].g >> 2);
	outp(0x03C9, palette[i].b >> 2);
    }
}

unsigned char* loadPCX(const char* filename, RGB* paletteData, int& paletteSize) {
    std::ifstream file(filename, std::ios::binary);
    PCXHeader header;
    file.read(reinterpret_cast<char*>(&header), sizeof(PCXHeader));
    int width = header.Xmax - header.Xmin + 1;
    int height = header.Ymax - header.Ymin + 1;
    unsigned char* imageData = new unsigned char[width * height];
    int index = 0;

    while (index < width * height) {
	char byte;
	file.read(&byte, 1);

	if ((byte & 0xC0) == 0xC0) {
	    int count = byte & 0x3F;
	    file.read(&byte, 1);
	    while (count-- && index < width * height) {
		imageData[index++] = static_cast<unsigned char>(byte);
	    }
	} else {
	    imageData[index++] = static_cast<unsigned char>(byte);
	}
    }

    file.seekg(-769, std::ios::end);
    char paletteIndicator;
    file.read(&paletteIndicator, 1);

    if (paletteIndicator == 0x0C) {
	file.read(reinterpret_cast<char*>(paletteData), 768); // 256 colors * 3 bytes
	paletteSize = PALETTE_SIZE;
    } else {
	paletteSize = 0;
    }

    file.close();
    return imageData;
}

int main() {
    setVGAMode();

    int paletteSize = 0;
    unsigned char* logoBuffer = loadPCX("p1xlogo.pcx", palette, paletteSize);

    setVGAPalette(palette,paletteSize);

    while(1){
      if (kbhit()&&getch()==27) break;
      memcpy(vga,logoBuffer,SCREEN_WIDTH*SCREEN_HEIGHT);
    }

    delete[] logoBuffer;
    resetTextMode();
    return 0;
}
