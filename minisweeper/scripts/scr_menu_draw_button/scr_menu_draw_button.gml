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

if (_inst.filled) {
	draw_sprite_ext(sSmallBox,0,_x,_y,_width/374,_width/374,0,global.buttonColor,1)
}

draw_set_valign(_inst.valign);
draw_set_halign(_inst.halign);
draw_set_font(_inst.font);

draw_text_transformed(_x,_y,_inst.text,_width/600,_width/600,0);