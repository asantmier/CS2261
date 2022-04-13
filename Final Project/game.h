#ifndef GAME_H
#define GAME_H

extern int submarineMaxHp;
extern int submarineHp; // Player health

// Enemy types
enum { FISH, SHARK, ANGLER, JIM }; // don't mess with jim

// Structs
typedef struct tag_combatant {
    int exists;
    int hp;
    int damage;
} COMBATANT;

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

#endif