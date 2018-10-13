var _map = ds_map_create();

ds_map_add(_map, "save_version", global.saveVersion);
ds_map_add(_map, "time", gameplayTime);

var _grid = ds_map_create();
	ds_map_add(_grid, "width", gridWidth);
	ds_map_add(_grid, "height", gridHeight);
	ds_map_add(_grid, "mines_total", gridMines);
	
	var _b = buffer_create(ceil(gridWidth * gridHeight/8), buffer_fixed, 1);
	buffer_write_bool_grid(_b, clearedGrid, gridWidth, gridHeight);
	ds_map_add(_grid, "cleared", buffer_base64_encode(_b, 0, buffer_tell(_b)));
	
	buffer_seek(_b, buffer_seek_start, 0);
	buffer_write_bool_grid(_b, flagGrid, gridWidth, gridHeight);
	ds_map_add(_grid, "flags", buffer_base64_encode(_b, 0, buffer_tell(_b)));
	
	buffer_seek(_b, buffer_seek_start, 0);
	buffer_write_bool_grid(_b, mineGrid, gridWidth, gridHeight);
	ds_map_add(_grid, "mines", buffer_base64_encode(_b, 0, buffer_tell(_b)));
	
	buffer_delete(_b);
ds_map_add_map(_map, "grid", _grid);

var _camera = ds_map_create();
	ds_map_add(_camera, "x", oCamera.x);
	ds_map_add(_camera, "y", oCamera.y);
	ds_map_add(_camera, "zoom", oCamera.width/global.internalWidth);
ds_map_add_map(_map, "camera", _camera);

var _json = json_encode(_map);
ds_map_destroy(_map);

var _saveBuffer = buffer_create(string_byte_length(_json), buffer_fixed, 1);
buffer_write(_saveBuffer, buffer_text, _json);

buffer_save(_saveBuffer, "game.json");
global.saveExists = true;

buffer_delete(_saveBuffer);