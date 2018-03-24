var _dpiScale = global.dpiScale;

var _fadeIn = oMenuSettings.fadeIn;
var _offX = x*global.guiWidth;


if (inMenu) {
	var _anim = 13;	
} else {
	var _anim = lerp(0, 13, _fadeIn);
}
if (alphaTimer > 0) {
	var _alpha = alphaTimer*alpha;
	var _col2 = merge_color(global.backColor, global.textColor, 0.2);
	
	var _dropScale = global.guiWidth/256;
	draw_sprite_ext(sDropshadow, 0, _offX + global.guiWidth/2, 75*_dpiScale, _dpiScale ,_dropScale, 270, c_white, _alpha*0.5);
	draw_set_color(_col2);
	if (_alpha < 1) {
		draw_set_alpha(_alpha);
	}
	
	draw_rectangle(_offX,0,global.guiWidth,75*_dpiScale,0);
	
	if (_alpha < 1) {
		draw_set_alpha(1);
	}
}

with oMenuSettings.menu {
	var _guiW = global.guiWidth;
	var _guiH = global.guiHeight;

	var _x = x * _guiW;
	var _y = y * _guiH;

	var _scaleW = _guiW * width;
	var _scaleH = _guiH * height;
	//Draw the button
	var _inst = other.exitButton;
	scr_menu_draw_button(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	

}

draw_sprite_ext(sBackGearAnimation, _anim, gearX, gearY, gearScale, gearScale, gearRot, gearColor, alpha);