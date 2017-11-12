///@param x
///@param y

var _xx = argument0;
var _yy = argument1;

ds_list_add(removeEaseList, [_xx, _yy]);
clearedGrid[# _xx, _yy] = true;

if (mineGrid[# _xx, _yy]) {
	if (lost == false) {
		lost = true;
	}
	ds_list_add(mineEaseList, [_xx, _yy]);
} else {
	if (nearGrid[# _xx, _yy]) == 0 {
		scr_clear_all_around_recursive(_xx,_yy);
	}	
}