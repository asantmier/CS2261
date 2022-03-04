#include "lab2Lib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int x = 0; x < width; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[OFFSET(col + x, row + y, 240)] = color;
        }
    }
}

void fillScreen(unsigned short color) {
    for(int p = 0; p < SCREENHEIGHT * SCREENWIDTH; p++) {
        videoBuffer[p] = color;
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}