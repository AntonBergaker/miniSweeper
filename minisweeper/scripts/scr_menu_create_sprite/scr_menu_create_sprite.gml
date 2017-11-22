///@param menu
///@param x
///@param y
///@param width
///@param height
///@param sprite
///@param [color]

var _menu = argument[0];
var _inst = instance_create_depth(argument[1],argument[2],0,oMenuObjectLabel);
_inst.width = argument[3];
_inst.height = argument[4];
_inst.sprite = argument[5];
if (argument_count > 6) {
	_inst.color = argument[6];	
}

ds_list_add(_menu.sprites, _inst);
return _inst;