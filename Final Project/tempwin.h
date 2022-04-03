
//{{BLOCK(tempwin)

//======================================================================
//
//	tempwin, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 15 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 960 + 2048 = 3520
//
//	Time-stamp: 2022-04-03, 13:39:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPWIN_H
#define GRIT_TEMPWIN_H

#define tempwinTilesLen 960
extern const unsigned short tempwinTiles[480];

#define tempwinMapLen 2048
extern const unsigned short tempwinMap[1024];

#define tempwinPalLen 512
extern const unsigned short tempwinPal[256];

#endif // GRIT_TEMPWIN_H

//}}BLOCK(tempwin)
