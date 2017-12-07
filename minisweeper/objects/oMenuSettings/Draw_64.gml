draw_set_color(global.backColor);
if (alpha != 1) {
	draw_set_alpha(alpha);	
}
draw_rectangle(0,0,global.internalWidth,global.internalHeight,0);
if (alpha != 1) {
	draw_set_alpha(1);	
}