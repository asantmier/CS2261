
// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawRect(int, int, unsigned short);
void drawParallelogram(int, int, unsigned short);


// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Size Macros
//TODO 2.0: Choose a width and height for your rectangles
#define RECT_WIDTH 40
#define RECT_HEIGHT 20

//TODO 3.0: Choose a width and height for your parallelograms


int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    //TODO 1.1: Test your setPixel function (you can comment this back out later)
    // setPixel(0, 0, RED);
    // setPixel(239, 0, GREEN);
    // setPixel(239, 159, BLUE);

    //TODO 2.2: Call your drawRect function twice
    drawRect(0, 0, CYAN);
    drawRect(114, 79, MAGENTA);

    //TODO 3.2: Call your drawParallelogram function once
    drawParallelogram(100, 13, YELLOW);
    
    while(1);
}


void setPixel(int col, int row, unsigned short color) {

    // TODO 1.0: Complete this function
    videoBuffer[OFFSET(col, row, 240)] = color;

}

void drawRect(int col, int row, unsigned short color) {

    // TODO 2.1: Complete this function
    for(int x = 0; x < RECT_WIDTH; x++) {
        for(int y = 0; y < RECT_HEIGHT; y++) {
            videoBuffer[OFFSET(col + x, row + y, 240)] = color;
        }
    }

}

void drawParallelogram(int col, int row, unsigned short color) {

    // TODO 3.1: Complete this function
    int off = 0;
    for(int y = 0; y < 30; y++) {
        for(int x = 0; x < 40; x++) {
            videoBuffer[OFFSET(col + x + off, row + y, 240)] = color;
        }
        off++;
    }

}
