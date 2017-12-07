///@param mineCount
var _minesToPlace = argument0;

while (_minesToPlace > 0) {
	var _xx = irandom(gridWidth-1);
	var _yy = irandom(gridHeight-1);
	
	if (!mineGrid[# _xx, _yy]) {
		_minesToPlace--;
		mineGrid[# _xx, _yy] = true;
	}
}
