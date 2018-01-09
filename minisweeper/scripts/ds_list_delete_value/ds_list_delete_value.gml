///@param list
///@param value
var _pos = ds_list_find_index(argument0, argument1);
if (_pos>=0) {
	ds_list_delete(argument0, _pos);	
}