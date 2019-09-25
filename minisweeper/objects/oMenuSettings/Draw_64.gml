var _xx = 0;
if (!inMenu) {
	_xx = ease_quadOut(global.guiWidth, 0, fadeIn, 1);
	
	if _xx > 0 {
		var _dpiScale = global.dpiScale;
	
		var _dropScale = global.guiHeight/256;
		draw_sprite_ext(sDropshadow, 0, _xx, global.guiHeight/2, _dpiScale ,_dropScale, 180, c_white, 1);
	}
}

draw_rect_color(_xx,0,_xx+global.guiWidth,global.guiHeight, global.backColor, alpha);