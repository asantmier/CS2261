# 1 "lab5Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab5Lib.c"
# 1 "lab5lib.h" 1




typedef unsigned short u16;
# 25 "lab5lib.h"
extern unsigned short *videoBuffer;
# 55 "lab5lib.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);


typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 119 "lab5lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 134 "lab5lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "lab5Lib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int col, int row, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex) {

    unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;
}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {

    volatile unsigned short color = colorIndex | colorIndex << 8;
    if (col & 1 && width & 1) {
        for(int r = 0; r < height; r++) {
            setPixel4(col, row + r, colorIndex);
            if (width / 2 != 0) {
                DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | (width / 2));
            }
        }
    } else if (col & 1 && !(width & 1)) {
        for(int r = 0; r < height; r++) {
            setPixel4(col, row + r, colorIndex);
            if ((width / 2) - 1 != 0) {
                DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | ((width / 2) - 1));
            }
            setPixel4(col + width - 1, row + r, colorIndex);
        }
    } else if (!(col & 1) && width & 1) {
        for(int r = 0; r < height; r++) {
            if (width / 2 != 0) {
                DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | (width / 2));
            }
            setPixel4(col + width - 1, row + r, colorIndex);
        }
    } else if (!(col & 1) && !(width & 1)) {
        for(int r = 0; r < height; r++) {
            DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | (width / 2));
        }
    }
}


void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {

    volatile unsigned short color = colorIndex | colorIndex << 8;

    DMANow(3, &color, videoBuffer, (2 << 23) | ((160 * 240) / 2));
}


void drawImage3(int col, int row, int width, int height, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0)) / 2], &videoBuffer[((row + r)*(240)+(col)) / 2], width / 2);
    }
}


void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {

    DMANow(3, image, videoBuffer, ((160 * 240) / 2));
}


void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {
    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}



void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {




    dma[channel].cnt = 0;



    dma[channel].src = src;



    dma[channel].dst = dst;



    dma[channel].cnt = (1 << 31) | cnt;
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
