/// @param x
/// @param y
var _x = argument0;
var _y = argument1;

var _maxW = gridWidth-1;
var _maxH = gridHeight-1;

for (var xx = max(_x-1, 0); xx<=min(_x+1, _maxW) ;xx++) {
	for (var yy = max(_y-1, 0); yy<=min(_y+1, _maxH) ;yy++) {
		if (!clearedGrid[# xx, yy] && !flagGrid[# xx, yy]) {
			scr_clear_place(xx,yy);
		}
	}
}