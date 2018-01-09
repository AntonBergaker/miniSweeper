///@param x
///@param y

var _xx = argument0;
var _yy = argument1;

if (resetting) {
	scr_reset_grid();	
}

if (!global.tweenEnabled) {
	removeEaseGrid[# _xx, _yy] = true;
	ds_list_add(updateCellList, [_xx, _yy]);
} else {
	ds_list_add(removeEaseList, [_xx, _yy]);
}

if (flagGrid[# _xx, _yy]) {
	scr_flag_cell(_xx,_yy);	
}

if !(clearedGrid[# _xx, _yy]) {
	clearedGrid[# _xx, _yy] = true;
	if (random(log10(pitch+1)) < 0.1) {
		audio_play(aBleep,clamp(0.5 - log10(pitch+1),0.1,0.5),random_range(0.5,1.5) + log10(pitch+1));
		pitch += 0.1;
	}
	leftToClear--;
}

if (mineGrid[# _xx, _yy]) {
	if (lost == false) {
		lost = true;
		leftToClear++;
		audio_play(aBombFirst,0.8,random_range(0.9,1.1));
	}
	ds_list_add(mineEaseList, [_xx, _yy]);
} else {
	if (nearGrid[# _xx, _yy]) == 0 {
		if (global.clearAnimation) {
			scr_clear_all_around_recursive(_xx,_yy);
		} else {
			scr_clear_all_around_recursive_instant(_xx,_yy);
		}
	}	
}