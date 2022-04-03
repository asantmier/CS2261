
//{{BLOCK(templose)

//======================================================================
//
//	templose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 22 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1408 + 2048 = 3968
//
//	Time-stamp: 2022-04-03, 13:39:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPLOSE_H
#define GRIT_TEMPLOSE_H

#define temploseTilesLen 1408
extern const unsigned short temploseTiles[704];

#define temploseMapLen 2048
extern const unsigned short temploseMap[1024];

#define templosePalLen 512
extern const unsigned short templosePal[256];

#endif // GRIT_TEMPLOSE_H

//}}BLOCK(templose)
