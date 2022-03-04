# 1 "lab2Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab2Lib.c"
# 1 "lab2Lib.h" 1




typedef unsigned short u16;
# 25 "lab2Lib.h"
extern volatile unsigned short *videoBuffer;
# 40 "lab2Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "lab2Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "lab2Lib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int x = 0; x < width; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[((row + y)*(240)+(col + x))] = color;
        }
    }
}

void fillScreen(unsigned short color) {
    for(int p = 0; p < 160 * 240; p++) {
        videoBuffer[p] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}
