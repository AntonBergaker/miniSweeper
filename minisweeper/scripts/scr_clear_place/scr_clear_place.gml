///@param x
///@param y

var _xx = argument0;
var _yy = argument1;

if (resetting) {
	scr_reset_grid();	
}

ds_list_add(removeEaseList, [_xx, _yy]);
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
		scr_clear_all_around_recursive(_xx,_yy);
	}	
}