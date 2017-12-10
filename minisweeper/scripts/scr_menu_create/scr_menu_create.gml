///@param x0
///@param y0
///@param width
///@param height
///@param [creatorMenu]
var _menu = instance_create_depth(0,0,0,oMenuControl);
_menu.x = argument[0];
_menu.y = argument[1];
_menu.width = argument[2];
_menu.height = argument[3];

if (argument_count > 4) {
	var _pos = ds_list_find_index(global.menuStack, argument[4]);
	if (_pos >= 0) {
		ds_list_insert(global.menuStack, _pos, _menu);
	} else {
		ds_list_insert(global.menuStack, 0, _menu);	
	}
} else {
	ds_list_insert(global.menuStack, 0, _menu)	
}

return _menu;