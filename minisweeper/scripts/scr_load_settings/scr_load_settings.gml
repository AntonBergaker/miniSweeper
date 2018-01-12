if (file_exists("save.json")) {
	var _file = file_text_open_read("save.json");
	
	var _str = file_text_read_string(_file);	
	var _map = json_decode(_str);
	var _gridSize = _map[? "grid_size"];
	if (_gridSize != undefined) {
		global.gridWidth  = ds_map_find_default(_gridSize,"width"  ,global.gridWidth );
		global.gridHeight = ds_map_find_default(_gridSize,"height" ,global.gridHeight);
		global.mineCount  = ds_map_find_default(_gridSize,"mines"  ,global.mineCount );
		global.presetGrid = ds_map_find_default(_gridSize,"preset" ,global.presetGrid);
	}
	
	if (!global.onPhone) {
		var _windowSize = _map[? "window_size"];
		if (_windowSize != undefined) {
			global.windowWidth  = ds_map_find_default(_windowSize, "width" , global.windowWidth );
			global.windowHeight = ds_map_find_default(_windowSize, "height", global.windowHeight);	
		}
	}
	var _highScores = _map[? "highscores"];
	if (_highScores != undefined) {
		ds_map_copy(global.highScores, _highScores);	
	}
	
	global.currentTheme    = ds_map_find_default(_map, "theme"          , global.currentTheme);
	global.clearAnimation  = ds_map_find_default(_map, "clear_animation", global.clearAnimation);
	global.tweenEnabled    = ds_map_find_default(_map, "tween"          , global.tweenEnabled);
	global.showTimer	   = ds_map_find_default(_map, "timer"          , global.showTimer);
	global.showTimerMenu   = ds_map_find_default(_map, "timer_menu"     , global.showTimerMenu);
	var _showMines	       = ds_map_find_default(_map, "show_mines"     , "five");
	if (_showMines == "never") {
		global.showMines = ShowMinesState.Never;	
	} else if (_showMines == "always") {
		global.showMines = ShowMinesState.Always;
	} else {
		global.showMines = ShowMinesState.Five;
	}
	
	file_text_close(_file);
	ds_map_destroy(_map)
}