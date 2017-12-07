///@param slider
///@param value

var _inst = argument0;
var _val = argument1;

if (_inst.usesData) {
	_inst.selected = _val;
	_inst.selectedIndex = array_find_index( _inst.data, _val);
	_inst.positionX = -_inst.selectedIndex;
	
} else {
	_inst.selected = _val;
	_inst.selectedIndex = (_val - _inst.boundLower);
	_inst.positionX = -_inst.selectedIndex;
}
_inst.updatedDraw = true;

