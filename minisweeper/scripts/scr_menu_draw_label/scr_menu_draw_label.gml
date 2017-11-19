///@param button
///@param x
///@param y
///@param width
///@param height

var _inst = argument0
var _x = argument1;
var _y = argument2;
var _width = argument3;
var _height = argument4;


draw_set_valign(_inst.valign);
draw_set_halign(_inst.halign);
draw_set_font(_inst.font);

var _scale = _height/84;
var _sWidth =  (string_width(_inst.text) * _scale) / _width;
var _sHeight = (string_height(_inst.text)* _scale) / _height;
if (_sWidth > 1) {
	_scale /= _sWidth;
}

draw_text_transformed_color(_x,_y,_inst.text,_scale,_scale,0,global.textColor,global.textColor,global.textColor,global.textColor,alpha);