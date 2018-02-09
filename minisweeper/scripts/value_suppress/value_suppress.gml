///@description Makes a value worth less the bigger it is
///@param value
///@param effect

if argument0 > 0 {
	return log2(argument0*argument1+1)/argument1;
} else {
	return -log2(-argument0*argument1+1)/argument1;	
}