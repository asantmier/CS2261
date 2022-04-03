#include "mode0.h"
#include "game.h"
#include <stdlib.h>
#include "print.h"

PLAYER player;

void init() {
    initPlayer();
}

void initPlayer() {
    player.int_x = 0;
    player.int_y = 0;
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
    // update the internal coordinates
    player.int_x += player.dx;
    player.int_y += player.dy;
    // first off, lets check to make sure the internal coordinates are within the level
    if (player.int_x < 0) { // off the left edge
        player.int_x = 0;
    }
    // We can't decode or else we lose precision!
    if (player.int_x + ENCODE26_6(player.width) > ENCODE26_6(GAMEWIDTH)) { // off the right edge
        player.int_x = ENCODE26_6(GAMEWIDTH - player.width);
    }
    if (player.int_y < 0) { // off the top
        player.int_y = 0;
    }
    if (player.int_y + ENCODE26_6(player.height) > ENCODE26_6(GAMEHEIGHT)) { // off the bottom
        player.int_y = ENCODE26_6(GAMEHEIGHT - player.height);
    }

    // Update the screen space coordinates now that we have valid internal coordinates
    player.x = DECODE26_6(player.int_x) - bg2xOff;
    player.y = DECODE26_6(player.int_y) - bg2yOff;
    // If the sprite is outside of the camera bounds, try to move it
    if (player.x < CAM_BOUND_L) {
        // First, check if we can even move the camera left
        if (bg2xOff > 0) { 
            int xDiff = CAM_BOUND_L - player.x;
            if (xDiff <= bg2xOff) { // we can move the whole distance
                player.x = CAM_BOUND_L;
                bg2xOff -= xDiff;
            } else { // we can only move part of the distance
                int netDx = xDiff - bg2xOff; // this is how far we can't move
                bg2xOff -= xDiff - netDx; // move the camera left how far we can move
                player.x -= netDx; // move the player left how far we can't move
            }
        }
    }
    if (player.x + player.width > CAM_BOUND_R) {
        if (bg2xOff < GAMEWIDTH - SCREENWIDTH) { 
            int xDiff = player.x + player.width - CAM_BOUND_R;
            if (xDiff + bg2xOff <= GAMEWIDTH - SCREENWIDTH) {
                player.x = CAM_BOUND_R - player.width;
                bg2xOff += xDiff;
            } else {
                int netDx = (xDiff + bg2xOff + SCREENWIDTH) - GAMEWIDTH;
                bg2xOff += xDiff - netDx;
                player.x += netDx;
            }
        }
    }
    if (player.y < CAM_BOUND_T) {
        if (bg2yOff > 0) { 
            int yDiff = CAM_BOUND_T - player.y;
            if (yDiff <= bg2yOff) {
                player.y = CAM_BOUND_T;
                bg2yOff -= yDiff;
            } else {
                int netDy = yDiff - bg2yOff;
                bg2yOff -= yDiff - netDy;
                player.y -= netDy;
            }
        }
    }
    if (player.y + player.height > CAM_BOUND_B) {
        if (bg2yOff < GAMEHEIGHT - SCREENHEIGHT) { 
            int yDiff = player.y + player.height - CAM_BOUND_B;
            if (yDiff + bg2yOff <= GAMEHEIGHT - SCREENHEIGHT) {
                player.y = CAM_BOUND_B - player.height;
                bg2yOff += yDiff;
            } else {
                int netDy = (yDiff + bg2yOff + SCREENHEIGHT) - GAMEHEIGHT;
                bg2yOff += yDiff - netDy;
                player.y += netDy;
            }
        }
    }
    mgba_printf("internal: (%d, %d)", player.int_x, player.int_y);
}

void drawPlayer() {
    shadowOAM[PLAYER_IDX].attr0 = (player.y & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[PLAYER_IDX].attr1 = (player.x & COLMASK) | ATTR1_TINY;
    shadowOAM[PLAYER_IDX].attr2 = ATTR2_TILEID(0, 0);
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
    drawPlayer();
}