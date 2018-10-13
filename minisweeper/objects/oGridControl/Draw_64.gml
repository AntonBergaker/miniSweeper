var _guiX = global.guiWidth;
var _guiY = global.guiHeight;

var _dpiScale = global.dpiScale;

var _scale = 1;
if (settingsButtonTime > 0) {
	_scale *= ease_quadInOut_peek(1,0.85, settingsButtonTime,0.9,1);
}
if (settingsButtonFade > 0) {
	_scale *= 1 + settingsButtonFade*0.1;
}

gearX = _guiX-40*_dpiScale;
gearY = _dpiScale*40;
gearScale = _scale*_dpiScale/2;
gearRot = (_scale-1)*300;
gearColor = merge_color(global.textColor, global.backColor, 0.6);


if (!enabled) {
	exit;	
}

if (surface_exists(surf)) {
	gpu_set_blendmode_ext(bm_one, bm_zero)
	draw_surface(surf,0,0);
	gpu_set_blendmode(bm_normal);
}



var _yy = _guiY-30*_dpiScale;

draw_set_font(fLightMenu);
draw_set_color(global.textColor);
draw_set_valign(fa_middle)

if (global.showTimer) {
	var _str = scr_get_formatted_time(gameplayTime);

	var _xx2 = global.showSwitchButton ? 20*_dpiScale : _guiX-20*_dpiScale;
	draw_set_halign( global.showSwitchButton ? fa_left : fa_right);

	draw_text_transformed(_xx2,_yy ,_str, _dpiScale/1.5, _dpiScale/1.5, 0);;
}

var _showMines = (global.showMines == ShowMinesState.Always
			  || (global.showMines == ShowMinesState.Five && minesLeft <= 5))

if (minesX > 0 || _showMines) {
	if (_showMines) {
		minesX = clamp(minesX + deltaTimeS*3,0,1);
	} else {
		minesX = clamp(minesX - deltaTimeS*3,0,1);
	}
	draw_set_halign(fa_left)
	var _xx = ease_quadOut(0,70*_dpiScale,minesX,1);
	var _bounce = ease_quadOut_peek(1,1.3,minesGuiBounce,0.5,1);
	
	var _yy2 = global.showSwitchButton ? 30*_dpiScale : _yy;
	
	//draw_sprite_ext(sWhiteStuff,0,_xx,_yy,-1.5,1,0,global.backColor,1);
	draw_sprite_ext(sMine,1,_xx-40*_dpiScale, _yy2,_dpiScale/1.5,_dpiScale/1.5,0,global.textColor,1);
	if (_bounce != 0) {
		draw_text_transformed(_xx+(-20+_bounce*5)*_dpiScale,_yy2,string(round(minesLeft)),1/_bounce*_dpiScale/1.5,_bounce*_dpiScale/1.5,0);
	} else {
		draw_text_transformed(_xx-20*_dpiScale,_yy2,string(round(minesLeft)), _dpiScale/1.5, _dpiScale/1.5, 0);
	}
}

minesGuiBounce = clamp(minesGuiBounce-deltaTimeS*6,0,1);

if (!instance_exists(oMenuSettingsTitlebar)) {
	draw_sprite_ext(sBackGearAnimation, 0, gearX, gearY, gearScale, gearScale, gearRot, gearColor, 1);
}


switchButtonX     = _guiX-50*_dpiScale;
switchButtonY     = _guiY-_dpiScale*50;
switchButtonScale = _dpiScale/3.5;
var _color = global.solidColor;

if (global.showSwitchButton) {
	var _ease = ease_quadOut_peek(1, 0.9, clamp(switchButtonTime, 0, 1), 0.7, 1);
	var _sideEase = ease_quadOut_peek(0, 1, switchButtonFlipTime, 0.5, 1);
	
	_ease += _sideEase*0.2;
	var _flip = ease_quadOut_peek(1, 0, switchButtonFlipTime, 0.5, 1);
	
	var _scale = _ease*switchButtonScale;
	
	var _backCol  = switchButtonFlipTime < 0.5 ? global.backColor : global.solidColor;
	
	draw_sprite_ext(sCircleShadow, 0, switchButtonX, switchButtonY, _scale*_flip, _scale, 1, c_white, _flip*0.5 + (1-_ease)*3);
	draw_sprite_ext(sCircle      , 0, switchButtonX, switchButtonY, _scale*_flip, _scale, 0, _backCol, 1);
	if (switchButtonFlipTime > 0.5) {
		draw_sprite_ext(sBigFlag, 0, switchButtonX, switchButtonY, _scale*_flip, _scale, 0, global.flagColor, 1);
	} else {
		draw_sprite_ext(sSquare, 0, switchButtonX, switchButtonY, _scale*_flip, _scale, 0 , global.clearedColor, 1);
		draw_sprite_ext(sSquareSlightRot, 0, switchButtonX, switchButtonY, _scale*_flip, _scale, 0, global.solidColor, 1);
	}
}