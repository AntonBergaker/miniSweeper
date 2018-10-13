if (file_exists("save.json")) {
	var _bufferFile = buffer_load("save.json");
	
	var _str = buffer_read(_bufferFile, buffer_string);
	var _map = json_decode(_str);

	buffer_delete(_bufferFile);
	
	
	var _gridSize = _map[? "grid_size"];
	if (_gridSize != undefined) {
		global.gridWidth  = ds_map_find_default(_gridSize,"width"  ,global.gridWidth );
		global.gridHeight = ds_map_find_default(_gridSize,"height" ,global.gridHeight);
		global.mineCount  = ds_map_find_default(_gridSize,"mines"  ,global.mineCount );
		global.presetGrid = ds_map_find_default(_gridSize,"preset" ,global.presetGrid);
	}
	
	if (!global.onPhone && !global.browser) {
		var _windowSize = _map[? "window_size"];
		if (_windowSize != undefined) {
			if (!global.onPhone) {
				global.forceWindowX = ds_map_find_default(_windowSize, "x", window_get_x());
				global.forceWindowY = ds_map_find_default(_windowSize, "y", window_get_y());
			}
			global.windowWidth	= ds_map_find_default(_windowSize, "width" , global.windowWidth );
			global.windowHeight = ds_map_find_default(_windowSize, "height", global.windowHeight);	
		}
	}
	var _highScores = _map[? "highscores"];
	if (_highScores != undefined) {
		ds_map_copy(global.highScores, _highScores);	
	}
	
	global.vibrate		    = ds_map_find_default(_map, "vibrate"		   , global.vibrate);
	global.audioVolume	    = ds_map_find_default(_map, "volume"		   , global.audioVolume);
	global.currentTheme     = ds_map_find_default(_map, "theme"            , global.currentTheme);
	global.clearAnimation   = ds_map_find_default(_map, "clear_animation"  , global.clearAnimation);
	global.tweenEnabled     = ds_map_find_default(_map, "tween"            , global.tweenEnabled);
	global.showTimer	    = ds_map_find_default(_map, "timer"            , global.showTimer);
	global.showTimerMenu    = ds_map_find_default(_map, "timer_menu"       , global.showTimerMenu);
	global.switchedControls = ds_map_find_default(_map, "switched_controls", global.switchedControls);
	global.showSwitchButton = ds_map_find_default(_map, "switch_button"    , global.showSwitchButton);
	var _showMines	        = ds_map_find_default(_map, "show_mines"       , "five");
	if (_showMines == "never") {
		global.showMines = ShowMinesState.Never;	
	} else if (_showMines == "always") {
		global.showMines = ShowMinesState.Always;
	} else {
		global.showMines = ShowMinesState.Five;
	}
	
	if (!ds_map_exists(global.themes, global.currentTheme)) {
		global.currentTheme = "Default";	
	}
	
	file_text_close(_file);
	ds_map_destroy(_map)
}