/// @description Step event handled by oGridControl for correct order
var _guiX = global.guiWidth;
var _guiY = global.guiHeight;

var _i = inputController;

scr_menu_step(menu);

introTimer -= deltaTimeS;
if (introTimer <= 0) {
	timer+=deltaTimeS;
}

if (!firstStep && introTimer > 0) {
	for (var i=0;i<5;i++) {
		if (_i.touchReleased[i]) {
			introTimer = 0;	
		}
	}
}

#region moveableBox
//Make the box draggable
var _xOff = menu.width*_guiX*0.065;

for ( var i=0;i<5;i++) {
	//Check panning
	if (_i.touchPressed[i]) {
		var _xx1 = _i.touchXGui[i];
		var _yy1 = _i.touchYGui[i];
		var _xx2 = _i.touchPressXGui[i];
		var _yy2 = _i.touchPressYGui[i];
		if (point_in_rectangle(_xx2,_yy2, menu.x*_guiX-_xOff,menu.y*_guiY,menu.x*_guiX+_xOff + menu.width*_guiX,menu.y*_guiY+menu.height*_guiY*0.9)) {
			if (!_i.touchCompleted[i] && _i.touchAction[i] == TouchAction.None) {
	
				if (global.onPhone) {
					var _dpi = global.dpi/7;
				} else {
					var _dpi = 30;
				}
					
				var _timePressed = _i.touchPressTime[i];
					
				if (point_distance(_xx1,_yy1,_xx2,_yy2) > _dpi/2 && _timePressed > 0.10) {
					_i.touchAction[i] = TouchAction.MenuPan;
					lastPanX = _xx2;
					lastPanY = _yy2;
					_i.touchCompleted[i] = true;
				}
			}
		}
	}
}

///panning
for (var i=0;i<5;i++) {
	if (_i.touchAction[i] == TouchAction.MenuPan) {
		var _xx = _i.touchXGui[i];
		var _yy = _i.touchYGui[i]; 
		
		panSpeedX = (lastPanX - _xx);
		panSpeedY = (lastPanY - _yy);
		
		for (var ii=3;ii>=0;ii--) {
			panDiffsX[ii+1] = panDiffsX[ii];
			panDiffsY[ii+1] = panDiffsY[ii];
		}
		
		panDiffsX[i] = (lastPanX - _xx);
		panDiffsY[i] = (lastPanY - _yy);
		
		lastPanX = _xx;
		lastPanY = _yy;
		
		//If its the last frame set the speed to the last 5 highest,
		//because your movement can stop otherwise when releasing
		if (_i.touchReleased[i]) {
			for (var ii=1;ii<4;ii++) {
				if (abs(panSpeedX) < abs(panDiffsX[ii])) {
					panSpeedX = panDiffsX[ii];	
				}
				if (abs(panSpeedY) < abs(panDiffsY[ii])) {
					panSpeedY = panDiffsY[ii];	
				}
			}
			panSpeedX = (panSpeedX + array_average(panDiffsX)) / 2;
			panSpeedY = (panSpeedY + array_average(panDiffsY)) / 2;
		}
	}
}

#endregion
timer = clamp(timer,0,1);

var _sRatio = 212/166;


var _wRatio = _guiX/_guiY;


var _ratio = _wRatio / _sRatio;

if (_ratio > 0.6) {
	menu.width = 0.6 / _wRatio;
	menu.height = menu.width * _ratio;

} else {
	menu.width = 0.8;
	menu.height = 0.8*_ratio;
}

menuOffsetX += panSpeedX/_guiX;
menuOffsetY += panSpeedY/_guiY;

var _dir = point_direction(0,0,panSpeedX,panSpeedY);
var _len = 2;

panSpeedX = lerp_time(panSpeedX,0,0.2,deltaTimeS*2.5);
panSpeedX = value_shift(panSpeedX, 0, abs(lengthdir_x(_len,_dir)) * deltaTimeS);

panSpeedY = lerp_time(panSpeedY,0,0.2,deltaTimeS*2.5);
panSpeedY = value_shift(panSpeedY, 0, abs(lengthdir_y(_len,_dir)) * deltaTimeS);



menuOffsetX = clamp(menuOffsetX, -.5+menu.width /2, 0.5-menu.width /2);
menuOffsetY = clamp(menuOffsetY, -.5+menu.height/2, 0.5-menu.height/2);

menu.x = 0.5 - menu.width/2 - menuOffsetX;
menu.y = ease_quadOut(2, 0.5 - menu.height/2, timer,1) - menuOffsetY;


if (introTimer > 0) {
	menu.y = 5;
}
if (destroy) {
	destroyTimer+= deltaTimeS*1.5;
	menu.y = ease_quadIn(0.5 - menu.height/2, -1.5, destroyTimer, 1)
	if (destroyTimer > 1)  {
		instance_destroy();	
		exit;
	}
}

if (firstStep) {
	firstStep = false;	
	if (newHighscore) {
		nameLabel.text = t_record;
	} else {
		nameLabel.text = lost ? t_lost : t_won;
	}
	playButton.text = lost ? t_retry : t_again;
}