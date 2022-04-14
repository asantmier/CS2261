/* PROGRESS REPORT
 * So far the core gameplay mechanics of the game are complete, or at least are programmed and just need to be used.
 * All world exploration mechanics are in place, with the exception of items you can pick up to heal yourself.
 * The world design is also done, but I haven't taken the time to place all the enemies and mines that pose a threat to
 * the player. I have not yet implemented a parallax effect for the background (the blue one behind the level).
 * The combat system is functional enough to consider done (it's very basic, but that's perfectly fine at this point),
 * but I still need to add enemy and move diversity ans the ability to capture wounded enemies as teammates.
 * Basically, most of the programming is done, I just need to make more entries in the lists that already exist.
 * (Also I need to do art, sound, state backgrounds, and other milestone 4 stuff).
 * 
 * BUGS: Right now, bullets just don't work at all. I forgot they existed for a bit and so they broke. (*MAJOR)
 *       When one team finishes their turns in combat, the turn count display immediately switches to the other team's
 *         turns instead of remaining empty during the wait animation. (*minor)
 * 
 * HOW TO PLAY: Directional pad to move, right bumper to move slower, don't worry about shooting (see above)
 *     If you collide with the red boxes (enemy dev art) you will enter combat.
 *     If you collide with the pink boxes (mine dev art) you will take damage.
 *     Your health bar is at the top of your screen, if it runs out you lose.
 *     Use the directional pad, A (select), and B (go back) to navigate the menus in combat. Defeat all the enemies to win.
 *     If the enemies defeat your team, you will lose the battle and take damage. Your team's health currently resets back
 *     to maximum after combat to account for the absolute lack of gameplay balance.
*/


#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "print.h"
#include "world.h"
#include "battle.h"
#include "game.h"
#include "tempspritesheet.h"
#include "tempsplash.h"
#include "tempinstructions.h"
#include "temppause.h"
#include "tempwin.h"
#include "templose.h"
#include "tempbattle.h"
#include "world1.h"
#include "world1parallax.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToBattle();
void battle();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum {
    START,
    INSTRUCTIONS,
    GAME,
    BATTLE,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];
fp256 bg2xOff, bg2yOff;

// Timer for srand
int randTimer;

int main() {
    // Enable debug logging
    mgba_open();

    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case BATTLE:
            battle();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    // Turn of display so the weirdest thing the player sees is black
    REG_DISPCTL = MODE1;
    // The almighty DMA
    // Sprites
    DMANow(3, &tempspritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, &tempspritesheetTiles, &CHARBLOCK[4], DMA_32 | (tempspritesheetTilesLen / 4));
    // Backgrounds
    // BG0 contains the splashscreen. Later it will contain the battle background
    DMANow(3, &tempsplashTiles, &CHARBLOCK[1], DMA_32 | (tempsplashTilesLen / 4));
    DMANow(3, &tempsplashMap, &SCREENBLOCK[15], DMA_32 | (tempsplashMapLen / 4));
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(15) | BG_8BPP | BG_SIZE_SMALL;
    // BG1 contains the instructions. Later it will contain the parallax background
    DMANow(3, &tempinstructionsTiles, &CHARBLOCK[2], DMA_32 | (tempinstructionsTilesLen / 4));
    DMANow(3, &tempinstructionsMap, &SCREENBLOCK[22], DMA_32 | (tempinstructionsMapLen / 4));
    // Priority is set to 3 so that it draws below everything
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(22) | BG_8BPP | BG_SIZE_TALL | 3;
    // BG2 contains the world. It's a 128x tile map so it uses the entire 3rd charblock for its map
    DMANow(3, &world1Tiles, &CHARBLOCK[0], DMA_32 | (world1TilesLen / 4));
    DMANow(3, &world1Map, &SCREENBLOCK[24], DMA_32 | (world1MapLen / 4));
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_8BPP | BG_SIZE_LARGE | BG_WRAP;
    *REG_BG2_AFFINE = bg_aff_default;
    // Move background back to its origin
    bg2xOff = 0;
    bg2yOff = 0;
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);
    // begone sprites
    hideSprites();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    // Doing this makes the entire screen flash black for 1 frame when restarting the game rather than introducing a
    // black tearing artifact at the top of the screen for 1 frame. I think it looks better
    waitForVBlank();

    // gaming: activated
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;
    randTimer = 0;

    // its gamer time
    goToStart();
}

// Sets up the start state.
void goToStart() {
    DMANow(3, &tempsplashPal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG0_ENABLE;

    state = START;
}

// Runs every frame of the start state.
void start() {
    randTimer++;
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        // Seed RNG
        srand(randTimer);
        initGame();
        initWorld();
        DMANow(3, &world1parallaxTiles, &CHARBLOCK[2], DMA_32 | (world1parallaxTilesLen / 4));
        DMANow(3, &world1parallaxMap, &SCREENBLOCK[22], DMA_32 | (world1parallaxMapLen / 4));
        goToGame();
    }

    waitForVBlank();

}

// Sets up instructions
void goToInstructions() {
    DMANow(3, &tempinstructionsPal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG1_ENABLE;

    state = INSTRUCTIONS;
}

// Runs every frame of instructions
void instructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    waitForVBlank();

}

// Sets up the game state.
void goToGame() {
    DMANow(3, &world1Pal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG2_ENABLE | BG1_ENABLE;

    state = GAME;
}

// Runs every frame of the game state.
void game() {
    updateWorld();

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        goToWin();
    }
    
    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 128 * 4);
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);

    if (submarineHp <= 0) {
        goToLose();
    }

    if (doBattle) {
        // Turn off all the sprites from the game state
        hideSprites();
        DMANow(3, &shadowOAM, OAM, 128 * 4);
        initBattle(enemies[opponentIdx].type); // tell the battle system what kind of enemy we're encountering
        goToBattle();
    }
}

// Sets up the battle state
void goToBattle() {
    // DMA in the battle background (maybe we could do this earlier?)
    DMANow(3, &tempbattlePal, PALETTE, 256);
    DMANow(3, &tempbattleTiles, &CHARBLOCK[1], DMA_32 | (tempbattleTilesLen / 4));
    DMANow(3, &tempbattleMap, &SCREENBLOCK[15], DMA_32 | (tempbattleMapLen / 4));
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG0_ENABLE;

    state = BATTLE;
}

// Runs every frame of the battle state
void battle() {
    updateBattle();

    if (battleStatus == LOST) {
        submarineHp -= 10;
        hideSprites();
        DMANow(3, &shadowOAM, OAM, 128 * 4);
        returnFromBattle(0);
        goToGame();
        // goToLose();
    } else if (battleStatus == WON) {
        for (int i = 0; i < 4; i++) {
            battleAllies[i].hp = battleAllies[i].maxHp;
        }
        // Turn off all the sprites from the battle state
        hideSprites();
        DMANow(3, &shadowOAM, OAM, 128 * 4);
        returnFromBattle(1);
        goToGame();
    }

    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 128 * 4);
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);
}

// Sets up the pause state.
void goToPause() {
    DMANow(3, &temppausePal, PALETTE, 256);
    DMANow(3, &temppauseTiles, &CHARBLOCK[1], DMA_32 | (temppauseTilesLen / 4));
    DMANow(3, &temppauseMap, &SCREENBLOCK[15], DMA_32 | (temppauseMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = PAUSE;
}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}

// Sets up the win state.
void goToWin() {
    DMANow(3, &tempwinPal, PALETTE, 256);
    DMANow(3, &tempwinTiles, &CHARBLOCK[1], DMA_32 | (tempwinTilesLen / 4));
    DMANow(3, &tempwinMap, &SCREENBLOCK[15], DMA_32 | (tempwinMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = WIN;
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}

// Sets up the lose state.
void goToLose() {
    DMANow(3, &templosePal, PALETTE, 256);
    DMANow(3, &temploseTiles, &CHARBLOCK[1], DMA_32 | (temploseTilesLen / 4));
    DMANow(3, &temploseMap, &SCREENBLOCK[15], DMA_32 | (temploseMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}