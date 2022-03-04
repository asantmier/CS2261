#include "lab2Lib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
    for(int x = 0; x < width; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[OFFSET(col + x, row + y, 240)] = color;
        }
    }
}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    for(int p = 0; p < SCREENHEIGHT * SCREENWIDTH; p++) {
        videoBuffer[p] = color;
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    // TODO #5.0: Implement this function
    return rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1 && colA + widthA - 1 > colB && colA < colB + widthB - 1;
}