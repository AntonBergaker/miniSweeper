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

if (!surface_exists(_inst.surf)) {
	_inst.surf = surface_create(_width,_height);
} else {
	if (surface_get_width(_inst.surf) != _width)
		{surface_resize(_inst.surf,_width,_height);}	
}
if (surface_exists(_inst.surf)) {
	surface_set_target(_inst.surf);
	draw_clear_alpha(0,0);
	
	draw_set_valign(_inst.valign);
	draw_set_halign(_inst.halign);
	draw_set_font(_inst.font);

	var _tHeight = (string_height("1")*2);
	var _scale = _height/_tHeight;


	var _ind = _inst.selectedIndex;
	var _startInd = _ind - 3;

	var _sep = string_width(_inst.standardSeperation)*_scale + _width/10;

	_inst.entrySeperation = (_sep / _width);

	var _xx = _x + ((_inst.positionX - _inst.selectedIndex*-1)*_width*_inst.entrySeperation);

	for (var i=-3;i<=3;i++) {
		if (_inst.usesData) {
			var _max = array_length_1d(_inst.data);
			_ind = mod_negative(i + _inst.selectedIndex, _max);
			var _str = _inst.data[_ind];
		} else {
			var _ind = mod_negative(i + _inst.selectedIndex, _inst.boundHigher - _inst.boundLower + 1);
		
			var _str = string(_ind + _inst.boundLower);
		}
		var _xxx = _xx + i*_sep;
		var _dist = clamp(1-(abs(_x - _xxx)/_width), 0.7,1);
		
		draw_text_transformed(_xx + i*_sep,_y,_str,_scale*_dist,_scale*_dist,0);
	}
	surface_reset_target();
}