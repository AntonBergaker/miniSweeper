timer++;

if timer > 10 {
	room_goto_next();
}

if (global.forceWindowX != -1 && global.forceWindowY != -1) {
	var _xx = global.forceWindowX;
	var _yy = global.forceWindowY;
	_xx = clamp(_xx, 0, display_get_width() - window_get_width());
	_yy = clamp(_yy, 0, display_get_height() - window_get_height());
	window_set_position(_xx, _yy);
}