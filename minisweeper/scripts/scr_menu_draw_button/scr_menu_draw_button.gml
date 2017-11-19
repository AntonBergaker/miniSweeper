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
	var _pressIn = menuTime - _inst.pressedTime;
	var _fade = _inst.clickedFade;
	if (_inst.pressed) {
		_fade = 1;
	}
	
	if (_fade >= 0) {
		if (_pressIn >= 1) {
			draw_sprite_ext(sSmallBox,0,_x,_y,_width/374,_height/84,0,merge_color(global.buttonColor,pressColorFilled,0.2*_fade),alpha);
		} else {
			draw_sprite_ext(sSmallBox,0,_x,_y,_width/374,_height/84,0,global.buttonColor,alpha);
			
			var _raidus = ease_quadIn(0,width*2*374*5,_pressIn,1);
			var _xx = _inst.pressedX * _width;
			var _yy = _inst.pressedY * _height;
			var _color = merge_color(global.buttonColor,pressColorFilled, (0.5 - _pressIn * 0.4)*_fade);
			
			gpu_set_blendenable(false)
			gpu_set_colorwriteenable(false,false,false,true);
			draw_set_alpha(0);
			draw_rectangle(0,0, global.internalWidth,global.internalHeight, false);
			
			
			draw_set_alpha(1);
			draw_sprite_ext(sSmallBox,0,_x,_y,_width/374,_height/84,0,c_white,alpha);
			gpu_set_blendenable(true);
			gpu_set_colorwriteenable(true,true,true,true);
			
			gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
			gpu_set_alphatestenable(true);
			draw_sprite_ext(sCircle,0,_x+_xx,_y+_yy,_raidus/128,_raidus/128,0,_color,1);
			gpu_set_alphatestenable(false);
			gpu_set_blendmode(bm_normal);

		}
	} else {
		draw_sprite_ext(sSmallBox,0,_x,_y,_width/374,_height/84,0,global.buttonColor,1);
	}
} else {
	var _pressIn = menuTime - _inst.pressedTime;
	var _fade = _inst.clickedFade;
	if (_inst.pressed) {
		_fade = 1;
	}
	if (_inst.clickedFade >= 0) {
		if (_pressIn >= 1) {
			draw_sprite_ext(sSmallBoxStraight,0,_x,_y,_width/374,_height/84,0,pressColor,0.05*_fade);
		} else {			
			var _raidus = ease_quadIn(0,width*2*374*5,_pressIn,1);
			var _xx = _inst.pressedX * _width;
			var _yy = _inst.pressedY * _height;
			var _alpha = ((0.3 - _pressIn * 0.25) * _fade) * alpha;
			
			gpu_set_blendenable(false)
			gpu_set_colorwriteenable(false,false,false,true);
			draw_set_alpha(0);
			draw_rectangle(0,0, global.internalWidth,global.internalHeight, false);
			
			
			draw_set_alpha(1);
			draw_sprite_ext(sSmallBoxStraight,0,_x,_y,_width/374,_height/84,0,c_white,_alpha);
			gpu_set_blendenable(true);
			gpu_set_colorwriteenable(true,true,true,true);
			
			gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
			gpu_set_alphatestenable(true);
			draw_sprite_ext(sCircle,0,_x+_xx,_y+_yy,_raidus/128,_raidus/128,0,pressColor,alpha);
			gpu_set_alphatestenable(false);
			gpu_set_blendmode(bm_normal);

		}
	}
}




draw_set_valign(_inst.valign);
draw_set_halign(_inst.halign);
draw_set_font(_inst.font);

var _scale = min(_height/84,_width/374);


draw_text_transformed_color(_x,_y,_inst.text,_scale,_scale,0,global.textColor,global.textColor,global.textColor,global.textColor,alpha);