var xx = argument0;
var yy = argument1;
var _mask = argument2;

var _scale = (global.internalWidth/oCamera.width);

var _xx = (100+xx*160 - oCamera.x)*_scale;
var _yy = (100+yy*160 - oCamera.y)*_scale;

var _sScale = _scale;
_scale = _scale * mipScale;

if (_mask) {
	draw_sprite_ext(sMask,mip,_xx,_yy,_scale,_scale,0,global.backColor,1);
}
		
if (clearedGrid[# xx,yy]) {
	var _alpha = 1;
	if (hideOnReset) {
		_alpha = 1 - hideOnResetTimer;
	}
	
	draw_sprite_ext(sSquare,mip,_xx,_yy,_scale,_scale,0,global.clearedColor,_alpha);
	
	var _count = nearGrid[# xx,yy];
	if (_count >= 1) {
		draw_text_mip(_xx,_yy, string(nearGrid[# xx,yy]),_scale);
	}
			
	if (removeEaseGrid[# xx,yy] < 1) {
		var _farIn = ease_quadOut(0,1,removeEaseGrid[# xx,yy],1);
		var _rot = -_farIn*10;
		var _alpha = 1-_farIn;
		var _size = 1-_farIn;

		draw_sprite_ext(sSquare,mip,_xx,_yy + _sScale*_farIn*4,_scale*_size,_scale*_size,_rot,global.solidColor,_alpha);
	}
			

	if (mineGrid[# xx,yy]) {
		var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
		draw_sprite_ext(sMine,mip,_xx,_yy,_scale*_size,_scale*_size,0,global.mineColor,1);
	}
			
			
} else {
	draw_sprite_ext(sSquare,mip,_xx,_yy,_scale,_scale,0,global.solidColor,1);
	
	if (lost) {
		if (mineGrid[# xx,yy]) {
			var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
			draw_sprite_ext(sMine,mip,_xx,_yy,_scale*_size,_scale*_size,0,global.mineColor,1);
		}
	}
				
	if (flagEaseGrid[# xx,yy] > 0) {
		var _xSize = ease_backOut(0,1,flagEaseGrid[# xx,yy],1, 3.5);
		var _ySize = lerp(_xSize, ease_expoIn(0,1, flagEaseGrid[# xx,yy], 1),0.5);
		draw_sprite_ext(sFlag,mip,_xx,_yy+30*_sScale,_scale*_ySize,_scale*_xSize,0,global.flagColor,1);	
	}
}