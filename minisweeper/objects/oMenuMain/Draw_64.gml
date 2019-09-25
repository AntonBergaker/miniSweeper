var _alpha = 1;
if (!fadeInInit && alpha != 1) {
	_alpha = alpha;
}
draw_rect_color(0,0,global.internalWidth,global.internalHeight,global.backColor, _alpha);
