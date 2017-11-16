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
	
menu.x = 0.5-menu.width/2;
menu.y = 0.5-menu.height/2;