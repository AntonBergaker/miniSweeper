///@param x
///@param y

var _x = argument0;
var _y = argument1;

var _maxW = gridWidth-1;
var _maxH = gridHeight-1;


for (var xx = max(_x-1, 0); xx<=min(_x+1, _maxW) ;xx++) {
	for (var yy = max(_y-1, 0); yy<=min(_y+1, _maxH) ;yy++) {
		if (nearGrid[# xx, yy] == 0 && !clearedGrid[# xx, yy]) {
			clearedGrid[# xx, yy] = true;
			scr_clear_all_around_recursive(xx, yy);
		}
		clearedGrid[# xx,yy] = true;
	}
}
