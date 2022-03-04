# 1 "hw3Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw3Lib.c"
# 1 "hw3Lib.h" 1




typedef unsigned short u16;
typedef unsigned int u32;


typedef struct {
 int row, col, oldRow, oldCol, rDel, cDel, height, width;
 const unsigned short* image;
} Sprite;
# 25 "hw3Lib.h"
typedef struct {
    const volatile void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMAREC;
# 50 "hw3Lib.h"
extern volatile unsigned short *videoBuffer;
# 67 "hw3Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, volatile unsigned short color);
void drawSprite(Sprite* sprite);
void eraseFullSprite(Sprite* sprite, unsigned short bgColor);
void drawImage(int col, int row, int width, int height, const unsigned short* image);
void eraseMovingSprite(Sprite* sprite, unsigned short bgColor);
void eraseMovingImage(int col, int row, int oldCol, int oldRow, int width, int height, unsigned short bgColor);
void fillScreen(volatile unsigned short color);


void waitForVBlank();
# 97 "hw3Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 107 "hw3Lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "hw3Lib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, volatile unsigned short color) {


    if (width > 20) {

        for (int i = 0; i < height; i++) {
            ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
            ((volatile DMAREC*)0x040000b0)[3].src = &color;
            ((volatile DMAREC*)0x040000b0)[3].dst = videoBuffer + ((row + i)*(240)+(col));
            ((volatile DMAREC*)0x040000b0)[3].cnt = (1 << 31) | (0 << 26) | (2 << 23) | width;
        }
    } else {
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {


                setPixel(col + j, row + i, color);

            }
        }
    }
}


void drawSprite(Sprite* sprite) {
    drawImage(sprite->col, sprite->row, sprite->width, sprite->height, sprite->image);
}


void eraseFullSprite(Sprite* sprite, unsigned short bgColor) {
    drawRect(sprite->oldCol, sprite->oldRow, sprite->width, sprite->height, bgColor);
}


void eraseMovingSprite(Sprite* sprite, unsigned short bgColor) {
    eraseMovingImage(sprite->col, sprite->row, sprite->oldCol, sprite->oldRow, sprite->width, sprite->height, bgColor);
}

void drawImage(int col, int row, int width, int height, const unsigned short* image) {


    if (width > 20) {
        for (int y = 0; y < height; y++) {
            ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
            ((volatile DMAREC*)0x040000b0)[3].src = &image[((y)*(width)+(0))];
            ((volatile DMAREC*)0x040000b0)[3].dst = videoBuffer + ((row + y)*(240)+(col));
            ((volatile DMAREC*)0x040000b0)[3].cnt = (1 << 31) | (0 << 26) | (0 << 23) | width;
        }
    } else {
        for(int x = 0; x < width; x++) {
            for(int y = 0; y < height; y++) {
                videoBuffer[((row + y)*(240)+(col + x))] = image[((y)*(width)+(x))];
            }
        }
    }
}

void eraseMovingImage(int col, int row, int oldCol, int oldRow, int width, int height, unsigned short bgColor) {



    int xend, xstart, xdiff;
    if (col < oldCol) {

        xdiff = oldCol - col;
        xstart = width - xdiff;
        xend = width;
    } else {

        xdiff = col - oldCol;
        xstart = 0;
        xend = xdiff;
    }

    for(int x = xstart; x < xend; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[((oldRow + y)*(240)+(oldCol + x))] = bgColor;
        }
    }
    int yend, ystart, ydiff;
    if (row < oldRow) {

        ydiff = oldRow - row;
        ystart = height - ydiff;
        yend = height;
    } else {

        ydiff = row - oldRow;
        ystart = 0;
        yend = ydiff;
    }
    for(int y = ystart; y < yend; y++) {
        for(int x = 0; x < width; x++) {
            videoBuffer[((oldRow + y)*(240)+(oldCol + x))] = bgColor;
        }
    }
}



void fillScreen(volatile unsigned short color) {
    volatile u32 temp = color | color << 16;
    ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
    ((volatile DMAREC*)0x040000b0)[3].src = &temp;
    ((volatile DMAREC*)0x040000b0)[3].dst = videoBuffer;
    ((volatile DMAREC*)0x040000b0)[3].cnt = (1 << 31) | (1 << 26) | (2 << 23) | 19200;
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
