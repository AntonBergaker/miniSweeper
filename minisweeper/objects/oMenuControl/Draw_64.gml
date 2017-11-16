var _len;

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

var _x = x * _guiW;
var _y = y * _guiH;

var _scaleW = _guiW * width;
var _scaleH = _guiH * height;

draw_set_color(global.textColor);

_len = ds_list_size(buttons);
for (var i=0;i<_len;i++) {
	var _inst = buttons[|i];
	if (instance_exists(_inst)) {
		scr_menu_draw_button(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
	}
}
_len = ds_list_size(labels);
for (var i=0;i<_len;i++) {
	var _inst = labels[|i];
	if (instance_exists(_inst)) {
		scr_menu_draw_label(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
	}
}