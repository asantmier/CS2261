
//{{BLOCK(temppause)

//======================================================================
//
//	temppause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 47 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3008 + 2048 = 5568
//
//	Time-stamp: 2022-04-03, 13:38:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPPAUSE_H
#define GRIT_TEMPPAUSE_H

#define temppauseTilesLen 3008
extern const unsigned short temppauseTiles[1504];

#define temppauseMapLen 2048
extern const unsigned short temppauseMap[1024];

#define temppausePalLen 512
extern const unsigned short temppausePal[256];

#endif // GRIT_TEMPPAUSE_H

//}}BLOCK(temppause)
