/// @param minegrid
/// @param x
/// @param y

var _grid = argument0;
var _x = argument1;
var _y = argument2;

var _maxW = ds_grid_width(_grid)-1;
var _maxH = ds_grid_height(_grid)-1;

var _near = 0;
for (var xx = max(_x-1, 0); xx<=min(_x+1, _maxW) ;xx++) {
	for (var yy = max(_y-1, 0); yy<=min(_y+1, _maxH) ;yy++) {
		if (_grid[# xx,yy]) {
			_near++;
		}
	}
}
return _near;