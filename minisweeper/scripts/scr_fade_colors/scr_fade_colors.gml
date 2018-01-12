///@param solidColor
///@param backColor
///@param clearedColor
///@param textColor
///@param buttonTextColor;
///@param mineColor
///@param buttonColor
///@param flagColor
///@param cardColor
var _inst = instance_create_layer(0,0,"Instances",oColorChanger);

with _inst {
	solidColorEnd      = argument0;
	backColorEnd       = argument1;
	clearedColorEnd    = argument2;
	textColorEnd       = argument3;
	buttonTextColorEnd = argument4;
	mineColorEnd       = argument5;
	buttonColorEnd     = argument6;
	flagColorEnd       = argument7;
	cardColorEnd       = argument8;
}