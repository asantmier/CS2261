#ifndef BATTLE_H
#define BATTLE_H

#include "mode0.h"

// Letters
#define TILE_A ATTR2_TILEID(24, 16)
#define TILE_B ATTR2_TILEID(25, 16)
#define TILE_C ATTR2_TILEID(26, 16)
#define TILE_D ATTR2_TILEID(27, 16)
#define TILE_E ATTR2_TILEID(28, 16)
#define TILE_F ATTR2_TILEID(29, 16)
#define TILE_G ATTR2_TILEID(30, 16)
#define TILE_H ATTR2_TILEID(31, 16)

#define TILE_I ATTR2_TILEID(24, 17)
#define TILE_J ATTR2_TILEID(25, 17)
#define TILE_K ATTR2_TILEID(26, 17)
#define TILE_L ATTR2_TILEID(27, 17)
#define TILE_M ATTR2_TILEID(28, 17)
#define TILE_N ATTR2_TILEID(29, 17)
#define TILE_O ATTR2_TILEID(30, 17)
#define TILE_P ATTR2_TILEID(31, 17)

#define TILE_Q ATTR2_TILEID(24, 18)
#define TILE_R ATTR2_TILEID(25, 18)
#define TILE_S ATTR2_TILEID(26, 18)
#define TILE_T ATTR2_TILEID(27, 18)
#define TILE_U ATTR2_TILEID(28, 18)
#define TILE_V ATTR2_TILEID(29, 18)
#define TILE_W ATTR2_TILEID(30, 18)
#define TILE_X ATTR2_TILEID(31, 18)

#define TILE_Y ATTR2_TILEID(24, 19)
#define TILE_Z ATTR2_TILEID(25, 19)
#define TILE_0 ATTR2_TILEID(26, 19)
#define TILE_1 ATTR2_TILEID(27, 19)
#define TILE_2 ATTR2_TILEID(28, 19)
#define TILE_3 ATTR2_TILEID(29, 19)
#define TILE_4 ATTR2_TILEID(30, 19)
#define TILE_5 ATTR2_TILEID(31, 19)

#define TILE_6 ATTR2_TILEID(24, 20)
#define TILE_7 ATTR2_TILEID(25, 20)
#define TILE_8 ATTR2_TILEID(26, 20)
#define TILE_9 ATTR2_TILEID(27, 20)
#define TILE_COLON ATTR2_TILEID(28, 20)
#define TILE_PERIOD ATTR2_TILEID(29, 20)
#define TILE_COMMA ATTR2_TILEID(30, 20)
#define TILE_SLASH ATTR2_TILEID(31, 20)

// Take the character and subtract ','
extern const int text_tile_lkup[];

#define TEXTBOX_WIDTH 14
#define TEXTBOX_HEIGHT 3
#define TEXT_TOP_X 64
#define TEXT_TOP_Y 12
#define TEXT_BOTTOM_X 64
#define TEXT_BOTTOM_Y 124

// Sprite ID table
enum { ALLY1_B = 0, ALLY2_B, ALLY3_B, ALLY4_B, ENEMY1_B, ENEMY2_B, ENEMY3_B, ENEMY4_B, TEXT_IDX };

// Textbox functions
extern int lettersActive;
void drawText(char* str, int x, int y, int charWidth, int charHeight);

// Init functions
void initBattle();

// Update functions
void updateBattle();

// TODO for a healthbar you could theoretically make 8 healthbar sprites without reducing tiles
// and when you want to change health, swap to mode 3 and modify the tile pixels (or would you even
// need to change to mode 3 for that?)

// Health bars DEFINITLY take LESS space that numbers!

#endif