///@param menu
///@param x
///@param y
///@param tag
///@param toggled
var _menu = argument[0];
var _inst = instance_create_depth(argument[1],argument[2],0,oMenuObjectToggle);
_inst.tag = argument[3];
_inst.toggled = argument[4];

ds_list_add(_menu.toggles, _inst);
return _inst;