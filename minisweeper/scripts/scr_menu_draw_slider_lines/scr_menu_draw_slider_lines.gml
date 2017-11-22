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


var _sWidth = 512;
var _sHeight = 32;

draw_sprite_ext(sSliderLine,0,_x,_y-_height/2.2, _width/_sWidth, _width/_sWidth, 0, global.textColor, alpha*0.5);
draw_sprite_ext(sSliderLine,0,_x,_y+_height/2.2, _width/_sWidth, _width/_sWidth, 0, global.textColor, alpha*0.5);