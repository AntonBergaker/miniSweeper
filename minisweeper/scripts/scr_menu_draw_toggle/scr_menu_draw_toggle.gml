///@param toggle
///@param x
///@param y
///@param width
///@param height

var _inst = argument0
var _x = argument1;
var _y = argument2;
var _width = argument3/1.5;
var _height = argument4;

var _sWidth = sprite_get_width(sToggleLine);
var _scale = (_width/_sWidth)*1.2;

var _bCol = merge_color(global.textColor, global.backColor, 0.7)
var _col = merge_color(_bCol,global.buttonColor,_inst.checkedTimer);
draw_sprite_ext(sToggleLine,0,_x,_y,_scale,_scale,0,_col,alpha*_inst.alpha);


var _checkEase = ease_quadInOut(-1,1,_inst.checkedTimer,1);

var _xx = (_width * 0.32) * _checkEase;

draw_sprite_ext(sCircleSmall,0,_x+_xx,_y,_scale,_scale,0,global.backColor,alpha*_inst.alpha);