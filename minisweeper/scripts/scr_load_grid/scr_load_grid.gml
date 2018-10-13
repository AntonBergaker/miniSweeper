var _bufferFile = buffer_load("game.json");
	
var _str = buffer_read(_bufferFile, buffer_string);
var _map = json_decode(_str);

buffer_delete(_bufferFile);

var _saveVersion = _map[? "save_version"];
if (_saveVersion == undefined) {
	return;
}

gameplayTime = ds_map_find_default(_map, "time", 60*60*24);

var _grid = _map[? "grid"];
if (_grid != undefined) {
	
	gridWidth  = ds_map_find_default(_grid, "width"      , gridWidth);
	gridHeight = ds_map_find_default(_grid, "height"     , gridHeight);
	gridMines  = ds_map_find_default(_grid, "mines_total", gridMines);
	
	scr_grid_create_grids();
	
	var _val = _grid[? "cleared"];
	if (_val != undefined) {
		var _b = buffer_base64_decode(_val);
		log("VALUE WE DECODE: ", _val)
		buffer_read_bool_grid(_b, clearedGrid, gridWidth, gridHeight);
		buffer_delete(_b);
	}
	
	var _val = _grid[? "flags"];
	if (_val != undefined) {
		var _b = buffer_base64_decode(_val);
		buffer_read_bool_grid(_b, flagGrid, gridWidth, gridHeight);
		buffer_delete(_b);
	}
	
	var _val = _grid[? "mines"];
	if (_val != undefined) {
		var _b = buffer_base64_decode(_val);
		buffer_read_bool_grid(_b, mineGrid, gridWidth, gridHeight);
		buffer_delete(_b);
	}
} else {
	scr_grid_create_grids();
}

var _camera = _map[? "camera"];
if (_camera != undefined) {
	oCamera.x = ds_map_find_default(_camera, "x", oCamera.x);
	oCamera.y = ds_map_find_default(_camera, "y", oCamera.y);
	
	oCamera.width = ds_map_find_default(_camera, "zoom", oCamera.height);
	oCamera.width = max(oCamera.width*global.internalWidth, 1);
	oCamera.height = oCamera.width * global.displayRatio;
}

ds_grid_copy(flagEaseGrid,flagGrid);
ds_grid_copy(aboutToClearGrid, clearedGrid);
ds_grid_copy(removeEaseGrid, clearedGrid);
	

minesLeft = ds_grid_get_sum(mineGrid,0,0,gridWidth-1,gridHeight-1);
leftToClear = gridWidth*gridHeight - ds_grid_get_sum(clearedGrid,0,0,gridWidth-1,gridHeight-1) - minesLeft;
minesLeft -= ds_grid_get_sum(flagGrid,0,0,gridWidth-1,gridHeight-1);

ds_map_destroy(_map);