# 1 "HW04Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HW04Lib.c"
# 1 "HW04Lib.h" 1




typedef unsigned short u16;
typedef unsigned char u8;
# 28 "HW04Lib.h"
extern unsigned short *videoBuffer;
# 60 "HW04Lib.h"
extern u16 colors[];

enum {
  BLACK_IDX = 208,
  WHITE_IDX,
  GRAY_IDX,
  RED_IDX,
  GREEN_IDX,
  BLUE_IDX,
  CYAN_IDX,
  MAGENTA_IDX,
  YELLOW_IDX,
  PORTAGE_IDX,
  CADILLAC_IDX,
  ROGUE_IDX,
  VIORED_IDX,
  HOTPINK_IDX,
  LAVPINK_IDX,
  TURQUOISE_IDX,
  PERSIAN_IDX,
  TEAL_IDX,
  DARKGREEN_IDX,
  DARKRED_IDX
} COLORINDEX;
extern int numColors;


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
# 123 "HW04Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 134 "HW04Lib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 174 "HW04Lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 252 "HW04Lib.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "HW04Lib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


u16 colors[] = { 0, ((31) | (31)<<5 | (31)<<10), ((15) | (15)<<5 | (15)<<10), ((31) | (0)<<5 | (0)<<10), ((0) | (31)<<5 | (0)<<10), ((0) | (0)<<5 | (31)<<10), ((0) | (31)<<5 | (31)<<10), ((31) | (0)<<5 | (31)<<10),
                 ((31) | (31)<<5 | (0)<<10), ((18) | (19)<<5 | (27)<<10), ((19) | (9)<<5 | (13)<<10), ((22) | (6)<<5 | (13)<<10), ((28) | (8)<<5 | (16)<<10), ((31) | (13)<<5 | (21)<<10), ((31) | (20)<<5 | (26)<<10), ((5) | (26)<<5 | (25)<<10),
                 ((0) | (21)<<5 | (20)<<10), ((0) | (16)<<5 | (16)<<10), ((0) | (17)<<5 | (0)<<10), ((17) | (0)<<5 | (0)<<10) };
int numColors = 20;


void setPixel3(int col, int row, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex) {
    volatile unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1)
    {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    }
    else
    {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++)
    {

        if (width == 1)
            setPixel4(col, row + r, colorIndex);
        else if (width == 2)
        {
            setPixel4(col, row + r, colorIndex);
            setPixel4(col + 1, row + r, colorIndex);
        }
        else if ((col & 1) && (width & 1))
        {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | (width - 1) / 2);
        }
        else if (width & 1)
        {
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        }
        else if (col & 1)
        {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        }
        else
        {
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | width / 2);
        }
    }}


void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {

    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage3(int col, int row, int width, int height, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++)
    {
        if (row + i < 0) continue;
        DMANow(3, &image[((i)*(width / 2)+(0))], &videoBuffer[((row + i)*(240)+(col)) / 2], width / 2);
    }
}


void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
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


    dma[channel].cnt = cnt | (1 << 31);}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
