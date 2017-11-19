///@param sprite
///@param x
///@param y
///@param width
///@param height

var _inst = argument0
var _x = argument1;
var _y = argument2;
var _width = argument3;
var _height = argument4;
var _sprite = _inst.sprite;

var _sWidth = sprite_get_width(_sprite);
var _sHeight = sprite_get_height(_sprite);
draw_sprite_ext(_sprite,0,_x,_y,_width/_sWidth,_height/_sHeight,0,c_white,alpha);