///@param list
var _list = argument0;
var _len = ds_list_size(_list);
for (var i=0;i<_len;i++) {
	instance_destroy(_list[| i]);
}
ds_list_destroy(_list);