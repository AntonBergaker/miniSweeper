///@param menu
///@param x
///@param y
///@param usesCompleteData
///@param data
///@param firstEntry
///@param standardSeperationString

var _menu = argument[0];
var _inst = instance_create_depth(argument[1],argument[2],0,oMenuObjectButton);

_inst.width = _menu.aWidth;
_inst.height = _menu.aHeight;
_inst.font = _menu.aFont;
_inst.valign = _menu.aValign;
_inst.halign = _menu.aHalign

_inst.usesData = argument[3];
if (!_inst.usesData) {
	var _arr = argument[4];
	_inst.boundLower  = _arr[0];
	_inst.boundHigher = _arr[1];
	_inst.selected = argument[5];
	_inst.selectedIndex = argument[5] - _inst.boundLower;
	_inst.positionX = _inst.selectedIndex;
} else {
	_inst.data = argument[4];
	_inst.selected = argument[5];
	_inst.selectedIndex = array_find_index( _inst.data, _inst.selected);
	_inst.positionX = _inst.selectedIndex;
}

_inst.standardSeperation = argument[6];

ds_list_add(_menu.sliders, _inst);
return _inst;