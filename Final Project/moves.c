#include "moves.h"

MOVE MOVE_SLASH = { "SLASH", "%s STRUCK %s!", 4, 0, OPPONENT, 0 };
MOVE MOVE_BLAST = { "BLAST", "%s BLASTED THE ENEMY!", 3, 1, OPPONENT, 0 };
MOVE MOVE_HEAL = { "HEAL", "%s HEALED %s!", 0, 0, ALLY, 3 };