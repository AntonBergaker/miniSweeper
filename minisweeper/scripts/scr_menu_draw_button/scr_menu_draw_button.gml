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

with _inst {
	if (filled) {
		var _pressIn = other.menuTime - pressedTime;
		var _fade = clickedFade;
		if (pressed) {
			_fade = 1;
		}
	
		if (_fade >= 0) {
			if (_pressIn >= 1) {
				var _col2 = merge_color(global.buttonColor, other.pressColorFilled,0.2*_fade);
				draw_rounded_box(_x - _width/2, _y - _height/2, _x + _width/2, _y + _height/2, _col2, other.alpha)

			} else {
			
				draw_rounded_box(_x - _width/2, _y - _height/2, _x + _width/2, _y + _height/2 ,global.buttonColor, other.alpha);
			
				var _raidus = ease_quadIn(0, other.width*2*374*5,_pressIn,1);
				var _xx = pressedX * _width;
				var _yy = pressedY * _height;
				var _color = merge_color(global.buttonColor, other.pressColorFilled, (0.5 - _pressIn * 0.4)*_fade);
			
				gpu_set_blendenable(false)
				gpu_set_colorwriteenable(false,false,false,true);
				draw_set_alpha(0);
				draw_rectangle(0,0, global.internalWidth,global.internalHeight, false);
			
			
				draw_set_alpha(1);
				draw_rounded_box(_x - _width/2, _y - _height/2, _x + _width/2, _y + _height/2, c_white, other.alpha*alpha)
				gpu_set_blendenable(true);
				gpu_set_colorwriteenable(true,true,true,true);
			
				gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
				gpu_set_alphatestenable(true);
				draw_sprite_ext(sCircle,0,_x+_xx,_y+_yy,_raidus/128,_raidus/128,0,_color,1);
				gpu_set_alphatestenable(false);
				gpu_set_blendmode(bm_normal);

			}
		} else {
			draw_rounded_box(_x - _width/2, _y - _height/2, _x + _width/2, _y + _height/2, global.buttonColor, other.alpha*alpha)
		}
	} else {
		var _pressIn = other.menuTime - pressedTime;
		var _fade = clickedFade;
		if (pressed) {
			_fade = 1;
		}

		if (clickedFade >= 0) {
			if (_pressIn >= 1) {
				draw_sprite_ext(sSmallBoxStraight,0,_x,_y,_width/374,_height/84,0, other.pressColor,0.05*_fade);
			} else {			
					var _radius = ease_quadIn(0, other.width*2*374*5,_pressIn,1);
					var _xx = pressedX * _width;
					var _yy = pressedY * _height;
			
			
					var _alpha = ((0.3 - _pressIn * 0.25) * _fade) * alpha;
			
					var _x0 = _x - _width/2;
					var _y0 = _y - _height/2;
					var _x1 = _x + _width/2;
					var _y1 = _y + _height/2;
			
					var _cOX = _x+_xx;
					var _cOY = _y+_yy
					var _col = other.pressColor;
			
					var _dX0 = (_x0 - _cOX) * (128/_radius);
					var _dX1 = (_cOX - _x1) * (128/_radius);
			
					var _dY0 = (_y0 - _cOY) * (128/_radius);
					var _dY1 = (_cOY - _y1) * (128/_radius);
			
					var _left = clamp(_dX0+128, 0, 256);
					var _top  = clamp(_dY0+128, 0, 256);
			
					var _sWidth  = clamp(128 - _dX1 - _left, 0, 256-_left);
					var _sHeight = clamp(128 - _dY1 - _top , 0, 256-_top);
			
			
					var _cX = _cOX - _radius;
					var _cY = _cOY - _radius;
			
					_cX += _left * _radius/128;
					_cY += _top  * _radius/128;
					draw_sprite_part_ext(sCircle, 0, _left, _top, _sWidth, _sHeight, _cX, _cY, _radius/128, _radius/128, _col, _alpha)
			}
		}
	}




	draw_set_valign(valign);
	draw_set_halign(halign);
	draw_set_font(font);

	var _scale = min(_height/84,_width/374);
	var _col = filled ? global.buttonTextColor : global.textColor;

	draw_text_transformed_color(_x,_y,text,_scale,_scale,0,_col, _col, _col, _col, other.alpha);
}