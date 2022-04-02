
//{{BLOCK(tempbackground)

//======================================================================
//
//	tempbackground, 1024x1024@8, 
//	+ palette 256 entries, not compressed
//	+ 6 tiles (t reduced) not compressed
//	+ affine map, not compressed, 128x128 
//	Total size: 512 + 384 + 16384 = 17280
//
//	Time-stamp: 2022-04-01, 22:49:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPBACKGROUND_H
#define GRIT_TEMPBACKGROUND_H

#define tempbackgroundTilesLen 384
extern const unsigned short tempbackgroundTiles[192];

#define tempbackgroundMapLen 16384
extern const unsigned short tempbackgroundMap[8192];

#define tempbackgroundPalLen 512
extern const unsigned short tempbackgroundPal[256];

#endif // GRIT_TEMPBACKGROUND_H

//}}BLOCK(tempbackground)
