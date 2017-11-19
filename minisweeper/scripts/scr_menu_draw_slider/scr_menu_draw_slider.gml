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

draw_sprite_ext(sSliderLine,0,_x,_y-_height/2.2, _width/_sWidth, _width/_sWidth, 0, c_gray, alpha);
draw_sprite_ext(sSliderLine,0,_x,_y+_height/2.2, _width/_sWidth, _width/_sWidth, 0, c_gray, alpha);

draw_set_valign(_inst.valign);
draw_set_halign(_inst.halign);
draw_set_font(_inst.font);

var _tHeight = (string_height("1")*2);
var _scale = _height/_tHeight;


var _ind = _inst.selectedIndex;
var _startInd = _ind - 3;
var _sep = string_width(_inst.standardSeperation)/2 + _width/5;
var _xx = _x + (_inst.positionX - _inst.selectedIndex)*_width;

_inst.entrySeperation = (_sep / _width);

for (var i=-3;i<=3;i++) {
	if (_inst.usesData) {
		var _max = array_length_1d(_inst.data);
		var _ind = (_startInd + i); //sorry
		while _ind <0 { _ind+= _max; }
		_ind = _ind mod _max;
		var _str = _inst.data[_ind];
	} else {
		var _ind = _startInd + i;
		while (_ind) > _inst.boundHigher {
			_ind = _ind - _inst.boundHigher + _inst.boundLower;
		}
		while (_ind < _inst.boundLower) {
			_ind = _ind + _inst.boundHigher - _inst.boundLower + 1;	
		}
		
		var _str = string(_ind);
	}
	draw_text_transformed_color(_xx + i*_sep,_y,_str,_scale,_scale,0,global.textColor, global.textColor, global.textColor, global.textColor, alpha);
}