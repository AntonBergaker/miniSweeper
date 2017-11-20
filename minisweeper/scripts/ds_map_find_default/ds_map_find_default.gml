///@param map
///@param key
///@param default
var _v = ds_map_find_value(argument0, argument1);
if (_v == undefined) {
	return argument2;	
}
return _v;