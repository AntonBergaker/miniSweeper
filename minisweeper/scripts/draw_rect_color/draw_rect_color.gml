///@param x0
///@param y0
///@param x1
///@param y1
///@param color
///@param alpha

var _mX = (argument0 + argument2) / 2;
var _mY = (argument1 + argument3) / 2;

var _width  = argument2 - argument0;
var _height = argument3 - argument1;

draw_sprite_ext(sBigBoxCenter, 0, _mX, _mY, _width/246, _height/246, 0, argument4, argument5);
