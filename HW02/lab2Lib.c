#include "lab2Lib.h"
// Yeah this is straight from the lab... auto refactoring was being to annoying to rename this...

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

void drawSprite(Sprite* sprite) {
    // Draws the given sprite
    for(int x = 0; x < sprite->width; x++) {
        for(int y = 0; y < sprite->height; y++) {
            videoBuffer[OFFSET(sprite->col + x, sprite->row + y, 240)] = sprite->sprite[OFFSET(x, y, sprite->width)];
        }
    }
}

void eraseFullSprite(Sprite* sprite, unsigned short bgColor) {
    // Draws the given sprite, but all colored pixels are replaced with the given color
    for(int x = 0; x < sprite->width; x++) {
        for(int y = 0; y < sprite->height; y++) {
            // Originally, these methods had transparency support but the extra conditional to check for a pixel's
            // color created an incredible amount of visual artifacting. At this point they could be drawRects
            videoBuffer[OFFSET(sprite->col + x, sprite->row + y, 240)] = bgColor;
        }
    }
}

void eraseMovingSprite(Sprite* sprite, unsigned short bgColor) {
    // Draws the given sprite, but all colored pixels are replaced with the given color
    // Ignores pixels that are about to be drawn. THIS ONLY WORKS IF THE SPRITE IS ALWAYS MOVING
    int xend, xstart, xdiff;
    if (sprite->col < sprite->oldCol) {
        // if to the left
        xdiff = sprite->oldCol - sprite->col;
        xstart = sprite->width - xdiff;
        xend = sprite->width;
    } else {
        // if to the right
        xdiff = sprite->col - sprite->oldCol;
        xstart = 0;
        xend = xdiff;
    }
    // lined up case doesn't matter so the second case will just cancel the loop if so
    for(int x = xstart; x < xend; x++) {
        for(int y = 0; y < sprite->height; y++) {
            videoBuffer[OFFSET(sprite->oldCol + x, sprite->oldRow + y, 240)] = bgColor;
        }
    }
    int yend, ystart, ydiff;
    if (sprite->row < sprite->oldRow) {
        // if above
        ydiff = sprite->oldRow - sprite->row;
        ystart = sprite->width - ydiff;
        yend = sprite->width;
    } else {
        // if below
        ydiff = sprite->row - sprite->oldRow;
        ystart = 0;
        yend = ydiff;
    }
    for(int y = ystart; y < yend; y++) {
        for(int x = 0; x < sprite->width; x++) {
            videoBuffer[OFFSET(sprite->oldCol + x, sprite->oldRow + y, 240)] = bgColor;
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

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1 && colA + widthA - 1 > colB && colA < colB + widthB - 1;
}