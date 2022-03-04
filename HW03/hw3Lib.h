#ifndef HW_LIB_H
#define HW_LIB_H

// Common Typedefs
typedef unsigned short u16;
typedef unsigned int   u32;

// Easy container for 2d images
typedef struct {
	int row, col, oldRow, oldCol, rDel, cDel, height, width;
	const unsigned short* image;
} Sprite;

// Common Macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// DMA related stuff
typedef struct {
    const volatile void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMAREC;
#define DMA ((volatile DMAREC*)0x040000b0)
#define DMA_ON (1 << 31)
#define DMA_CS_32 (1 << 26)
#define DMA_CS_16 (0 << 26)
#define DMA_DST_INC (0 << 21)
#define DMA_DST_DEC (1 << 21)
#define DMA_DST_FIX (2 << 21)
#define DMA_SRC_INC (0 << 23)
#define DMA_SRC_DEC (1 << 23)
#define DMA_SRC_FIX (2 << 23)
#define DMA_HALFSCREEN 19200

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// Video Buffer
extern volatile unsigned short *videoBuffer;

// Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define GRAY COLOR(15,15,15)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define PINK COLOR(31, 23, 23)
#define GOLD COLOR(31, 29, 17)

// Mode 3 Drawing Functions
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, volatile unsigned short color);
void drawSprite(Sprite* sprite);
void eraseFullSprite(Sprite* sprite, unsigned short bgColor);
void drawImage(int col, int row, int width, int height, const unsigned short* image);
void eraseMovingSprite(Sprite* sprite, unsigned short bgColor);
void eraseMovingImage(int col, int row, int oldCol, int oldRow, int width, int height, unsigned short bgColor);
void fillScreen(volatile unsigned short color);

// Miscellaneous Drawing Functions
void waitForVBlank();

// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

// ============================== MISCELLANEOUS ===============================

// Miscellaneous Functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

#endif