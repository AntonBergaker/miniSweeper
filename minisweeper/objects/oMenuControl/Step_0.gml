scr_mouse_step(true);
menuTime += deltaTimeS;

pressColorFilled = c_white;
pressColor = c_gray

selected = noone;

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

var _width  = 1/(_guiW * width);
var _height = 1/(_guiH * height);

var _pressed = false;
var _pressedIndex = 0;
var _released = false;
var _releasedIndex = 0;

if (active) {
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
}

var _len = ds_list_size(buttons);
if (_pressed) {
	for (var i=0;i<_len;i++) {
		var _x = (touchPressX[_pressedIndex]*_width - x/width);
		var _y = (touchPressY[_pressedIndex]*_height - y/height);
		var _inst = buttons[| i];
		
		if (point_in_rectangle(_x,_y,_inst.x0,_inst.y0,_inst.x1,_inst.y1)) {
			_inst.pressed = true;
			_inst.pressedX = _x-_inst.x;
			_inst.pressedY = _y-_inst.y;
			_inst.pressedTime = menuTime-touchPressTime[_pressedIndex];
			_inst.pressedFinger = _pressedIndex;
			_inst.clickedFade = 1;
		}
	}
}
if (_released) {
	for (var i=0;i<_len;i++) {
		var _x = (touchX[_releasedIndex]*_width - x/width);
		var _y = (touchY[_releasedIndex]*_height - y/height);
		var _inst = buttons[| i];	
		
		if (_inst.pressedFinger == _releasedIndex) {
			if (point_in_rectangle(_x,_y,_inst.x0,_inst.y0,_inst.x1,_inst.y1)) {
				selected = _inst;
			}
			_inst.clickedFade = 1;
			_inst.pressed = false;
			_inst.pressedFinger = -1;
		}
	}
}

var _len = ds_list_size(sliders);
for (var i=0;i<_len;i++) {
	var _inst = sliders[| i];
	if (_inst.pressed) {
		var _x = (touchX[_pressedIndex]*_width - x/width);	
		var _diff = _x - _inst.pressedLastX;
		
		_inst.positionX += _diff;
		_inst.pressedLastX = _x;
		var _diff2 = (_inst.positionX - _inst.selectedIndex)/_inst.entrySeperation;
		if (abs(_diff2) > 0.5) {
			var _move = round(_diff2);
			_inst.selectedIndex += _move;
			log(_inst.selectedIndex);
		}
		
	} else if (_pressed) {
		var _x = (touchPressX[_pressedIndex]*_width - x/width);
		var _y = (touchPressY[_pressedIndex]*_height - y/height);	
		if (point_in_rectangle(_x,_y,_inst.x0,_inst.y0,_inst.x1,_inst.y1)) {
			_inst.pressed = true;
			_inst.pressedFinger = _pressedIndex;
			_inst.pressedLastX = _x;
		}
	}
	
}