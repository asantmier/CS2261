#include <stdlib.h>
#include "mode0.h"
#include "print.h"
#include "game.h"
#include <string.h>

int submarineMaxHp;
int submarineHp;
int gameVictory;
COMBATANT battleAllies[4];
COMBATANT battleOpponents[4];

// Initialize the game
void initGame() {
    submarineMaxHp = 100;
    submarineHp = submarineMaxHp;
    gameVictory = 0;
    initParty();
}

// Set up the default player party
void initParty() {
    strncpy(battleAllies[0].name, "PLAYER", NAME_LEN);
    battleAllies[0].exists = 1;
    battleAllies[0].maxHp = 10;
    battleAllies[0].hp = battleAllies[0].maxHp;
    battleAllies[0].moves[0] = MOVE_SLASH;
    battleAllies[0].moves[1] = MOVE_BLAST;
    battleAllies[0].moves[2] = MOVE_HEAL;
    battleAllies[0].numMoves = 3;
    strncpy(battleAllies[1].name, "DUDE", NAME_LEN);
    battleAllies[1].exists = 1;
    battleAllies[1].maxHp = 10;
    battleAllies[1].hp = battleAllies[1].maxHp;
    battleAllies[1].moves[0] = MOVE_SLASH;
    battleAllies[1].moves[1] = MOVE_HEAL;
    battleAllies[1].numMoves = 2;
}

// Returns the number of tiles to be red in a section of the healthbar
int tilesRed(int tile1, int hp, int maxHp, int segments) {
    if (hp > (((tile1) * maxHp) / segments)) {
        if (hp > (((tile1+1) * maxHp) / segments)) {
            if (hp > (((tile1+2) * maxHp) / segments)) {
                if (hp > (((tile1+3) * maxHp) / segments)) {
                    return 4;
                } else {
                    return 3;
                }
            } else {
                return 2;
            }
        } else {
            return 1;
        }
    } else {
        return 0;
    }
}
