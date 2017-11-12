///mouse thingy
for (var i=0;i<5;i++) {
	var _xx = device_mouse_x(i);
	var _yy = device_mouse_y(i);
	touchReleased[i] = false;
	
	if (device_mouse_check_button(i,mb_left)) {
		if (!touchPressed[i]) {
			touchPressX[i] = _xx;
			touchPressY[i] = _yy;
			touchPressTime[i] = 0;
			touchCompleted[i] = 0;
			touchAction[i] = TouchAction.None;
		}
		
		touchPressTime[i] += deltaTimeS;
		touchPressed[i] = true;
	}
	else {
		if (touchPressed[i]) {
			touchReleaseX[i] = _xx;
			touchReleaseY[i] = _yy;
			touchReleased[i] = true;
		} else {
			touchAction[i] = TouchAction.None;	
		}
		
		touchPressed[i] = false;	
	}
	
	touchX[i] = _xx;
	touchY[i] = _yy;
}