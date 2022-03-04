# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "lab2lib.h" 1




typedef unsigned short u16;
# 25 "lab2lib.h"
extern volatile unsigned short *videoBuffer;
# 40 "lab2lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "lab2lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 3 "main.c" 2


void initialize();
void drawFrame(int);
void frame1(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame2(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame3(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame4(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);


unsigned short buttons;
unsigned short oldButtons;


unsigned short bgColor;
# 27 "main.c"
int frame, lastFrame;

int main() {

 initialize();

 while (1) {
  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
  if ((!(~oldButtons & ((1<<0))) && (~buttons & ((1<<0))))) {
   frame++;

   if (frame > 4) {
    frame = 1;
   }
   drawFrame(frame);
  }
  if ((!(~oldButtons & ((1<<1))) && (~buttons & ((1<<1))))) {
   frame--;
   if (frame < 1) {
    frame = 4;
   }
   drawFrame(frame);
  }
 }
}


void initialize() {
 (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);

 buttons = (*(volatile unsigned short *)0x04000130);
 oldButtons = 0;


 bgColor = ((31) | (31)<<5 | (31)<<10);
 fillScreen(bgColor);


 lastFrame = 0;
 frame = 1;
 drawFrame(frame);
}

void drawFrame(int n) {
 waitForVBlank();



 switch (lastFrame)
 {
 case 1:
  frame1(bgColor, bgColor, bgColor, bgColor, bgColor);
  break;
 case 2:
  frame2(bgColor, bgColor, bgColor, bgColor, bgColor);
  break;
 case 3:
  frame3(bgColor, bgColor, bgColor, bgColor, bgColor);
  break;
 case 4:
  frame4(bgColor, bgColor, bgColor, bgColor, bgColor);
  break;
 default:
  break;
 }

 switch (n)
 {
 case 1:
  frame1(0x577D, 0x42B6, 0, 0x318C, 0x18C6);
  break;
 case 2:
  frame2(0x577D, 0x42B6, 0, 0x318C, 0x18C6);
  break;
 case 3:
  frame3(0x577D, 0x42B6, 0, 0x318C, 0x18C6);
  break;
 case 4:
  frame4(0x577D, 0x42B6, 0, 0x318C, 0x18C6);
  break;
 }
 lastFrame = frame;
}


inline void drawLine(int x, int y, int count, unsigned short color) {
 for (int i = 0; i < count; i++) {
  videoBuffer[((y)*(240)+(x + i))] = color;
 }
}







void base(u16 c1, u16 c2, u16 o1) {
 int ROW;
 ROW = 19;
 drawLine((26), ROW, (9), (o1));
 ROW = 20;
 drawLine((24), ROW, (2), (o1));
 drawLine((26), ROW, (9), (c1));
 drawLine((35), ROW, (2), (o1));
 ROW = 21;
 videoBuffer[((ROW)*(240)+((23)))] = (o1);
 drawLine((24), ROW, (13), (c1));
 drawLine((37), ROW, (5), (o1));
 ROW = 22;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 drawLine((23), ROW, (15), (c1));
 drawLine((38), ROW, (2), (o1));
 drawLine((40), ROW, (2), (c1));
 drawLine((42), ROW, (2), (o1));
 ROW = 23;
 videoBuffer[((ROW)*(240)+((21)))] = (o1);
 drawLine((22), ROW, (17), (c1));
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 drawLine((40), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((44)))] = (o1);
 ROW = 24;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 drawLine((21), ROW, (18), (c1));
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 drawLine((40), ROW, (5), (c1));
 videoBuffer[((ROW)*(240)+((45)))] = (o1);
 ROW = 25;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 drawLine((21), ROW, (18), (c1));
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 drawLine((40), ROW, (6), (c1));
 videoBuffer[((ROW)*(240)+((46)))] = (o1);
 ROW = 26;
 videoBuffer[((ROW)*(240)+((19)))] = (o1);
 drawLine((20), ROW, (18), (c1));
 drawLine((38), ROW, (2), (o1));
 drawLine((40), ROW, (7), (c1));
 videoBuffer[((ROW)*(240)+((47)))] = (o1);
 ROW = 27;
 videoBuffer[((ROW)*(240)+((19)))] = (o1);
 drawLine((20), ROW, (18), (c1));
 videoBuffer[((ROW)*(240)+((38)))] = (o1);
 drawLine((39), ROW, (9), (c1));
 videoBuffer[((ROW)*(240)+((48)))] = (o1);
 ROW = 28;
 drawLine((19), ROW, (3), (o1));
 drawLine((22), ROW, (6), (c1));
 drawLine((28), ROW, (2), (o1));
 drawLine((30), ROW, (8), (c1));
 videoBuffer[((ROW)*(240)+((38)))] = (o1);
 drawLine((39), ROW, (9), (c1));
 videoBuffer[((ROW)*(240)+((48)))] = (o1);
 ROW = 29;
 drawLine((19), ROW, (4), (o1));
 drawLine((23), ROW, (4), (c1));
 drawLine((27), ROW, (4), (o1));
 drawLine((31), ROW, (7), (c1));
 videoBuffer[((ROW)*(240)+((38)))] = (o1);
 drawLine((39), ROW, (10), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 30;
 drawLine((19), ROW, (4), (o1));
 drawLine((23), ROW, (4), (c1));
 drawLine((27), ROW, (4), (o1));
 drawLine((31), ROW, (6), (c1));
 drawLine((37), ROW, (2), (o1));
 drawLine((39), ROW, (10), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 31;
 drawLine((19), ROW, (3), (o1));
 drawLine((22), ROW, (6), (c1));
 drawLine((28), ROW, (2), (o1));
 drawLine((30), ROW, (7), (c1));
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 drawLine((38), ROW, (11), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 32;
 videoBuffer[((ROW)*(240)+((19)))] = (o1);
 drawLine((20), ROW, (16), (c1));
 drawLine((36), ROW, (2), (o1));
 drawLine((38), ROW, (11), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 33;
 videoBuffer[((ROW)*(240)+((19)))] = (o1);
 drawLine((20), ROW, (15), (c1));
 drawLine((35), ROW, (2), (o1));
 drawLine((37), ROW, (12), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 34;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 drawLine((21), ROW, (13), (c1));
 drawLine((34), ROW, (2), (o1));
 drawLine((36), ROW, (13), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 35;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 drawLine((21), ROW, (13), (c1));
 videoBuffer[((ROW)*(240)+((34)))] = (o1);
 drawLine((35), ROW, (14), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 36;
 videoBuffer[((ROW)*(240)+((21)))] = (o1);
 drawLine((22), ROW, (11), (c1));
 drawLine((33), ROW, (2), (o1));
 drawLine((35), ROW, (14), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 37;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 drawLine((23), ROW, (8), (c1));
 drawLine((31), ROW, (3), (o1));
 drawLine((34), ROW, (15), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 38;
 videoBuffer[((ROW)*(240)+((23)))] = (o1);
 drawLine((24), ROW, (5), (c1));
 drawLine((29), ROW, (3), (o1));
 drawLine((32), ROW, (17), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 39;
 drawLine((24), ROW, (6), (o1));
 drawLine((30), ROW, (19), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 40;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 drawLine((25), ROW, (24), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 41;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 drawLine((25), ROW, (24), (c2));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 42;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 drawLine((25), ROW, (24), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 43;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((25)))] = (c1);
 videoBuffer[((ROW)*(240)+((26)))] = (c2);
 drawLine((27), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((31)))] = (c2);
 drawLine((32), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((36)))] = (c2);
 drawLine((37), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((41)))] = (c2);
 drawLine((42), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((46)))] = (c2);
 drawLine((47), ROW, (2), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 44;
 for(; ROW < 52; ROW++) {
  videoBuffer[((ROW)*(240)+((24)))] = (o1);
  drawLine((25), ROW, (24), (c1));
  videoBuffer[((ROW)*(240)+((49)))] = (o1);
 }
 ROW = 52;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((25)))] = (c1);
 videoBuffer[((ROW)*(240)+((26)))] = (c2);
 drawLine((27), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((31)))] = (c2);
 drawLine((32), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((36)))] = (c2);
 drawLine((37), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((41)))] = (c2);
 drawLine((42), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((46)))] = (c2);
 drawLine((47), ROW, (2), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 53;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 drawLine((25), ROW, (24), (c1));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 54;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 drawLine((25), ROW, (24), (c2));
 videoBuffer[((ROW)*(240)+((49)))] = (o1);
 ROW = 55;
 for(; ROW < 59; ROW++) {
  videoBuffer[((ROW)*(240)+((24)))] = (o1);
  drawLine((25), ROW, (24), (c1));
  videoBuffer[((ROW)*(240)+((49)))] = (o1);
 }
 ROW = 59;
 drawLine((24), ROW, (2), (o1));
 drawLine((26), ROW, (22), (c1));
 drawLine((48), ROW, (2), (o1));
 ROW = 60;
 drawLine((25), ROW, (24), (o1));
 ROW = 61;
 drawLine((31), ROW, (4), (o1));
 drawLine((35), ROW, (4), (c2));
 drawLine((39), ROW, (2), (o1));
 ROW = 62;
 drawLine((32), ROW, (4), (o1));
 drawLine((36), ROW, (2), (c2));
 drawLine((38), ROW, (2), (o1));
 ROW = 63;
 drawLine((33), ROW, (6), (o1));
 ROW = 64;
 drawLine((33), ROW, (2), (o1));
 drawLine((36), ROW, (2), (o1));
 ROW = 65;
 drawLine((33), ROW, (2), (o1));
 drawLine((36), ROW, (2), (o1));
 ROW = 66;
 drawLine((32), ROW, (6), (o1));
 ROW = 67;
 drawLine((31), ROW, (2), (o1));
 drawLine((33), ROW, (2), (c2));
 drawLine((35), ROW, (4), (o1));
 ROW = 68;
 drawLine((30), ROW, (2), (o1));
 drawLine((32), ROW, (2), (c2));
 drawLine((34), ROW, (2), (o1));
 drawLine((36), ROW, (2), (c2));
 drawLine((38), ROW, (2), (o1));
 ROW = 69;
 drawLine((25), ROW, (10), (o1));
 drawLine((35), ROW, (4), (c2));
 drawLine((39), ROW, (4), (o1));
 ROW = 70;
 drawLine((28), ROW, (18), (o1));

}

void bucket(int X, int Y, u16 b1, u16 b2) {
 int ROW;
 ROW = Y + 0;
 drawLine((8 + X), ROW, (2), (b2));
 ROW = Y + 1;
 drawLine((7 + X), ROW, (4), (b2));
 ROW = Y + 2;
 drawLine((0 + X), ROW, (18), (b2));
 ROW = Y + 3;
 videoBuffer[((ROW)*(240)+((0 + X)))] = (b2);
 drawLine((1 + X), ROW, (16), (b1));
 videoBuffer[((ROW)*(240)+((17 + X)))] = (b2);
 ROW = Y + 4;
 videoBuffer[((ROW)*(240)+((0 + X)))] = (b2);
 drawLine((1 + X), ROW, (16), (b1));
 videoBuffer[((ROW)*(240)+((17 + X)))] = (b2);
 ROW = Y + 5;
 videoBuffer[((ROW)*(240)+((1 + X)))] = (b2);
 drawLine((2 + X), ROW, (14), (b1));
 videoBuffer[((ROW)*(240)+((16 + X)))] = (b2);
 ROW = Y + 6;
 drawLine((0 + X), ROW, (18), (b2));
 ROW = Y + 7;
 for (; ROW < Y + 14; ROW++) {
  videoBuffer[((ROW)*(240)+((1 + X)))] = (b2);
  drawLine((2 + X), ROW, (14), (b1));
  videoBuffer[((ROW)*(240)+((16 + X)))] = (b2);
 }
 ROW = Y + 14;
 videoBuffer[((ROW)*(240)+((2 + X)))] = (b2);
 drawLine((3 + X), ROW, (12), (b1));
 videoBuffer[((ROW)*(240)+((15 + X)))] = (b2);
 ROW = Y + 15;
 drawLine((1 + X), ROW, (16), (b2));
 ROW = Y + 16;
 videoBuffer[((ROW)*(240)+((2 + X)))] = (b2);
 drawLine((3 + X), ROW, (12), (b1));
 videoBuffer[((ROW)*(240)+((15 + X)))] = (b2);
 ROW = Y + 17;
 videoBuffer[((ROW)*(240)+((2 + X)))] = (b2);
 drawLine((3 + X), ROW, (12), (b1));
 videoBuffer[((ROW)*(240)+((15 + X)))] = (b2);
 ROW = Y + 18;
 drawLine((2 + X), ROW, (14), (b2));
}

void frame1(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
 base(c1, c2, o1);
 bucket(2, 40, b1, b2);
 int ROW;
 ROW = 37;
 drawLine((36), ROW, (3), (o1));
 ROW = 38;
 drawLine((35), ROW, (5), (o1));
 ROW = 39;
 videoBuffer[((ROW)*(240)+((34)))] = (o1);
 videoBuffer[((ROW)*(240)+((38)))] = (o1);
 ROW = 40;
 videoBuffer[((ROW)*(240)+((33)))] = (o1);
 videoBuffer[((ROW)*(240)+((38)))] = (o1);
 ROW = 41;
 videoBuffer[((ROW)*(240)+((32)))] = (o1);
 drawLine((33), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 ROW = 42;
 videoBuffer[((ROW)*(240)+((23)))] = (o1);
 videoBuffer[((ROW)*(240)+((31)))] = (o1);
 videoBuffer[((ROW)*(240)+((36)))] = (o1);
 ROW = 43;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((23)))] = (c1);
 videoBuffer[((ROW)*(240)+((30)))] = (o1);
 videoBuffer[((ROW)*(240)+((31)))] = (c1);
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 ROW = 44;
 drawLine((21), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((29)))] = (o1);
 videoBuffer[((ROW)*(240)+((34)))] = (o1);
 ROW = 45;
 drawLine((19), ROW, (2), (o1));
 drawLine((21), ROW, (3), (c1));
 videoBuffer[((ROW)*(240)+((28)))] = (o1);
 videoBuffer[((ROW)*(240)+((33)))] = (o1);
 ROW = 46;
 videoBuffer[((ROW)*(240)+((20)))] = (c1);
 drawLine((21), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((27)))] = (o1);
 videoBuffer[((ROW)*(240)+((32)))] = (o1);
 ROW = 47;
 drawLine((19), ROW, (2), (o1));
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 videoBuffer[((ROW)*(240)+((31)))] = (o1);
 ROW = 48;
 drawLine((25), ROW, (4), (o1));
 videoBuffer[((ROW)*(240)+((30)))] = (o1);
 ROW = 49;
 drawLine((13), ROW, (3), (o1));
 drawLine((22), ROW, (2), (o1));
 drawLine((28), ROW, (2), (o1));
 ROW = 50;
 drawLine((16), ROW, (2), (o1));
 drawLine((19), ROW, (3), (o1));
 drawLine((22), ROW, (3), (c1));
 drawLine((25), ROW, (3), (o1));
 ROW = 51;
 drawLine((12), ROW, (7), (o1));
 drawLine((19), ROW, (3), (c1));
 drawLine((22), ROW, (2), (o1));
 ROW = 52;
 drawLine((15), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((18)))] = (c1);
 drawLine((19), ROW, (3), (o1));
 ROW = 53;
 drawLine((12), ROW, (7), (o1));
}

void frame2(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
 base(c1, c2, o1);
 bucket(0, 19, b1, b2);
 int ROW;
 ROW = 29;
 drawLine((12), ROW, (2), (o1));
 ROW = 30;
 drawLine((10), ROW, (2), (o1));
 drawLine((13), ROW, (2), (o1));
 ROW = 31;
 videoBuffer[((ROW)*(240)+((9)))] = (o1);
 drawLine((11), ROW, (2), (o1));
 videoBuffer[((ROW)*(240)+((15)))] = (o1);
 ROW = 32;
 videoBuffer[((ROW)*(240)+((10)))] = (o1);
 drawLine((12), ROW, (3), (o1));
 ROW = 33;
 drawLine((11), ROW, (5), (o1));
 videoBuffer[((ROW)*(240)+((16)))] = (c1);
 drawLine((17), ROW, (2), (o1));
 ROW = 34;
 drawLine((12), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((15)))] = (c1);
 videoBuffer[((ROW)*(240)+((16)))] = (o1);
 videoBuffer[((ROW)*(240)+((17)))] = (c1);
 drawLine((18), ROW, (2), (o1));
 ROW = 35;
 drawLine((13), ROW, (2), (o1));
 drawLine((15), ROW, (2), (c1));
 drawLine((17), ROW, (3), (o1));
 ROW = 36;
 videoBuffer[((ROW)*(240)+((15)))] = (o1);
 drawLine((16), ROW, (3), (c1));
 drawLine((19), ROW, (2), (o1));
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 ROW = 37;
 drawLine((16), ROW, (2), (o1));
 drawLine((18), ROW, (3), (c1));
 drawLine((21), ROW, (18), (o1));
 ROW = 38;
 drawLine((18), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((21)))] = (c1);
 drawLine((22), ROW, (2), (o1));
 drawLine((24), ROW, (13), (c1));
 drawLine((37), ROW, (3), (o1));
 ROW = 39;
 drawLine((21), ROW, (4), (o1));
 drawLine((25), ROW, (12), (c1));
 drawLine((37), ROW, (2), (o1));
 ROW = 40;
 drawLine((23), ROW, (15), (o1));


}

void frame3(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
 base(c1, c2, o1);
 bucket(13, 0, b1, b2);
 int ROW;
 ROW = 13;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 ROW = 14;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 15;
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 16;
 drawLine((22), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 17;
 drawLine((22), ROW, (4), (o1));
 ROW = 18;
 drawLine((22), ROW, (4), (o1));
 ROW = 19;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 videoBuffer[((ROW)*(240)+((21)))] = (c1);
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((23)))] = (c1);
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 ROW = 20;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 videoBuffer[((ROW)*(240)+((21)))] = (c1);
 drawLine((22), ROW, (2), (o1));
 videoBuffer[((ROW)*(240)+((24)))] = (c1);
 ROW = 21;
 videoBuffer[((ROW)*(240)+((20)))] = (o1);
 videoBuffer[((ROW)*(240)+((21)))] = (c1);
 videoBuffer[((ROW)*(240)+((22)))] = (o1);
 videoBuffer[((ROW)*(240)+((25)))] = (o1);
 ROW = 22;
 drawLine((21), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((25)))] = (o1);
 ROW = 23;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 24;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 25;
 videoBuffer[((ROW)*(240)+((24)))] = (o1);
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 ROW = 26;
 videoBuffer[((ROW)*(240)+((25)))] = (o1);
 videoBuffer[((ROW)*(240)+((27)))] = (o1);
 ROW = 27;
 videoBuffer[((ROW)*(240)+((25)))] = (o1);
 drawLine((27), ROW, (2), (o1));
 ROW = 28;
 videoBuffer[((ROW)*(240)+((25)))] = (o1);
 videoBuffer[((ROW)*(240)+((27)))] = (o1);
 videoBuffer[((ROW)*(240)+((28)))] = (c1);
 ROW = 29;
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 drawLine((28), ROW, (2), (c1));
 ROW = 30;
 videoBuffer[((ROW)*(240)+((26)))] = (o1);
 drawLine((27), ROW, (4), (c1));
 videoBuffer[((ROW)*(240)+((31)))] = (o1);
 ROW = 31;
 videoBuffer[((ROW)*(240)+((27)))] = (o1);
 drawLine((28), ROW, (2), (c1));
 videoBuffer[((ROW)*(240)+((32)))] = (o1);
 ROW = 32;
 videoBuffer[((ROW)*(240)+((28)))] = (o1);
 videoBuffer[((ROW)*(240)+((33)))] = (o1);
 ROW = 33;
 videoBuffer[((ROW)*(240)+((29)))] = (o1);
 videoBuffer[((ROW)*(240)+((34)))] = (o1);
 ROW = 34;
 videoBuffer[((ROW)*(240)+((30)))] = (o1);
 videoBuffer[((ROW)*(240)+((34)))] = (c1);
 ROW = 35;
 videoBuffer[((ROW)*(240)+((31)))] = (o1);
 videoBuffer[((ROW)*(240)+((34)))] = (c1);
 videoBuffer[((ROW)*(240)+((36)))] = (o1);
 ROW = 36;
 videoBuffer[((ROW)*(240)+((32)))] = (o1);
 drawLine((33), ROW, (2), (c1));
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 ROW = 37;
 drawLine((37), ROW, (2), (o1));
 ROW = 38;
 videoBuffer[((ROW)*(240)+((34)))] = (o1);
 drawLine((37), ROW, (2), (o1));
 ROW = 39;
 drawLine((35), ROW, (4), (o1));
 ROW = 40;
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
}

void frame4(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
 base(c1, c2, o1);
 bucket(25, 0, b1, b2);
 int ROW;
 ROW = 12;
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 ROW = 13;
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 ROW = 14;
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 ROW = 15;
 drawLine((35), ROW, (3), (o1));
 videoBuffer[((ROW)*(240)+((39)))] = (o1);
 ROW = 16;
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 videoBuffer[((ROW)*(240)+((36)))] = (c1);
 drawLine((37), ROW, (2), (o1));
 ROW = 17;
 videoBuffer[((ROW)*(240)+((35)))] = (o1);
 videoBuffer[((ROW)*(240)+((36)))] = (c1);
 drawLine((37), ROW, (2), (o1));
 ROW = 18;
 for (; ROW < 23; ROW++) {
  videoBuffer[((ROW)*(240)+((35)))] = (o1);
  videoBuffer[((ROW)*(240)+((36)))] = (c1);
  videoBuffer[((ROW)*(240)+((37)))] = (o1);
 }
 ROW = 23;
 drawLine((35), ROW, (3), (o1));
 ROW = 24;
 drawLine((34), ROW, (4), (o1));
 ROW = 25;
 drawLine((34), ROW, (2), (o1));
 videoBuffer[((ROW)*(240)+((37)))] = (o1);
 ROW = 26;
 for (; ROW < 38; ROW++) {
  videoBuffer[((ROW)*(240)+((34)))] = (o1);
  drawLine((35), ROW, (2), (c1));
  videoBuffer[((ROW)*(240)+((37)))] = (o1);
 }
 ROW = 38;
 drawLine((34), ROW, (5), (o1));
 ROW = 39;
 drawLine((35), ROW, (3), (o1));
 ROW = 40;
 videoBuffer[((ROW)*(240)+((36)))] = (o1);

}
