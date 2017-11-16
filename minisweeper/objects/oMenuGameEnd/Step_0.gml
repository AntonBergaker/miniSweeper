scr_mouse_step(1);

var _guiX = display_get_gui_width ();
var _guiY = display_get_gui_height();

if (firstStep) {
	firstStep = false;	
}

timer+=deltaTimeS;
timer = clamp(timer,0,1);
y = ease_quadOut(startY, targetY, timer,1);
x = _guiX/2;


var _reset = false;

for (var i=0;i<5;i++) {
	//check if you pressed the button	
	
	//reset
	var _w = 374;
	var _wH = _w/2;

	var _rX1 = x-_wH;
	var _rY1 = y-42;
	var _rX2 = x+_wH;
	var _rY2 = y+42;
	
	if (touchReleased[i]) {
		if (point_in_rectangle(touchX[i],touchY[i], _rX1, _rY1, _rX2, _rY2)) {
			if (point_in_rectangle(touchPressX[i],touchPressY[i], _rX1, _rY1, _rX2, _rY2)) {
				_reset = true;
			}
		}
	}
}

if (_reset) {
	with (oGridControl) {
		repeat(3) {
			scr_reset_place_recursive( irandom(gridWidth-1), irandom(gridHeight-1));
		}
		resetting = true;
		locked = false;
	}
	instance_destroy();
}