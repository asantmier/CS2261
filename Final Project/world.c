#include <stdlib.h>
#include "mode0.h"
#include "print.h"
#include "world.h"
#include "tempbackground_collision.h"

unsigned char* collisionMap = (unsigned char*) tempbackground_collisionBitmap;

PLAYER player;
BULLET bullets[NUM_BULLETS];
ENEMY enemies[NUM_ENEMIES];
const ENEMY _disable_enemy_ = { 0, 0, 0, 0, 0, 0, 16, 8, 0, ENEMY1, PASSIVE, FISH };
#define DISABLE_ENEMY { 0, 0, 0, 0, 0, 0, 16, 8, 0, ENEMY1, PASSIVE, FISH }
LEVEL levels[NUM_LEVELS] = {
    { // start 1st LEVEL constructor
        { // start ENEMY list 
            { 50 * 64, 50 * 64, 50, 50, 0, 0, 16, 8, 1, ENEMY1, PASSIVE, FISH }, // 1
            { 60 * 64, 190 * 64, 60, 190, 0, 0, 16, 8, 1, ENEMY2, PASSIVE, SHARK }, // 2
            DISABLE_ENEMY, // 3
            DISABLE_ENEMY, // 4
            DISABLE_ENEMY, // 5
        }
    } 
};

int level = 0; // level counter
int doBattle = 0;
int opponentIdx; // we trust that we remember to set this each time

void returnFromBattle(int victory) {
    if (victory) {
        doBattle = 0;
        enemies[opponentIdx].active = 0;
        shadowOAM[enemies[opponentIdx].spriteIdx].attr0 = ATTR0_HIDE; // make sure they go away
    } else {
        // lose the game
    }
}

void initWorld() {
    level = 0;
    doBattle = 0;

    initPlayer();
    initBullets();
    initEnemies();
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

void initEnemies() {
    for (int i = 0; i < NUM_ENEMIES; i++) {
        enemies[i].int_x = levels[level].enemyList[i].int_x;
        enemies[i].int_y = levels[level].enemyList[i].int_y;
        enemies[i].x = DECODE26_6(enemies[i].int_x) - bg2xOff; // doesn't need to be preset
        enemies[i].y = DECODE26_6(enemies[i].int_y) - bg2yOff; // doesn't need to be preset
        enemies[i].dx = levels[level].enemyList[i].dx;
        enemies[i].dy = levels[level].enemyList[i].dy;
        enemies[i].width = levels[level].enemyList[i].width;
        enemies[i].height = levels[level].enemyList[i].height;
        enemies[i].active = levels[level].enemyList[i].active;
        enemies[i].spriteIdx = ENEMY1 + i; // doesn't need to be preset
        enemies[i].ai = levels[level].enemyList[i].ai; // enemies chasing the player is a problem for later
        enemies[i].type = levels[level].enemyList[i].type;
    }
}

void doCollision() {
    for (int i = 0; i < NUM_ENEMIES; i++) {
        if (enemies[i].active) {
            if (collision(player.int_x, player.int_y, ENCODE26_6(player.width), ENCODE26_6(player.height),
            enemies[i].int_x, enemies[i].int_y, ENCODE26_6(enemies[i].width), ENCODE26_6(enemies[i].height))) {
                // DO BATTLE
                doBattle = 1;
                opponentIdx = i;
                return;
            }
        }
    }
}

void updateWorld() {
    updatePlayer();
    for (int i = 0; i < NUM_BULLETS; i++) {
        if (bullets[i].active) {
            updateBullet(&bullets[i]);
        }
    }
    for (int i = 0; i < NUM_ENEMIES; i++) {
        if (enemies[i].active) {
            updateEnemy(&enemies[i]);
        }
    }
    doCollision(); // BATTLE IS FLAGGED HERE
}

// Move the player
void movePlayer() {
    // Lets figure out how far we can travel
    // first we need to make sure we land within the world
    fp64 rdx = player.dx;
    fp64 rdy = player.dy;
    // first off, lets check to make sure the internal coordinates are within the level
    // We can't decode or else we lose precision! both of these statements also cannot be true
    if (player.int_x + player.dx < 0) { // off the left edge
        rdx = player.dx - (player.int_x + player.dx);
    } else if (player.int_x + player.dx + ENCODE26_6(player.width) > ENCODE26_6(GAMEWIDTH)) { // off the right edge
        rdx = player.dx - (player.int_x + player.dx + ENCODE26_6(player.width) - ENCODE26_6(GAMEWIDTH));
    }
    if (player.int_y + player.dy < 0) { // off the top
        rdy = player.dy - (player.int_y + player.dy);
    } else if (player.int_y + ENCODE26_6(player.height) > ENCODE26_6(GAMEHEIGHT)) { // off the bottom
        rdy = player.dy - (player.int_y + player.dy + ENCODE26_6(player.height) - ENCODE26_6(GAMEHEIGHT));
    }
    // Now that we know how fast we are allowed to go without breaking the game, where can we land that isn't in a wall
    // We're gonna check every quarter step of travel
    // TODO possible optimization, can we get away with half steps?
    if (collisionCheck(collisionMap, 1024, DECODE26_6(player.int_x + rdx), DECODE26_6(player.int_y + rdy), player.width, player.height) > 0) {
        if (collisionCheck(collisionMap, 1024, DECODE26_6(player.int_x + ((rdx * 3) / 4)), DECODE26_6(player.int_y + ((rdy * 3) / 4)), player.width, player.height) > 0) {
            if (collisionCheck(collisionMap, 1024, DECODE26_6(player.int_x + (rdx / 2)), DECODE26_6(player.int_y + (rdy / 2)), player.width, player.height) > 0) {
                if (collisionCheck(collisionMap, 1024, DECODE26_6(player.int_x + (rdx / 4)), DECODE26_6(player.int_y + (rdy / 4)), player.width, player.height) > 0) {
                    // you can't move
                    rdx = 0;
                    rdy = 0;
                }  else { 
                    // else 1/4 is ok
                    rdx /= 4;
                    rdy /= 4;
                    // We have to decode encode to keep consistent with the fact that the 6 decimal digits aren't checked for collision
                    // We could totally just bitmask this though
                    player.int_x = ENCODE26_6(DECODE26_6(player.int_x + rdx));
                    player.int_y = ENCODE26_6(DECODE26_6(player.int_y + rdy));
                }
            }  else {
                // else 1/2 is ok
                rdx /= 2;
                rdy /= 2;
                player.int_x = ENCODE26_6(DECODE26_6(player.int_x + rdx));
                player.int_y = ENCODE26_6(DECODE26_6(player.int_y + rdy));
            }
        }  else {
            // else 3/4 is ok
            rdx = (rdx * 3) / 4;
            rdy = (rdy * 3) / 4;
            player.int_x = ENCODE26_6(DECODE26_6(player.int_x + rdx));
            player.int_y = ENCODE26_6(DECODE26_6(player.int_y + rdy));
        }
    } else {
        // else rdx, rdy is ok, no change needed
        player.int_x += rdx;
        player.int_y += rdy;
    }
    // TODO let the player slide along walls maybe
    
    // If we hit something in a direction, zero our directional velocity
    if (abs(rdx) < abs(player.dx)) {
        player.dx = 0;
        
    }
    if (abs(rdy) < abs(player.dy)) {
        player.dy = 0;
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
            break;
        }
    }
}

// Update the player
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

// Update a bullet
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

// Update an enemy
void updateEnemy(ENEMY* enemy) {
    // Right now enemies don't do anything
    enemy->int_x += enemy->dx;
    enemy->int_y += enemy->dy;
    enemy->x = DECODE26_6(enemy->int_x) - bg2xOff;
    enemy->y = DECODE26_6(enemy->int_y) - bg2yOff;
    // Only draw the enemy if any part of it is onscreen
    if (enemy->active && !(
        (enemy->x + enemy->width - 1 < 0) ||
        (enemy->x > SCREENWIDTH) ||
        (enemy->y + enemy->height - 1 < 0) ||
        (enemy->y > SCREENHEIGHT)))
    {
        shadowOAM[enemy->spriteIdx].attr0 = (enemy->y & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[enemy->spriteIdx].attr1 = (enemy->x & COLMASK) | ATTR1_TINY;
        shadowOAM[enemy->spriteIdx].attr2 = ATTR2_TILEID(16, 0);
    } else {
        shadowOAM[enemy->spriteIdx].attr0 = ATTR0_HIDE;
    }
}