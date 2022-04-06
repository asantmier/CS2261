#ifndef BATTLE_H
#define BATTLE_H

#include "mode0.h"
#include "game.h"

// Letter sprites
#define TILE_EXCLAMATION    ATTR2_TILEID(24, 16)
#define TILE_QUOTE          ATTR2_TILEID(25, 16)
#define TILE_POUND          ATTR2_TILEID(26, 16)
#define TILE_CURRENCY       ATTR2_TILEID(27, 16) // custom icon for in game currency
#define TILE_PERCENT        ATTR2_TILEID(28, 16)
#define TILE_AMPERSAND      ATTR2_TILEID(29, 16)
#define TILE_APOSTROPHE     ATTR2_TILEID(30, 16)
#define TILE_LPARANTHESIS   ATTR2_TILEID(31, 16)

#define TILE_RPARANTHESIS   ATTR2_TILEID(24, 17)
#define TILE_ASTERISK       ATTR2_TILEID(25, 17) // custom icon for a little selection icon
#define TILE_PLUS           ATTR2_TILEID(26, 17)
#define TILE_COMMA          ATTR2_TILEID(27, 17)
#define TILE_MINUS          ATTR2_TILEID(28, 17)
#define TILE_PERIOD         ATTR2_TILEID(29, 17)
#define TILE_FSLASH         ATTR2_TILEID(30, 17)
#define TILE_0              ATTR2_TILEID(31, 17)

#define TILE_1              ATTR2_TILEID(24, 18)
#define TILE_2              ATTR2_TILEID(25, 18)
#define TILE_3              ATTR2_TILEID(26, 18)
#define TILE_4              ATTR2_TILEID(27, 18)
#define TILE_5              ATTR2_TILEID(28, 18)
#define TILE_6              ATTR2_TILEID(29, 18)
#define TILE_7              ATTR2_TILEID(30, 18)
#define TILE_8              ATTR2_TILEID(31, 18)

#define TILE_9              ATTR2_TILEID(24, 19)
#define TILE_COLON          ATTR2_TILEID(25, 19)
#define TILE_SEMICOLON      ATTR2_TILEID(26, 19)
#define TILE_LANGLED        ATTR2_TILEID(27, 19)
#define TILE_EQUAL          ATTR2_TILEID(28, 19)
#define TILE_RANGLED        ATTR2_TILEID(29, 19)
#define TILE_QUESTION       ATTR2_TILEID(30, 19)
#define TILE_AT             ATTR2_TILEID(31, 19)

#define TILE_A              ATTR2_TILEID(24, 20)
#define TILE_B              ATTR2_TILEID(25, 20)
#define TILE_C              ATTR2_TILEID(26, 20)
#define TILE_D              ATTR2_TILEID(27, 20)
#define TILE_E              ATTR2_TILEID(28, 20)
#define TILE_F              ATTR2_TILEID(29, 20)
#define TILE_G              ATTR2_TILEID(30, 20)
#define TILE_H              ATTR2_TILEID(31, 20)

#define TILE_I              ATTR2_TILEID(24, 21)
#define TILE_J              ATTR2_TILEID(25, 21)
#define TILE_K              ATTR2_TILEID(26, 21)
#define TILE_L              ATTR2_TILEID(27, 21)
#define TILE_M              ATTR2_TILEID(28, 21)
#define TILE_N              ATTR2_TILEID(29, 21)
#define TILE_O              ATTR2_TILEID(30, 21)
#define TILE_P              ATTR2_TILEID(31, 21)

#define TILE_Q              ATTR2_TILEID(24, 22)
#define TILE_R              ATTR2_TILEID(25, 22)
#define TILE_S              ATTR2_TILEID(26, 22)
#define TILE_T              ATTR2_TILEID(27, 22)
#define TILE_U              ATTR2_TILEID(28, 22)
#define TILE_V              ATTR2_TILEID(29, 22)
#define TILE_W              ATTR2_TILEID(30, 22)
#define TILE_X              ATTR2_TILEID(31, 22)

#define TILE_Y              ATTR2_TILEID(24, 23)
#define TILE_Z              ATTR2_TILEID(25, 23)
#define TILE_LSQUARE        ATTR2_TILEID(26, 23)
#define TILE_BSLASH         ATTR2_TILEID(27, 23)
#define TILE_RSQUARE        ATTR2_TILEID(28, 23)
#define TILE_CARROT         ATTR2_TILEID(29, 23)
#define TILE_UNDERSCORE     ATTR2_TILEID(30, 23)
#define TILE_GRAVE          ATTR2_TILEID(31, 23) // custom icon for a little star in the top left

// Character to sprite TILE lookup stuff
// Take the character and subtract CHAR_START
#define CHAR_START '!'
extern const int text_tile_lkup[];

// Sprite ID table
enum { ALLY1_B = 0, ALLY2_B, ALLY3_B, ALLY4_B, ENEMY1_B, ENEMY2_B, ENEMY3_B, ENEMY4_B, TEXT_IDX };

// Some constants
#define CHAR_WIDTH 7 // while text sprites are 8 wide, the rightmost column of pixels is always empty
#define CHAR_HEIGHT 8 
#define TEXTBOX_WIDTH (121) // that's 17 characters
#define TEXTBOX_HEIGHT (3 * CHAR_HEIGHT) // that's 3 lines of text
#define TEXT_TOP_X 59
#define TEXT_TOP_Y 11
#define TEXT_BOTTOM_X 59
#define TEXT_BOTTOM_Y 123

// Textbox functions
extern int lettersActive;
void eraseAllText();
void drawText(char* str, int textboxX, int textboxY, int textboxWidth, int textboxHeight);

// Battle status enum
enum { LOST = -1, ONGOING = 0, WON = 1 };

// Battle status used by main to figure out how the battle is going
extern int battleStatus;

// Init functions
void initBattle(int opponentType);
void resetOpponents();

// Update functions
void updateBattle();
void drawCombatants();

// TODO for a healthbar you could theoretically make 8 healthbar sprites without reducing tiles
// and when you want to change health, swap to mode 3 and modify the tile pixels (or would you even
// need to change to mode 3 for that?)

// I want the sprites to be bigger on the battle screen
// Either we can have more sprites on the sprite sheet for this which might be ok
// but if we can't we could use smaller sprites and use the affine matrix
// We've got like 16(?) affine sprites to work with and we would need 8 for combatants
// and maybe a few more for special effects

// Health bars DEFINITLY take LESS space that numbers!

#endif