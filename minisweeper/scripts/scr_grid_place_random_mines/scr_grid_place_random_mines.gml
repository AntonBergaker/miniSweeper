///@param mineCount
var _minesToPlace = argument0;
var _minesTotal = _minesToPlace;
var _cellsCount = gridWidth * gridHeight;

var _reverse = false;

if (_minesTotal/_cellsCount) > 0.5 {
	_reverse = true;
	_minesToPlace = _cellsCount - _minesToPlace;
}

while (_minesToPlace > 0) {
	var _xx = irandom(gridWidth-1);
	var _yy = irandom(gridHeight-1);
	
	if (!mineGrid[# _xx, _yy]) {
		_minesToPlace--;
		mineGrid[# _xx, _yy] = true;
	}
}

if (_reverse) {
	for (var xx = 0; xx<gridWidth; xx++) {
		for (var yy = 0; yy<gridHeight; yy++) {
			mineGrid[# xx, yy] = !mineGrid[# xx,yy];	
		}
	}
}