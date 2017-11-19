var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();


var _ratio = _guiW/_guiH;

if (_ratio) > 0.6 {
	menu.width = 0.6/_ratio;
	menu.height = 1;
} else {
	menu.width = 1;
	menu.height = 1;
}
	
if (fadeIn) {
	fadeInTimer+=deltaTimeS;
	if (fadeInTimer >= 1) {
		fadeIn = false;	
	}
}

if (fadeOut) {
	fadeOutTimer+=deltaTimeS*1.5;
	if (fadeOutTimer >= 1) {
		instance_destroy();	
		exit;
	}
}

alpha = 1;
if (fadeIn) {
	alpha *= fadeInTimer;	
}
if (fadeOut) {
	alpha *= (1-fadeOutTimer);	
}

menu.alpha = alpha;
menu.x = 0.5-menu.width/2;
menu.y = 0.5-menu.height/2;