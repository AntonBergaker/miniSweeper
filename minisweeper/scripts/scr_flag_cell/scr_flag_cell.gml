/// @param x
/// @param y

var _xx = argument0;
var _yy = argument1;

if (resetting) {
	scr_reset_grid();	
}

flagGrid[# _xx, _yy] = !flagGrid[# _xx, _yy];
if (flagGrid[# _xx, _yy]) {
	audio_play(aFlagUp,1,random_range(0.95,1.05));
	minesLeft--;
} else {
	audio_play(aFlagDown,1,random_range(0.95,1.05));
	minesLeft++;
}
minesGuiBounce = 1;

if (global.tweenEnabled) {
	ds_list_add(flagEaseList, [_xx, _yy]);
} else {
	flagEaseGrid[# _xx, _yy] = flagGrid[# _xx, _yy];
	ds_list_add(updateCellList, [_xx, _yy]);
}
Haptics_VibrateIntensity(100,2);