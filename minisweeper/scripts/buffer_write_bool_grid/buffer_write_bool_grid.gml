///@param buffer
///@param grid
///@param width
///@param height

var _buff = argument0;
var _grid = argument1;
var _width = argument2;
var _height = argument3;

var _index = 0;
var _val = 0x00;
var _mask = 0x00;

for (var _x = 0; _x < _width; _x++) {
	for (var _y = 0; _y < _height; _y++) {
		_mask = _grid[# _x, _y] << (7-_index);
		_val = _val | _mask;
	
		_index++;
		if (_index == 8) {
			buffer_write(_buff, buffer_u8, _val);
			_val = 0x00;
			_index = 0;
		}
	}
}
if (_index > 0) {
	buffer_write(_buff, buffer_u8, _val);	
}