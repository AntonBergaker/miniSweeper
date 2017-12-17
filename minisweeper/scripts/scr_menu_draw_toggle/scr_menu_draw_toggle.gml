///@param toggle
///@param x
///@param y
///@param width
///@param height

var _inst = argument0
var _x = argument1;
var _y = argument2;
var _width = argument3;
var _height = argument4;

var _sWidth = sprite_get_width(sToggleLine);
var _scale = _width/_sWidth;


draw_sprite_ext(sToggleLine,0,_x,_y,_scale,_scale,0,global.textColor,alpha*_inst.alpha*0.5);

var _checkEase = ease_quadInOut(-1,1,_inst.checkedTimer,1);
var _xx = (_width * 0.40) * _checkEase;

var _col = merge_color(global.textColor, global.backColor, 0.7)
draw_sprite_ext(sCircleSmall,0,_x+_xx,_y,_scale,_scale,0,_col,alpha*_inst.alpha);