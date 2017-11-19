///@param menu
///@param x
///@param y
///@param text
var _menu = argument[0];
var _inst = instance_create_depth(argument[1],argument[2],0,oMenuObjectLabel);
_inst.text = argument[3];


_inst.width = _menu.aWidth;
_inst.height = _menu.aHeight;
_inst.font = _menu.aFont;
_inst.valign = _menu.aValign;
_inst.halign = _menu.aHalign

ds_list_add(_menu.labels, _inst);
return _inst;