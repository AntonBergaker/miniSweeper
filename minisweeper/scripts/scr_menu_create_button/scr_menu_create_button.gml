///@param menu
///@param x
///@param y
///@param text
///@param tag
///@param [filled]
var _menu = argument[0];
var _inst = instance_create_depth(argument[1],argument[2],0,oMenuObjectButton);
_inst.text = argument[3];
_inst.tag = argument[4];
if (argument_count > 5) {
	_inst.filled = argument[5];
} else {
	_inst.filled = false;	
}

_inst.width = _menu.aWidth;
_inst.height = _menu.aHeight;
_inst.font = _menu.aFont;
_inst.valign = _menu.aValign;
_inst.halign = _menu.aHalign

ds_list_add(_menu.buttons, _inst);