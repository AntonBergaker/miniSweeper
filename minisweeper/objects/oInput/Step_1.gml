for (var i=0;i<5;i++) {
	var _xxG = device_mouse_x_to_gui(i);
	var _yyG = device_mouse_y_to_gui(i);
	
	var _xx = device_mouse_x(i);
	var _yy = device_mouse_y(i);
	
	touchReleased[i] = false;
	
	if (device_mouse_check_button(i,mb_left)) {
		if (!touchPressed[i]) {
			touchPressX[i] = _xx;
			touchPressY[i] = _yy;
			touchPressXGui[i] = _xxG;
			touchPressYGui[i] = _yyG;
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
			touchReleaseXGui[i] = _xxG;
			touchReleaseYGui[i] = _yyG;
			touchReleased[i] = true;
		} else {
			touchAction[i] = TouchAction.None;	
		}
		
		touchPressed[i] = false;	
	}
	
	touchX[i] = _xx;
	touchY[i] = _yy;
	touchXGui[i] = _xxG;
	touchYGui[i] = _yyG;
}