
//{{BLOCK(tempinstructions)

//======================================================================
//
//	tempinstructions, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 22 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1408 + 2048 = 3968
//
//	Time-stamp: 2022-04-03, 13:36:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPINSTRUCTIONS_H
#define GRIT_TEMPINSTRUCTIONS_H

#define tempinstructionsTilesLen 1408
extern const unsigned short tempinstructionsTiles[704];

#define tempinstructionsMapLen 2048
extern const unsigned short tempinstructionsMap[1024];

#define tempinstructionsPalLen 512
extern const unsigned short tempinstructionsPal[256];

#endif // GRIT_TEMPINSTRUCTIONS_H

//}}BLOCK(tempinstructions)
