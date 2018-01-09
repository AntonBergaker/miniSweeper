var _guiX = global.guiWidth;
var _guiY = global.guiHeight;

introTimer -= deltaTimeS;
if (introTimer <= 0) {
	timer+=deltaTimeS;
}

if (!firstStep && introTimer > 0) {
	for (var i=0;i<5;i++) {
		if (menu.touchReleased[i]) {
			introTimer = 0;	
		}
	}
}

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



menu.x = 0.5 - menu.width/2;
menu.y = ease_quadOut(2, 0.5 - menu.height/2, timer,1);
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
	nameLabel.text = lost ? t_lost : t_won;
	playButton.text = lost ? t_retry : t_again;
}