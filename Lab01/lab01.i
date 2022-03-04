# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 24 "lab01.c"
void setPixel(int, int, unsigned short);
void drawRect(int, int, unsigned short);
void drawParallelogram(int, int, unsigned short);



volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
# 40 "lab01.c"
int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);







    drawRect(0, 0, ((0) | (31)<<5 | (31)<<10));
    drawRect(114, 79, ((31) | (0)<<5 | (31)<<10));


    drawParallelogram(100, 13, ((31) | (31)<<5 | (0)<<10));

    while(1);
}


void setPixel(int col, int row, unsigned short color) {


    videoBuffer[((row)*(240)+(col))] = color;

}

void drawRect(int col, int row, unsigned short color) {


    for(int x = 0; x < 40; x++) {
        for(int y = 0; y < 20; y++) {
            videoBuffer[((row + y)*(240)+(col + x))] = color;
        }
    }

}

void drawParallelogram(int col, int row, unsigned short color) {


    int off = 0;
    for(int y = 0; y < 30; y++) {
        for(int x = 0; x < 40; x++) {
            videoBuffer[((row + y)*(240)+(col + x + off))] = color;
        }
        off++;
    }

}
