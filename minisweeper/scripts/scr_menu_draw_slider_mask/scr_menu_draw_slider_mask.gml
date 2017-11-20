///@param sprite
///@param x
///@param y
///@param width
///@param height

var _inst = argument0
var _width = argument1;
var _height = argument2;

var _x = _width/2;
var _y = _height/2;

if (surface_exists(_inst.surf)) {
	surface_set_target(_inst.surf);
	var _sWidth = 512*2;
	var _sHeight = 128;
	draw_sprite_ext(sSliderMask,0,_x,_y, _width/_sWidth,_height/_sHeight,0,c_white,1);
	draw_sprite_ext(sSliderMask,0,_x,_y,-_width/_sWidth,_height/_sHeight,0,c_white,1);
	surface_reset_target();
}