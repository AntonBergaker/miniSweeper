var _len = ds_list_size(buttons)
for (var i=0;i<_len;i++) {
	instance_destroy(buttons[| i]);	
}
var _len = ds_list_size(labels)
for (var i=0;i<_len;i++) {
	instance_destroy(labels[| i]);	
}