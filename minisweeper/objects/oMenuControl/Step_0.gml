scr_mouse_step(true);
menuTime += deltaTimeS;

selected = noone;

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

var _width  = 1/(_guiW * width);
var _height = 1/(_guiH * height);

var _pressed = false;
var _pressedIndex = 0;
var _released = false;
var _releasedIndex = 0;

for (var i=0;i<5;i++) {
	if (touchPressed[i]) {	
		_pressed = true;
		_pressedIndex = i;
	}
	if (touchReleased[i]) {
		_released = true;
		_releasedIndex = i;
	}
}

var _len = ds_list_size(buttons);
if (_pressed) {
	for (var i=0;i<_len;i++) {
		var _x = (touchPressX[_pressedIndex]*_width - x/width);
		var _y = (touchPressY[_pressedIndex]*_height - y/height);
		var _inst = buttons[| i];
		
		if (point_in_rectangle(_x,_y,_inst.x0,_inst.y0,_inst.x1,_inst.y1)) {
			_inst.pressed = true;
			_inst.pressedX = _x-_inst.x0;
			_inst.pressedY = _y-_inst.y0;
			_inst.pressedTime = menuTime;
			_inst.pressedFinger = _pressedIndex;
		}
	}
}
if (_released) {
	for (var i=0;i<_len;i++) {
		var _x = (touchPressX[_releasedIndex]*_width - x/width);
		var _y = (touchPressY[_releasedIndex]*_height - y/height);
		var _inst = buttons[| i];	
		
		if (_inst.pressedFinger == _releasedIndex) {
			if (point_in_rectangle(_x,_y,_inst.x0,_inst.y0,_inst.x1,_inst.y1)) {
				_inst.pressed = false;
				_inst.pressedFinger = -1;
				selected = _inst;
			}
		}
	}
}