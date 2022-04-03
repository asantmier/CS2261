#include "mode0.h"
#include "game.h"
#include <stdlib.h>
#include "print.h"

PLAYER player;
BULLET bullets[NUM_BULLETS];

void init() {
    initPlayer();
    initBullets();
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
    player.facing = RIGHT;
}

void initBullets() {
    for (int i = 0; i < NUM_BULLETS; i++) {
        bullets[i].int_x = 0;
        bullets[i].int_y = 0;
        bullets[i].x = 0;
        bullets[i].y = 0;
        bullets[i].dx = 0;
        bullets[i].dy = 0;
        bullets[i].width = 2;
        bullets[i].height = 1;
        bullets[i].active = 0;
        bullets[i].spriteIdx = BULLET1 + i; // bullets are contiguous
    }
}

void update() {
    updatePlayer();
    for (int i = 0; i < NUM_BULLETS; i++) {
        if (bullets[i].active) {
            updateBullet(&bullets[i]);
        }
    }
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
}

// ShadowOAM sprite stuff for the player
void drawPlayer() {
    shadowOAM[PLAYER_IDX].attr0 = (player.y & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[PLAYER_IDX].attr1 = (player.x & COLMASK) | ATTR1_TINY;
    shadowOAM[PLAYER_IDX].attr2 = ATTR2_TILEID(0, 0);
}

// applies high velocity unemployment to the player
void firePlayer() {
    // Player shoots in the direction they're facing
    fp64 dx, startx, starty;
    if (player.facing == RIGHT) { // right
        dx = BULLET_MAX_V;
        startx = player.int_x + ENCODE26_6(player.width);
        starty = player.int_y;
    } else { // left
        dx = -BULLET_MAX_V;
        startx = player.int_x - ENCODE26_6(bullets[0].width);
        starty = player.int_y;
    }
    for (int i = 0; i < NUM_BULLETS; i++) {
        if (!bullets[i].active) {
            bullets[i].active = 1;
            bullets[i].dx = dx;
            bullets[i].dy = 0;
            bullets[i].int_x = startx;
            bullets[i].int_y = starty;
            bullets[i].x = DECODE26_6(bullets[i].int_x);
            bullets[i].y = DECODE26_6(bullets[i].int_y);
            mgba_printf("dx: %d, startx: %d, starty: %d", dx, startx, starty);
            break;
        }
    }
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

    if (player.dx > 0) {
        player.facing = RIGHT;
    } else if (player.dx < 0) {
        player.facing = LEFT;
    }

    // bang bang
    if (BUTTON_PRESSED(BUTTON_A)) {
        firePlayer();
    }
    
    // Update sprite
    drawPlayer();
}

void updateBullet(BULLET* bullet) {
    bullet->int_x += bullet->dx;
    bullet->int_y += bullet->dy;
    // remove the bullet if it hits the collision map, level edge, or a dude
    if ((bullet->int_x < 0) ||
        (bullet->int_x + ENCODE26_6(bullet->width) > ENCODE26_6(GAMEWIDTH)) ||
        (bullet->int_y < 0) ||
        (bullet->int_y + ENCODE26_6(bullet->height) > ENCODE26_6(GAMEHEIGHT))) 
    {
        bullet->active = 0;
    }
    bullet->x = DECODE26_6(bullet->int_x) - bg2xOff;
    bullet->y = DECODE26_6(bullet->int_y) - bg2yOff;
    // Only draw the bullet if any part of it is onscreen
    if (bullet->active && !(
        (bullet->x + bullet->width - 1 < 0) ||
        (bullet->x > SCREENWIDTH) ||
        (bullet->y + bullet->height - 1 < 0) ||
        (bullet->y > SCREENHEIGHT)))
    {
        shadowOAM[bullet->spriteIdx].attr0 = (bullet->y & ROWMASK) | ATTR0_REGULAR | ATTR0_SQUARE;
        shadowOAM[bullet->spriteIdx].attr1 = (bullet->x & COLMASK) | ATTR1_TINY;
        // The bullet is gonna be way too big but this is just placeholder until we get a real sprite
        shadowOAM[bullet->spriteIdx].attr2 = ATTR2_TILEID(8, 16);
    } else {
        shadowOAM[bullet->spriteIdx].attr0 = ATTR0_HIDE;
    }
}