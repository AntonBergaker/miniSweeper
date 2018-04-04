var xx = argument0;
var yy = argument1;
var _mask = argument2;

var _scale = (global.internalWidth/oCamera.width);

var _xx = (100+xx*160 - oCamera.x)*_scale;
var _yy = (100+yy*160 - oCamera.y)*_scale;
var _winRot = 0;
var _specialScale = 1;
var _specialRot = 0;

var _sScale = _scale;
_scale = _scale * mipScale;

if finalActive {
	var _time = (finalPressTime * 120) - 7;
	var _xx2 = 100+xx*160;
	var _yy2 = 100+yy*160;
	if (finalLost) {
		var _time = (finalPressTime * 120) - 7;
		var _xx2 = 100+xx*160;
		var _yy2 = 100+yy*160;
		var _dist = point_distance(finalPressX, finalPressY, _xx2, _yy2)/2;
		var _intense = 1-abs(100 - power(_dist,0.9999) + (value_suppress(_time+7,0.05)-7)*10)/100;
		if _intense >= 0 && _dist < 900 {
			_intense *= (1-_dist/900);
			var _dir = point_direction(finalPressX, finalPressY, _xx2, _yy2)
			_scale *= 1+_intense/3.5;
			_xx += lengthdir_x(_intense*18,_dir)*_sScale;
			_yy += lengthdir_y(_intense*18,_dir)*_sScale;
		}
	} else {
		var _dist = power(point_distance(finalPressX, finalPressY, _xx2, _yy2)/2,0.90);
		var _shiftIn = clamp((power(finalPressTime/3+0.4,1.3)-0.305)*10-_dist/60, 0, 3)/3;
		
		_scale *= ease_quadOut_peek(1, 0.9, _shiftIn, 0.6, 1);
		if _shiftIn > 0.4 && _shiftIn < 0.8 {
			_specialScale *= ease_quadOut_peek(1, 0, _shiftIn-0.4, 0.2, 0.4);
		}
	
		_winRot = ease_backInOut(0, 90, _shiftIn, 1, 1);
		if _shiftIn < 0.6 {
			_specialRot = _winRot;
		} else {
			_specialRot = _winRot - 90;	
		}
	}
}

if (_mask) {
	draw_sprite_ext(sMask,mip,_xx,_yy,_scale,_scale,0,global.backColor,1);
}
		
if (clearedGrid[# xx,yy]) {
	var _alpha = 1;
	if (hideOnReset) {
		_alpha = 1 - hideOnResetTimer;
	}
	
	if (global.clearedColor != global.backColor)
	draw_sprite_ext(sSquare,mip,_xx,_yy,_scale,_scale,_winRot,global.clearedColor,_alpha);
	
	var _count = nearGrid[# xx,yy];
	if (_count >= 1) {
		draw_text_mip_transformed(_xx,_yy, string(nearGrid[# xx,yy]),_scale*_specialScale, _specialRot*2);
	}
			
	if (removeEaseGrid[# xx,yy] < 1) {
		var _farIn = ease_quadOut(0,1,removeEaseGrid[# xx,yy],1);
		var _rot = -_farIn*10;
		var _alpha = 1-_farIn;
		var _size = 1-_farIn;

		draw_sprite_ext(sSquare,mip,_xx,_yy + _sScale*_farIn*4,_scale*_size,_scale*_size,_winRot+_rot,global.solidColor,_alpha);
	}
			

	if (mineGrid[# xx,yy]) {
		var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
		draw_sprite_ext(sMine,mip,_xx,_yy,_scale*_size,_scale*_size,_winRot,global.mineColor,1);
	}
			
			
} else {
	var _previewInc = previewEaseGrid[# xx, yy];
	
	draw_sprite_ext(sSquare,mip,_xx,_yy,_scale*(1-_previewInc*0.2),_scale*(1-_previewInc*0.2),_previewInc*5+_winRot,global.solidColor,1);
		
	if (flagEaseGrid[# xx,yy] > 0) {
		var _ySize = ease_backOut(0,1,flagEaseGrid[# xx,yy],1, 3.5);
		var _xSize = lerp(_ySize, ease_expoIn(0,1, flagEaseGrid[# xx,yy], 1),0.5);
		if (lost && mineGrid[# xx,yy]) {
			#region Flagged mine on loss
			var _mineEase = mineEaseGrid[# xx,yy];
			var _shiftX = _sScale*-2*_mineEase;
			var _shiftY = lerp(30,15,_mineEase)*_sScale;
			var _rot = ease_quadInOut(0,30, _mineEase, 1);
			var _standX = 1-_mineEase;
			draw_sprite_ext(sFlagPole,mip,_xx + _shiftX,_yy+_shiftY,_scale*_xSize*_specialScale,_scale*_ySize*_specialScale,_rot+_specialRot*2,global.flagColor,1);
			if (_standX > 0) {
				draw_sprite_ext(sFlagStand,mip,_xx,_yy+30*_sScale,_scale*_xSize*_standX*_specialScale,_scale*_ySize*_specialScale,_specialRot*2,global.flagColor,1);	
			}
			
			var _size = ease_backOut(0,0.76,mineEaseGrid[# xx,yy],1, 3.5);
			var _shift = _sScale*15*_mineEase;
			draw_sprite_ext(sMine,mip,_xx+_shift,_yy+_shift,_scale*_size,_scale*_size,_winRot,global.mineColor,1);
			#endregion
		} else {
			draw_sprite_ext(sFlag,mip,_xx,_yy+30*_sScale,_scale*_xSize*_specialScale,_scale*_ySize*_specialScale,_specialRot*2+(1-_ySize)*10,global.flagColor,1);	
		}
	} else if (lost) {
		if (mineGrid[# xx,yy]) {
			var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
			draw_sprite_ext(sMine,mip,_xx,_yy,_scale*_size,_scale*_size,_winRot,global.mineColor,1);
		}
	}
}