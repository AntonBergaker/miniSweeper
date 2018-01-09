var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();


var _ratio = _guiW/_guiH;

if (_ratio) > 0.6 {
	menu.width = 0.6/_ratio;
} else {
	menu.width = 1;
}

menu.height = 1;

if (fadeOut) {
		fadeIn-= deltaTimeS*2;
		if (fadeIn < 0) {
			instance_destroy();
			exit;
		}
		alpha = fadeIn;
} else {
	if (fadeIn < 1) {
		fadeIn+= deltaTimeS*2;
		if (fadeIn > 1) {
			fadeIn = 1;
		}
		alpha = fadeIn;
	}
}

menu.alpha = alpha;
menu.x = 0.5-menu.width/2;
menu.y = 0.5-menu.height/2;