#include "mode0.h"
#include "game.h"
#include <stdlib.h>

PLAYER player;

void init() {
    initPlayer();
}

void initPlayer() {
    player.x = 0;
    player.y = 0;
    player.dx = 0;
    player.dy = 0;
    player.width = 16;
    player.height = 8;
}

void update() {
    updatePlayer();
}

// Move the player
void movePlayer() {
    player.x += player.dx;
    player.y += player.dy;
    if (player.x < 0) player.x = 0;
    if (DECODE26_6(player.x) + player.width > GAMEWIDTH) player.x = ENCODE26_6(GAMEWIDTH - player.width);
    if (player.y < 0) player.y = 0;
    if (DECODE26_6(player.y) + player.height > GAMEHEIGHT) player.y = ENCODE26_6(GAMEHEIGHT - player.height);
}

void updatePlayer() {
    // Interpret player input
    int slowMode = 0;
    if (BUTTON_HELD(BUTTON_R)) {
        slowMode = 1;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.dx += -(slowMode ? PLAYER_MAX_A / 2 : PLAYER_MAX_A);
    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.dx += (slowMode ? PLAYER_MAX_A / 2 : PLAYER_MAX_A);
    } else {
        if (player.dx > 0) {
            player.dx -= PLAYER_DRAG;
        } else if (player.dx < 0) {
            player.dx += PLAYER_DRAG;
        }
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player.dy += -(slowMode ? PLAYER_MAX_A / 2 : PLAYER_MAX_A);
    } else if (BUTTON_HELD(BUTTON_DOWN)) {
        player.dy += (slowMode ? PLAYER_MAX_A / 2 : PLAYER_MAX_A);
    } else {
        if (player.dy > 0) {
            player.dy -= PLAYER_DRAG;
        } else if (player.dy < 0) {
            player.dy += PLAYER_DRAG;
        }
    }
    if (player.dx > (slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V)) player.dx = (slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V);
    if (player.dx < -(slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V)) player.dx = -(slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V);
    if (player.dy > (slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V)) player.dy = (slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V);
    if (player.dy < -(slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V)) player.dy = -(slowMode ? PLAYER_MAX_V / 2 : PLAYER_MAX_V);

    // Move player
    movePlayer();
    
    // Update sprite
    shadowOAM[PLAYER_IDX].attr0 = DECODE26_6(player.y) | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[PLAYER_IDX].attr1 = DECODE26_6(player.x) | ATTR1_TINY;
    shadowOAM[PLAYER_IDX].attr2 = ATTR2_TILEID(0, 0);
}