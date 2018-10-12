var _guiX = global.guiWidth;
var _guiY = global.guiHeight;


var _ratio = _guiX/_guiY;

var _in = oInput;


if (_ratio) > 0.6 {
	menu.width = 0.6/_ratio;
} else {
	menu.width = 1;
}

menu.height = 1;

var _spriteRatio = global.guiHeight/(menu.width*global.guiWidth);


if (!inMenu) {
	flagSprite.width   =-flagSprite.height   * _spriteRatio;
	squareSprite.width = squareSprite.height * _spriteRatio;
	timerSprite.width  = timerSprite.height  * _spriteRatio;
	recordSprite.width = recordSprite.height * _spriteRatio;
}

if (fadeOut) {
	fadeIn-= deltaTimeS*2;
	if (fadeIn < 0) {
		instance_destroy();
		exit;
	}
	if (inMenu) {
		alpha = fadeIn;
	}
} else {
	if (fadeIn < 1) {
		fadeIn+= deltaTimeS*2;
		if (fadeIn > 1) {
			fadeIn = 1;
		}
		if (inMenu) {
			alpha = fadeIn;
		}
	}
}




for ( var i=0;i<5;i++) {
	//Check panning
	if (_in.touchPressed[i]) {
		var _yy1 = _in.touchYGui[i];
		var _yy2 = _in.touchPressYGui[i];

		if (!_in.touchCompleted[i] && _in.touchAction[i] == TouchAction.None) {
	
			if (global.onPhone) {
				var _dpi = global.dpi/7;
			} else {
				var _dpi = 20;
			}
					
			var _timePressed = _in.touchPressTime[i];
					
			if (abs(_yy1 - _yy2) > _dpi/2 && _timePressed > 0.05) {
				_in.touchAction[i] = TouchAction.MenuPan;
				lastPanY = _yy2;
				_in.touchCompleted[i] = true;
			}
		}
	}
}

///panning
for (var i=0;i<5;i++) {
	if (_in.touchAction[i] == TouchAction.MenuPan) {
		var _yy = _in.touchYGui[i]; 
		
		panSpeedY = (lastPanY - _yy);
		
		for (var ii=3;ii>=0;ii--) {
			panDiffsY[ii+1] = panDiffsY[ii];
		}
		

		panDiffsY[i] = (lastPanY - _yy);
		
		lastPanY = _yy;
		bounceOffYSpd = 0;
		
		//If its the last frame set the speed to the last 5 highest,
		//because your movement can stop otherwise when releasing
		if (_in.touchReleased[i]) {
			for (var ii=1;ii<4;ii++) {
				if (abs(panSpeedY) < abs(panDiffsY[ii])) {
					panSpeedY = panDiffsY[ii];	
				}
			}
			panSpeedY = (panSpeedY + array_average(panDiffsY)) / 2;
		}
	}
}


menuOffsetY += panSpeedY/_guiY;



panSpeedY = lerp_time(panSpeedY,0,0.2,deltaTimeS*2.5);

menuOffsetY = clamp(menuOffsetY, 0, menuHeight-menu.height);


menu.alpha = alpha;
menu.x = 0.5-menu.width/2;
menu.y = 0.5-menu.height/2 - menuOffsetY;

if (!inMenu) {
	menu.alpha = 1;
	alpha = 1;
	menu.x += ease_quadOut(1, 0, fadeIn, 1);	
	titlebar.x = ease_quadOut(1, 0, fadeIn, 1);
} else {
	titlebar.x = 0;	
	titlebar.alpha = alpha;
}

scr_menu_step(menu);
if global.onPhone && keyboard_check_pressed(vk_backspace) {
	keyboard_clear(vk_backspace);
	menu.selected = exitButton;
}