///@param buff
///@param grid
///@param width
///@param height
var _buff = argument0;
var _grid = argument1;
var _width = argument2;
var _height = argument3;

ds_grid_resize(_grid, _width, _height);

var _index = 0;
for (var _x = 0; _x < _width; _x++) {
	for (var _y = 0; _y < _height; _y++) {
		if (_index == 0) {
			var _val = buffer_read(_buff, buffer_u8)	
		}
		
		//Extract 1 bit
		var _num = 0x1 & (_val >> (7-_index));
		
		_grid[# _x, _y] = _num;
		
		_index = (_index + 1) mod 8;
	}
}

return _grid;