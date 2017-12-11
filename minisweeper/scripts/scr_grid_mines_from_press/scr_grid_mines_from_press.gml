///@args x, y
var _xx1 = max(argument0 - 2,0);
var _yy1 = max(argument1 - 2,0);
var _xx2 = min(argument0 + 2,gridWidth -1);
var _yy2 = min(argument1 + 2,gridHeight-1);

var _time = get_timer();

var _mineCount = gridMines;
var _cellsCount = gridWidth * gridHeight;

var _broke = false;
if (_mineCount < _cellsCount - 9) {
	var i = 0;
	do {
		ds_grid_clear(mineGrid,0);
		scr_grid_place_random_mines(gridMines);
		if (i++ > 100) {
			_broke = true;
			break;
		}
	} until  (ds_grid_get_sum(mineGrid, _xx1, _yy1, _xx2, _yy2) <= 0)
} else {
	_broke = true;
	ds_grid_clear(mineGrid,0);
	scr_grid_place_random_mines(gridMines);
}


if (_broke) {
	//Create a list of all free positions
	var _list = ds_list_create();
	for (var xx = 0; xx<gridWidth; xx++) {
		for (var yy = 0; yy<gridHeight; yy++) {
			if (!mineGrid[# xx, yy]) {
				if (xx < _xx1 || xx > _xx2 || yy < _yy1 || yy > _yy2) {
					ds_list_add(_list, [xx, yy]);
				}
			}
		}
	}
	ds_list_shuffle(_list);
	var _minesToPlaceNow = (ds_grid_get_sum(mineGrid, _xx1, _yy1, _xx2, _yy2));
	var _broke = false;
	var i=0;
	while (_minesToPlaceNow > 0 ) {
		if (i >= ds_list_size(_list)) {
			_broke = true;
			break;
		}
		var _arr = _list[| i];
		var _xx = _arr[0];
		var _yy = _arr[1];
		
		log(_minesToPlaceNow, ds_list_size(_list),i);
		mineGrid[# _xx, _yy] = true;
		i++;
		_minesToPlaceNow--;
	} 
	
	if (_broke) {
		if (_minesToPlaceNow >= (_xx2-_xx1+1)*(_yy2-_yy1+1)) {
			ds_grid_set_region(mineGrid, _xx1, _yy1, _xx2, _yy2, true);
		}
		else {
			ds_grid_set_region(mineGrid, _xx1, _yy1, _xx2, _yy2, false);
			while (_minesToPlaceNow > 0) {
				var __xx = irandom_range(_xx1, _xx2);
				var __yy = irandom_range(_xx1, _yy2);
				if (!(__xx == argument0 && __yy == argument1) && !mineGrid[# __xx, __yy]) {
					mineGrid[# __xx, __yy] = true;
					_minesToPlaceNow--;
				}
			}
		}
	} else {
		ds_grid_set_region(mineGrid, _xx1, _yy1, _xx2, _yy2, false);	
	}
	
	ds_list_destroy(_list);
}


minesLeft = ds_grid_get_sum(mineGrid, 0, 0, gridWidth-1, gridHeight -1);
gridMines = minesLeft;
leftToClear = _cellsCount - minesLeft;
scr_calculate_grid_near();
log("Calculated the grid in ", (get_timer()- _time)/1000, " ms");