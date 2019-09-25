var _guiX = global.guiWidth;
var _guiY = global.guiHeight;


var _ratio = _guiX/_guiY;

if (fadeOut) {
	fadeIn-= deltaTimeS*3.5;
	if (fadeIn < 0) {
		instance_destroy();
		exit;
	}
} else {
	if (fadeIn < 1) {
		fadeIn+= deltaTimeS*3;
		if (fadeIn > 1) {
			fadeIn = 1;
		}
	}
}

if (_ratio) > 0.6 {
	menu.width = 0.6/_ratio;
} else {
	menu.width = 1;
}

menu.x = 0.5-menu.width/2;
menu.x = ease_quadOut(1, menu.x, fadeIn, 1);
titlebar.x = ease_quadInOut(menu.x, 0, fadeIn, 1);