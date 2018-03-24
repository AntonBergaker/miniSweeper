var _guiX = global.guiWidth;
var _guiY = global.guiHeight;

var _dpiScale = global.dpiScale;

var _scale = 1;
if (settingsButtonTime > 0) {
	_scale *= ease_quadInOut_peek(1,1.15, settingsButtonTime,0.9,1);
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

draw_surface(surf,0,0);



var _yy = _guiY-30*_dpiScale;

draw_set_font(fMineTextMip0);
draw_set_color(global.textColor);
draw_set_halign(fa_right);

if (global.showTimer) {
	var _str = scr_get_formatted_time(gameplayTime);
	var _targetX = string_width(_str)+20*_dpiScale;
	if (_targetX > timerX || resetting) {
		timerX = lerp_time(timerX,_targetX,0.1,deltaTimeS);
	}

	//draw_sprite_ext(sWhiteStuff,0,_guiX-timerX,_yy,1.5,1,0,global.backColor,1);
	draw_text_transformed(_guiX-20*_dpiScale,_yy,_str, _dpiScale/1.5, _dpiScale/1.5, 0);;
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
	
	//draw_sprite_ext(sWhiteStuff,0,_xx,_yy,-1.5,1,0,global.backColor,1);
	draw_sprite_ext(sMine,1,_xx-40*_dpiScale,_yy,_dpiScale/1.5,_dpiScale/1.5,0,global.textColor,1);
	if (_bounce != 0) {
		draw_text_transformed(_xx+(-20+_bounce*5)*_dpiScale,_yy,string(round(minesLeft)),1/_bounce*_dpiScale/1.5,_bounce*_dpiScale/1.5,0);
	} else {
		draw_text_transformed(_xx-20*_dpiScale,_yy,string(round(minesLeft)), _dpiScale/1.5, _dpiScale/1.5, 0);
	}
}

minesGuiBounce = clamp(minesGuiBounce-deltaTimeS*6,0,1);


if (!instance_exists(oMenuSettingsTitlebar)) {
	draw_sprite_ext(sBackGearAnimation, 0, gearX, gearY, gearScale, gearScale, gearRot, gearColor, 1);
}