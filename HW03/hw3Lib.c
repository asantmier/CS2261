#include "hw3Lib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, volatile unsigned short color) {
    // Draws a rectangle, using DMA if faster
    // A fast integer chunk size version doesn't exist because its irritating to implement
    if (width > 20) {
        // DMA short
        for (int i = 0; i < height; i++) {
            DMA[3].cnt = 0;
            DMA[3].src = &color;
            DMA[3].dst = videoBuffer + OFFSET(col, row + i, SCREENWIDTH);
            DMA[3].cnt = DMA_ON | DMA_CS_16 | DMA_SRC_FIX | width;
        }
    } else {
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                // I'm very curious if our comiler inlines this function
                // Doesn't seem to have a performance cost and the labs all do this but it feels sketchy
                setPixel(col + j, row + i, color);
                // videoBuffer[OFFSET(col + j, row + i, SCREENWIDTH)] = color;
            }
        }
    }
}

// legacy function from hw2
void drawSprite(Sprite* sprite) {
    drawImage(sprite->col, sprite->row, sprite->width, sprite->height, sprite->image);
}

// legacy function from hw2
void eraseFullSprite(Sprite* sprite, unsigned short bgColor) {
    drawRect(sprite->oldCol, sprite->oldRow, sprite->width, sprite->height, bgColor);
}

// legacy function from hw2
void eraseMovingSprite(Sprite* sprite, unsigned short bgColor) {
    eraseMovingImage(sprite->col, sprite->row, sprite->oldCol, sprite->oldRow, sprite->width, sprite->height, bgColor);
}

void drawImage(int col, int row, int width, int height, const unsigned short* image) {
    // Literally just drawSprite, but abandons the Sprite struct because dealing with it is too much of a pain
    // The more I use C the more I respect C++... i miss inheritance...
    if (width > 20) { // DMA is faster
        for (int y = 0; y < height; y++) {
            DMA[3].cnt = 0;
            DMA[3].src = &image[OFFSET(0, y, width)];
            DMA[3].dst = videoBuffer + OFFSET(col, row + y, SCREENWIDTH);
            DMA[3].cnt = DMA_ON | DMA_CS_16 | DMA_SRC_INC | width;
        }
    } else {
        for(int x = 0; x < width; x++) {
            for(int y = 0; y < height; y++) {
                videoBuffer[OFFSET(col + x, row + y, SCREENWIDTH)] = image[OFFSET(x, y, width)];
            }
        }
    }
}

void eraseMovingImage(int col, int row, int oldCol, int oldRow, int width, int height, unsigned short bgColor) {
    // DMA is absolutely not helpful here, so don't use it
    // Draws the given sprite, but all colored pixels are replaced with the given color
    // Ignores pixels that are about to be drawn. THIS ONLY WORKS IF THE SPRITE IS ALWAYS MOVING
    int xend, xstart, xdiff;
    if (col < oldCol) {
        // if to the left
        xdiff = oldCol - col;
        xstart = width - xdiff;
        xend = width;
    } else {
        // if to the right
        xdiff = col - oldCol;
        xstart = 0;
        xend = xdiff;
    }
    // lined up case doesn't matter so the second case will just cancel the loop if so
    for(int x = xstart; x < xend; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[OFFSET(oldCol + x, oldRow + y, 240)] = bgColor;
        }
    }
    int yend, ystart, ydiff;
    if (row < oldRow) {
        // if above
        ydiff = oldRow - row;
        ystart = height - ydiff;
        yend = height;
    } else {
        // if below
        ydiff = row - oldRow;
        ystart = 0;
        yend = ydiff;
    }
    for(int y = ystart; y < yend; y++) {
        for(int x = 0; x < width; x++) {
            videoBuffer[OFFSET(oldCol + x, oldRow + y, 240)] = bgColor;
        }
    }
}

// There's no erase image because it's just a drawRect and I don't want to refactor

void fillScreen(volatile unsigned short color) {
    volatile u32 temp = color | color << 16;
    DMA[3].cnt = 0;
    DMA[3].src = &temp;
    DMA[3].dst = videoBuffer;
    DMA[3].cnt = DMA_ON | DMA_CS_32 | DMA_SRC_FIX | DMA_HALFSCREEN;
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
