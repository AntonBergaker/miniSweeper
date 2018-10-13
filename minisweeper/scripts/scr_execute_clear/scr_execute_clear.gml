///@param x
///@param y
///@param input

var _in = oInput;
var _xx = argument0;
var _yy = argument1;
var _input = argument2;


if (resetting) {
	scr_reset_grid();	
}
							
if (!flagGrid[# _xx,_yy]) {
	if (firstPress) {
		scr_grid_mines_from_press(_xx, _yy);
		minesLeft -= ds_grid_get_sum(flagGrid, 0, 0, gridWidth-1, gridHeight-1)
		firstPress = false;
	}
	if (!clearedGrid[# _xx, _yy]) {
		scr_clear_place(_xx, _yy);
		if (global.switchedControls) {
			finalPressX = _in.touchX[_input];
			finalPressY = _in.touchY[_input];
		} else {
			finalPressX = _in.touchReleaseX[_input];
			finalPressY = _in.touchReleaseY[_input];
		}
	}
	
	
	if (global.switchedControls) {
		if (global.vibrate) {
			Haptics_VibrateIntensity(100,2);
		}
	}
}
