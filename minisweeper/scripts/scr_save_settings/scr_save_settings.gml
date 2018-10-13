var _map = ds_map_create();
var _gridSize = ds_map_create();
	ds_map_add(_gridSize, "width"  , int64(global.gridWidth));
	ds_map_add(_gridSize, "height" , int64(global.gridHeight));
	ds_map_add(_gridSize, "mines"  , int64(global.mineCount));
	ds_map_add(_gridSize, "preset" , boolify(global.presetGrid));
ds_map_add_map(_map,"grid_size",_gridSize)


if (!global.onPhone && !global.browser) {
	var _windowSize = ds_map_create();
		if (!global.onPhone) {
			ds_map_add(_windowSize, "x", int64(global.lastWindowX));
			ds_map_add(_windowSize, "y", int64(global.lastWindowY));
		}
		ds_map_add(_windowSize, "width" , int64(global.windowWidth));
		ds_map_add(_windowSize, "height", int64(global.windowHeight));
	ds_map_add_map(_map,"window_size",_windowSize)
}

var _highScores = ds_map_create();
	ds_map_copy(_highScores, global.highScores);
ds_map_add_map(_map, "highscores" , _highScores)


ds_map_add(_map, "theme"		    , global.currentTheme);
ds_map_add(_map, "volume"		    , global.audioVolume);
ds_map_add(_map, "vibrate"		    , boolify(global.vibrate));
ds_map_add(_map, "clear_animation"  , boolify(global.clearAnimation));
ds_map_add(_map, "tween"            , boolify(global.tweenEnabled));
ds_map_add(_map, "timer"            , boolify(global.showTimer));
ds_map_add(_map, "timer_menu"       , boolify(global.showTimerMenu));
ds_map_add(_map, "switch_button"    , boolify(global.showSwitchButton));
ds_map_add(_map, "switched_controls", boolify(global.switchedControls));
ds_map_add(_map, "show_mines"       , scr_showmines_get_string(global.showMines));

var _json = json_encode(_map);
var _saveBuffer = buffer_create(string_byte_length(_json), buffer_fixed, 1);
buffer_write(_saveBuffer, buffer_text, _json);

buffer_save(_saveBuffer, "save.json");


buffer_delete(_saveBuffer);
ds_map_destroy(_map);