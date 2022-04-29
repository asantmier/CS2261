#ifndef GAME_H
#define GAME_H

#include "moves.h"

extern int submarineMaxHp;
extern int submarineHp; // Player health

extern int gameVictory; // Set to 1 when the game is won

// Enemy types
enum { FISH, SHARK, ANGLER, PUFFER, BARRACUDA, BOSS };

#define NAME_LEN 10

// Structs
typedef struct tag_combatant {
    char name[NAME_LEN];
    int exists;
    int maxHp;
    int hp;
    int numMoves;
    MOVE* moves[6];
    int tileid;
} COMBATANT;

extern COMBATANT CBT_FISH;
extern COMBATANT CBT_SHARK;
extern COMBATANT CBT_ANGLER;
extern COMBATANT CBT_PUFFER;
extern COMBATANT CBT_BARRACUDA;
extern COMBATANT CBT_GOD;
extern COMBATANT CBT_SUBMARINE;
extern COMBATANT CBT_NONE;

// TODO idea
// so how about the player in combat is separate from the submarine
// like if the player dies though, the submarine takes damage
// some enemies could also have skills that directly target the submarine
// that could actually be an interesting mechanic

// ally/opponent list
// Allies need to be accessible from battle and world since we can modify our party in the world
// Opponents could technically only be in battle
// Theoretically we could actually use a separate ally structure with just important data here
// In battle we could just copy that data over at the start and use a different, specialized struct
// That could be good for when we like need sprites for battle, but obv not in the overworld
// TODO that
extern COMBATANT battleAllies[4]; // player can be ally 0
extern COMBATANT battleOpponents[4];

// Initialize game
void initGame();
void initParty();

// Utility functions used in both world and battle
int tilesRed(int tile1, int hp, int maxHp, int segments);

#endif