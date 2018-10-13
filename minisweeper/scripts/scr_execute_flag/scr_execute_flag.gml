///@param x
///@param y
///@param input

var _in = oInput;
var _xx = argument0;
var _yy = argument1;
var _input = argument2;

scr_flag_cell(_xx,_yy);
if (!global.switchedControls) {
	if (global.vibrate) {
		Haptics_VibrateIntensity(100,2);
	}
}