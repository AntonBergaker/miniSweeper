var _lines = string_split( argument0, "n", false);

var _height = ds_list_size(_lines);
var _width = string_length(_lines[| 0]);

global.gridWidth  = _width;
global.gridHeight = _height;

scr_grid_update_size();
scr_reset_grid();
firstPress = false;

for (var _x = 0; _x < _width; _x++) {
	for (var _y = 0; _y < _height; _y++) {
		var _chr = string_char_at(_lines[| _y], _x+1);
		if (_chr == "F") {
			mineGrid[# _x, _y] = true;
			flagGrid[# _x, _y] = true;
		} else if (_chr == " ") {
			clearedGrid[# _x, _y] = true;
		} else if (_chr == "M") {
			mineGrid[# _x, _y] = true;	
		}
	}
}

ds_grid_copy(flagEaseGrid,flagGrid);
ds_grid_copy(aboutToClearGrid, clearedGrid);
ds_grid_copy(removeEaseGrid, clearedGrid);
	
scr_calculate_grid_near();

minesLeft = ds_grid_get_sum(mineGrid,0,0,gridWidth-1,gridHeight-1);
leftToClear = gridWidth*gridHeight - ds_grid_get_sum(clearedGrid,0,0,gridWidth-1,gridHeight-1) - minesLeft;
minesLeft -= ds_grid_get_sum(flagGrid,0,0,gridWidth-1,gridHeight-1);