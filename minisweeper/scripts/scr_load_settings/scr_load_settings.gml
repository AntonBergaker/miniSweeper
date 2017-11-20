if (file_exists("save.json")) {
	var _file = file_text_open_read("save.json");
	
	var _str = file_text_read_string(_file);	
	var _map = json_decode(_str);
	var _gridSize = _map[? "grid_size"];
	if (_gridSize != undefined) {
		global.gridWidth  = ds_map_find_default(_gridSize,"width" ,global.gridWidth );
		global.gridHeight = ds_map_find_default(_gridSize,"height",global.gridHeight);
		global.mineCount  = ds_map_find_default(_gridSize,"mines" ,global.mineCount );
	}
	var _highScores = _map[? "highscores"];
	if (_highScores != undefined) {
		ds_map_copy(global.highScores, _highScores);	
	}
	
	
	file_text_close(_file);
	ds_map_destroy(_map)
}