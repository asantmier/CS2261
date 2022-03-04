// A lot of the code here is sourced from lab 2
#include "lab2lib.h"

// prototypes
void initialize();
void drawFrame(int);
void frame1(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame2(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame3(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);
void frame4(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2);

// buttons
unsigned short buttons;
unsigned short oldButtons;

// background
unsigned short bgColor;
// picture colors
// http://www.budmelvin.com/dev/15bitconverter.html saved my life here
#define BODY 0x577D
#define HIGH 0x42B6
#define LINE BLACK
#define BUC1 0x318C
#define BUC2 0x18C6

// store which anim frame we are on and were on
int frame, lastFrame;

int main() {

	initialize();
 
	while (1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		if (BUTTON_PRESSED(BUTTON_A)) {
			frame++;
			// reset frame counter if we go over our limit
			if (frame > 4) {
				frame = 1;
			}
			drawFrame(frame);
		}
		if (BUTTON_PRESSED(BUTTON_B)) {
			frame--;
			if (frame < 1) {
				frame = 4;
			}
			drawFrame(frame);
		}
	}
}

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	buttons = BUTTONS;
	oldButtons = 0;

	//initialize background color and draw background
	bgColor = WHITE;
	fillScreen(bgColor);

	// setup frames and draw the first one
	lastFrame = 0;
	frame = 1;
	drawFrame(frame);
}

void drawFrame(int n) {
	waitForVBlank();
	// render the last frame again, but in all white to erase it
	// this isn't 100% efficient but its good enough to not flicker
	// (not doing this does flicker)
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
	// render the new frame
	switch (n)
	{
	case 1:
		frame1(BODY, HIGH, LINE, BUC1, BUC2);
		break;
	case 2:
		frame2(BODY, HIGH, LINE, BUC1, BUC2);
		break;
	case 3:
		frame3(BODY, HIGH, LINE, BUC1, BUC2);
		break;
	case 4:
		frame4(BODY, HIGH, LINE, BUC1, BUC2);
		break;
	}
	lastFrame = frame;
}

// I remembered inline functions halfway though this homework. god bless
inline void drawLine(int x, int y, int count, unsigned short color) {
	for (int i = 0; i < count; i++) {
		videoBuffer[OFFSET(x + i, y, SCREENWIDTH)] = color;
	}
}

// lazy programming
#define DRA1(color, x) videoBuffer[OFFSET((x), ROW, SCREENWIDTH)] = (color)
#define DRAX(color, x, size) drawLine((x), ROW, (size), (color))

// Yes, the variable naming conventions in the following functions are awful (nonsense names, incorrect case)
// but it means I don't have to hit caps lock every line
void base(u16 c1, u16 c2, u16 o1) {
	int ROW;
	ROW = 19;
	DRAX(o1, 26, 9);
	ROW = 20;
	DRAX(o1, 24, 2);
	DRAX(c1, 26, 9);
	DRAX(o1, 35, 2);
	ROW = 21;
	DRA1(o1, 23);
	DRAX(c1, 24, 13);
	DRAX(o1, 37, 5);
	ROW = 22;
	DRA1(o1, 22);
	DRAX(c1, 23, 15);
	DRAX(o1, 38, 2);
	DRAX(c1, 40, 2);
	DRAX(o1, 42, 2);
	ROW = 23;
	DRA1(o1, 21);
	DRAX(c1, 22, 17);
	DRA1(o1, 39);
	DRAX(c1, 40, 4);
	DRA1(o1, 44);
	ROW = 24;
	DRA1(o1, 20);
	DRAX(c1, 21, 18);
	DRA1(o1, 39);
	DRAX(c1, 40, 5);
	DRA1(o1, 45);
	ROW = 25;
	DRA1(o1, 20);
	DRAX(c1, 21, 18);
	DRA1(o1, 39);
	DRAX(c1, 40, 6);
	DRA1(o1, 46);
	ROW = 26;
	DRA1(o1, 19);
	DRAX(c1, 20, 18);
	DRAX(o1, 38, 2);
	DRAX(c1, 40, 7);
	DRA1(o1, 47);
	ROW = 27;
	DRA1(o1, 19);
	DRAX(c1, 20, 18);
	DRA1(o1, 38);
	DRAX(c1, 39, 9);
	DRA1(o1, 48);
	ROW = 28;
	DRAX(o1, 19, 3);
	DRAX(c1, 22, 6);
	DRAX(o1, 28, 2);
	DRAX(c1, 30, 8);
	DRA1(o1, 38);
	DRAX(c1, 39, 9);
	DRA1(o1, 48);
	ROW = 29;
	DRAX(o1, 19, 4);
	DRAX(c1, 23, 4);
	DRAX(o1, 27, 4);
	DRAX(c1, 31, 7);
	DRA1(o1, 38);
	DRAX(c1, 39, 10);
	DRA1(o1, 49);
	ROW = 30;
	DRAX(o1, 19, 4);
	DRAX(c1, 23, 4);
	DRAX(o1, 27, 4);
	DRAX(c1, 31, 6);
	DRAX(o1, 37, 2);
	DRAX(c1, 39, 10);
	DRA1(o1, 49);
	ROW = 31;
	DRAX(o1, 19, 3);
	DRAX(c1, 22, 6);
	DRAX(o1, 28, 2);
	DRAX(c1, 30, 7);
	DRA1(o1, 37);
	DRAX(c1, 38, 11);
	DRA1(o1, 49);
	ROW = 32;
	DRA1(o1, 19);
	DRAX(c1, 20, 16);
	DRAX(o1, 36, 2);
	DRAX(c1, 38, 11);
	DRA1(o1, 49);
	ROW = 33;
	DRA1(o1, 19);
	DRAX(c1, 20, 15);
	DRAX(o1, 35, 2);
	DRAX(c1, 37, 12);
	DRA1(o1, 49);
	ROW = 34;
	DRA1(o1, 20);
	DRAX(c1, 21, 13);
	DRAX(o1, 34, 2);
	DRAX(c1, 36, 13);
	DRA1(o1, 49);
	ROW = 35;
	DRA1(o1, 20);
	DRAX(c1, 21, 13);
	DRA1(o1, 34);
	DRAX(c1, 35, 14);
	DRA1(o1, 49);
	ROW = 36;
	DRA1(o1, 21);
	DRAX(c1, 22, 11);
	DRAX(o1, 33, 2);
	DRAX(c1, 35, 14);
	DRA1(o1, 49);
	ROW = 37;
	DRA1(o1, 22);
	DRAX(c1, 23, 8);
	DRAX(o1, 31, 3);
	DRAX(c1, 34, 15);
	DRA1(o1, 49);
	ROW = 38;
	DRA1(o1, 23);
	DRAX(c1, 24, 5);
	DRAX(o1, 29, 3);
	DRAX(c1, 32, 17);
	DRA1(o1, 49);
	ROW = 39;
	DRAX(o1, 24, 6);
	DRAX(c1, 30, 19);
	DRA1(o1, 49);
	ROW = 40;
	DRA1(o1, 24);
	DRAX(c1, 25, 24);
	DRA1(o1, 49);
	ROW = 41;
	DRA1(o1, 24);
	DRAX(c2, 25, 24);
	DRA1(o1, 49);
	ROW = 42;
	DRA1(o1, 24);
	DRAX(c1, 25, 24);
	DRA1(o1, 49);
	ROW = 43;
	DRA1(o1, 24);
	DRA1(c1, 25);
	DRA1(c2, 26);
	DRAX(c1, 27, 4);
	DRA1(c2, 31);
	DRAX(c1, 32, 4);
	DRA1(c2, 36);
	DRAX(c1, 37, 4);
	DRA1(c2, 41);
	DRAX(c1, 42, 4);
	DRA1(c2, 46);
	DRAX(c1, 47, 2);
	DRA1(o1, 49);
	ROW = 44;
	for(; ROW < 52; ROW++) {
		DRA1(o1, 24);
		DRAX(c1, 25, 24);
		DRA1(o1, 49);
	}
	ROW = 52;
	DRA1(o1, 24);
	DRA1(c1, 25);
	DRA1(c2, 26);
	DRAX(c1, 27, 4);
	DRA1(c2, 31);
	DRAX(c1, 32, 4);
	DRA1(c2, 36);
	DRAX(c1, 37, 4);
	DRA1(c2, 41);
	DRAX(c1, 42, 4);
	DRA1(c2, 46);
	DRAX(c1, 47, 2);
	DRA1(o1, 49);
	ROW = 53;
	DRA1(o1, 24);
	DRAX(c1, 25, 24);
	DRA1(o1, 49);
	ROW = 54;
	DRA1(o1, 24);
	DRAX(c2, 25, 24);
	DRA1(o1, 49);
	ROW = 55;
	for(; ROW < 59; ROW++) {
		DRA1(o1, 24);
		DRAX(c1, 25, 24);
		DRA1(o1, 49);
	}
	ROW = 59;
	DRAX(o1, 24, 2);
	DRAX(c1, 26, 22);
	DRAX(o1, 48, 2);
	ROW = 60;
	DRAX(o1, 25, 24);
	ROW = 61;
	DRAX(o1, 31, 4);
	DRAX(c2, 35, 4);
	DRAX(o1, 39, 2);
	ROW = 62;
	DRAX(o1, 32, 4);
	DRAX(c2, 36, 2);
	DRAX(o1, 38, 2);
	ROW = 63;
	DRAX(o1, 33, 6);
	ROW = 64;
	DRAX(o1, 33, 2);
	DRAX(o1, 36, 2);
	ROW = 65;
	DRAX(o1, 33, 2);
	DRAX(o1, 36, 2);
	ROW = 66;
	DRAX(o1, 32, 6);
	ROW = 67;
	DRAX(o1, 31, 2);
	DRAX(c2, 33, 2);
	DRAX(o1, 35, 4);
	ROW = 68;
	DRAX(o1, 30, 2);
	DRAX(c2, 32, 2);
	DRAX(o1, 34, 2);
	DRAX(c2, 36, 2);
	DRAX(o1, 38, 2);
	ROW = 69;
	DRAX(o1, 25, 10);
	DRAX(c2, 35, 4);
	DRAX(o1, 39, 4);
	ROW = 70;
	DRAX(o1, 28, 18);

}

void bucket(int X, int Y, u16 b1, u16 b2) {
	int ROW;
	ROW = Y + 0;
	DRAX(b2, 8 + X, 2);
	ROW = Y + 1;
	DRAX(b2, 7 + X, 4);
	ROW = Y + 2;
	DRAX(b2, 0 + X, 18);
	ROW = Y + 3;
	DRA1(b2, 0 + X);
	DRAX(b1, 1 + X, 16);
	DRA1(b2, 17 + X);
	ROW = Y + 4;
	DRA1(b2, 0 + X);
	DRAX(b1, 1 + X, 16);
	DRA1(b2, 17 + X);
	ROW = Y + 5;
	DRA1(b2, 1 + X);
	DRAX(b1, 2 + X, 14);
	DRA1(b2, 16 + X);
	ROW = Y + 6;
	DRAX(b2, 0 + X, 18);
	ROW = Y + 7;
	for (; ROW < Y + 14; ROW++) {
		DRA1(b2, 1 + X);
		DRAX(b1, 2 + X, 14);
		DRA1(b2, 16 + X);	
	}
	ROW = Y + 14;
	DRA1(b2, 2 + X);
	DRAX(b1, 3 + X, 12);
	DRA1(b2, 15 + X);
	ROW = Y + 15;
	DRAX(b2, 1 + X, 16);
	ROW = Y + 16;
	DRA1(b2, 2 + X);
	DRAX(b1, 3 + X, 12);
	DRA1(b2, 15 + X);
	ROW = Y + 17;
	DRA1(b2, 2 + X);
	DRAX(b1, 3 + X, 12);
	DRA1(b2, 15 + X);
	ROW = Y + 18;
	DRAX(b2, 2 + X, 14);
}

void frame1(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
	base(c1, c2, o1);
	bucket(2, 40, b1, b2);
	int ROW;
	ROW = 37;
	DRAX(o1, 36, 3);
	ROW = 38;
	DRAX(o1, 35, 5);
	ROW = 39;
	DRA1(o1, 34);
	DRA1(o1, 38);
	ROW = 40;
	DRA1(o1, 33);
	DRA1(o1, 38);
	ROW = 41;
	DRA1(o1, 32);
	DRAX(c1, 33, 4);
	DRA1(o1, 37);
	ROW = 42;
	DRA1(o1, 23);
	DRA1(o1, 31);
	DRA1(o1, 36);
	ROW = 43;
	DRA1(o1, 22);
	DRA1(c1, 23);
	DRA1(o1, 30);
	DRA1(c1, 31);
	DRA1(o1, 35);
	ROW = 44;
	DRAX(o1, 21, 3);
	DRA1(o1, 29);
	DRA1(o1, 34);
	ROW = 45;
	DRAX(o1, 19, 2);
	DRAX(c1, 21, 3);
	DRA1(o1, 28);
	DRA1(o1, 33);
	ROW = 46;
	DRA1(c1, 20);
	DRAX(o1, 21, 3);
	DRA1(o1, 27);
	DRA1(o1, 32);
	ROW = 47;
	DRAX(o1, 19, 2);
	DRA1(o1, 26);
	DRA1(o1, 31);
	ROW = 48;
	DRAX(o1, 25, 4);
	DRA1(o1, 30);
	ROW = 49;
	DRAX(o1, 13, 3);
	DRAX(o1, 22, 2);
	DRAX(o1, 28, 2);
	ROW = 50;
	DRAX(o1, 16, 2);
	DRAX(o1, 19, 3);
	DRAX(c1, 22, 3);
	DRAX(o1, 25, 3);
	ROW = 51;
	DRAX(o1, 12, 7);
	DRAX(c1, 19, 3);
	DRAX(o1, 22, 2);
	ROW = 52;
	DRAX(o1, 15, 3);
	DRA1(c1, 18);
	DRAX(o1, 19, 3);
	ROW = 53;
	DRAX(o1, 12, 7);
}

void frame2(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
	base(c1, c2, o1);
	bucket(0, 19, b1, b2);
	int ROW;
	ROW = 29;
	DRAX(o1, 12, 2);
	ROW = 30;
	DRAX(o1, 10, 2);
	DRAX(o1, 13, 2);
	ROW = 31;
	DRA1(o1, 9);
	DRAX(o1, 11, 2);
	DRA1(o1, 15);
	ROW = 32;
	DRA1(o1, 10);
	DRAX(o1, 12, 3);
	ROW = 33;
	DRAX(o1, 11, 5);
	DRA1(c1, 16);
	DRAX(o1, 17, 2);
	ROW = 34;
	DRAX(o1, 12, 3);
	DRA1(c1, 15);
	DRA1(o1, 16);
	DRA1(c1, 17);
	DRAX(o1, 18, 2);
	ROW = 35;
	DRAX(o1, 13, 2);
	DRAX(c1, 15, 2);
	DRAX(o1, 17, 3);
	ROW = 36;
	DRA1(o1, 15);
	DRAX(c1, 16, 3);
	DRAX(o1, 19, 2);
	DRA1(o1, 37);
	ROW = 37;
	DRAX(o1, 16, 2);
	DRAX(c1, 18, 3);
	DRAX(o1, 21, 18);
	ROW = 38;
	DRAX(o1, 18, 3);
	DRA1(c1, 21);
	DRAX(o1, 22, 2);
	DRAX(c1, 24, 13);
	DRAX(o1, 37, 3);
	ROW = 39;
	DRAX(o1, 21, 4);
	DRAX(c1, 25, 12);
	DRAX(o1, 37, 2);
	ROW = 40;
	DRAX(o1, 23, 15);


}

void frame3(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
	base(c1, c2, o1);
	bucket(13, 0, b1, b2);
	int ROW;
	ROW = 13;
	DRA1(o1, 22);
	DRA1(o1, 24);
	ROW = 14;
	DRA1(o1, 22);
	DRA1(o1, 24);
	DRA1(o1, 26);
	ROW = 15;
	DRA1(o1, 22);
	DRA1(o1, 24);
	DRA1(o1, 26);
	ROW = 16;
	DRAX(o1, 22, 3);
	DRA1(o1, 26);
	ROW = 17;
	DRAX(o1, 22, 4);
	ROW = 18;
	DRAX(o1, 22, 4);
	ROW = 19;
	DRA1(o1, 20);
	DRA1(c1, 21);
	DRA1(o1, 22);
	DRA1(c1, 23);
	DRA1(o1, 24);
	ROW = 20;
	DRA1(o1, 20);
	DRA1(c1, 21);
	DRAX(o1, 22, 2);
	DRA1(c1, 24);
	ROW = 21;
	DRA1(o1, 20);
	DRA1(c1, 21);
	DRA1(o1, 22);
	DRA1(o1, 25);
	ROW = 22;
	DRAX(o1, 21, 3);
	DRA1(o1, 25);
	ROW = 23;
	DRA1(o1, 24);
	DRA1(o1, 26);
	ROW = 24;
	DRA1(o1, 24);
	DRA1(o1, 26);
	ROW = 25;
	DRA1(o1, 24);
	DRA1(o1, 26);
	ROW = 26;
	DRA1(o1, 25);
	DRA1(o1, 27);
	ROW = 27;
	DRA1(o1, 25);
	DRAX(o1, 27, 2);
	ROW = 28;
	DRA1(o1, 25);
	DRA1(o1, 27);
	DRA1(c1, 28);
	ROW = 29;
	DRA1(o1, 26);
	DRAX(c1, 28, 2);
	ROW = 30;
	DRA1(o1, 26);
	DRAX(c1, 27, 4);
	DRA1(o1, 31);
	ROW = 31;
	DRA1(o1, 27);
	DRAX(c1, 28, 2);
	DRA1(o1, 32);
	ROW = 32;
	DRA1(o1, 28);
	DRA1(o1, 33);
	ROW = 33;
	DRA1(o1, 29);
	DRA1(o1, 34);
	ROW = 34;
	DRA1(o1, 30);
	DRA1(c1, 34);
	ROW = 35;
	DRA1(o1, 31);
	DRA1(c1, 34);
	DRA1(o1, 36);
	ROW = 36;
	DRA1(o1, 32);
	DRAX(c1, 33, 2);
	DRA1(o1, 37);
	ROW = 37;
	DRAX(o1, 37, 2);
	ROW = 38;
	DRA1(o1, 34);
	DRAX(o1, 37, 2);
	ROW = 39;
	DRAX(o1, 35, 4);
	ROW = 40;
	DRA1(o1, 37);
}

void frame4(u16 c1, u16 c2, u16 o1, u16 b1, u16 b2) {
	base(c1, c2, o1);
	bucket(25, 0, b1, b2);
	int ROW;
	ROW = 12;
	DRA1(o1, 35);
	DRA1(o1, 37);
	ROW = 13;
	DRA1(o1, 35);
	DRA1(o1, 37);
	DRA1(o1, 39);
	ROW = 14;
	DRA1(o1, 35);
	DRA1(o1, 37);
	DRA1(o1, 39);
	ROW = 15;
	DRAX(o1, 35, 3);
	DRA1(o1, 39);
	ROW = 16;
	DRA1(o1, 35);
	DRA1(c1, 36);
	DRAX(o1, 37, 2);
	ROW = 17;
	DRA1(o1, 35);
	DRA1(c1, 36);
	DRAX(o1, 37, 2);
	ROW = 18;
	for (; ROW < 23; ROW++) {
		DRA1(o1, 35);
		DRA1(c1, 36);
		DRA1(o1, 37);
	}
	ROW = 23;
	DRAX(o1, 35, 3);
	ROW = 24;
	DRAX(o1, 34, 4);
	ROW = 25;
	DRAX(o1, 34, 2);
	DRA1(o1, 37);
	ROW = 26;
	for (; ROW < 38; ROW++) {
		DRA1(o1, 34);
		DRAX(c1, 35, 2);
		DRA1(o1, 37);
	}
	ROW = 38;
	DRAX(o1, 34, 5);
	ROW = 39;
	DRAX(o1, 35, 3);
	ROW = 40;
	DRA1(o1, 36);
	
}
