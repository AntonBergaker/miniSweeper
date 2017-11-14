/// @param entry1
/// @param entry2
/// @param ...
var _str = "";
for (var i=0;i<argument_count;i++) {
	//If two variables in a row are reals, insert a , between them
	if is_real(argument[i]) && i > 0 && is_real(argument[i-1]) {
		_str += ","+string(argument[i]);
	}
	else {
		_str += string(argument[i]);
	}
}

show_debug_message(_str);