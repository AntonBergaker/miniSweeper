///@param solidColor
///@param backColor
///@param clearedColor
///@param textColor
///@param mineColor
///@param buttonColor
///@param flagColor
///@param cardColor
var _inst = instance_create_layer(0,0,"Instances",oColorChanger);

with _inst {
	solidColorEnd   = argument0;
	backColorEnd    = argument1;
	clearedColorEnd = argument2;
	textColorEnd    = argument3;
	mineColorEnd    = argument4;
	buttonColorEnd  = argument5;
	flagColorEnd    = argument6;
	cardColorEnd    = argument7;
}