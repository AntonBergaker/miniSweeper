if (updateDrawing) {
	log("drew at ", gameTime); 
	draw_set_color(backColor);
	draw_rectangle(oCamera.x,oCamera.y,oCamera.x+oCamera.width,oCamera.y+oCamera.height,0);

	draw_set_color(textColor);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	var _startX = clamp(coord_to_grid_x(oCamera.x)-1,0,gridWidth -1);
	var _startY = clamp(coord_to_grid_y(oCamera.y)-1,0,gridHeight-1);

	var _endX = clamp(coord_to_grid_x(oCamera.x+oCamera.width )+1,0,gridWidth);
	var _endY = clamp(coord_to_grid_y(oCamera.y+oCamera.height)+1,0,gridHeight);

	for (var xx=_startX;xx<_endX;xx++) {
		for (var yy=_startY;yy<_endY;yy++) {
			var _xx = 100+xx*160;
			var _yy = 100+yy*160;
		
			if (clearedGrid[# xx,yy]) {
				if (clearedColor == -1) {
					draw_sprite_ext(sCleared,mip,_xx,_yy,mipScale,mipScale,0,c_white,1);
				} else {
					draw_sprite_ext(sSquare,mip,_xx,_yy,mipScale,mipScale,0,clearedColor,1);
				}
				var _count = nearGrid[# xx,yy];
				if (_count >= 1) { 
					draw_text_mip(_xx,_yy, string(nearGrid[# xx,yy]));
				}
			
				if (removeEaseGrid[# xx,yy] < 1) {
					var _farIn = ease_quadOut(0,1,removeEaseGrid[# xx,yy],1);
					var _rot = -_farIn*10;
					var _alpha = 1-_farIn;
					var _size = 1-_farIn;
					if (solidColor == -1) {
						draw_sprite_ext(sSolid,mip,_xx,_yy + _farIn*4,mipScale*_size,mipScale*_size,_rot,c_white,_alpha);
					} else {
						draw_sprite_ext(sSquare,mip,_xx,_yy + _farIn*4,mipScale*_size,mipScale*_size,_rot,solidColor,_alpha);
					}
				}
			

				if (mineGrid[# xx,yy]) {
					var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
					if (mineColor == -1) {
						draw_sprite_ext(sMine,mip,_xx,_yy,mipScale*_size,mipScale*_size,0,c_white,1);
					} else {
						draw_sprite_ext(sMineUncolored,mip,_xx,_yy,mipScale*_size,mipScale*_size,0,mineColor,1);
					}
				}
			
			
			} else {
				if (solidColor == -1) {
					draw_sprite_ext(sSolid,mip,_xx,_yy,mipScale,mipScale,0,c_white,1);
				} else {
					draw_sprite_ext(sSquare,mip,_xx,_yy,mipScale,mipScale,0,solidColor,1);
				}
				if (lost) {
					if (mineGrid[# xx,yy]) {
						var _size = ease_backOut(0,1,mineEaseGrid[# xx,yy],1, 3.5);
						if (mineColor == -1) {
							draw_sprite_ext(sMine,mip,_xx,_yy,mipScale*_size,mipScale*_size,0,c_white,1);
						} else {
							draw_sprite_ext(sMineUncolored,mip,_xx,_yy,mipScale*_size,mipScale*_size,0,mineColor,1);
						}
					}
				}
				
				if (flagEaseGrid[# xx,yy] > 0) {
					var _xSize = ease_backOut(0,1,flagEaseGrid[# xx,yy],1, 3.5);
					var _ySize = lerp(_xSize, ease_expoIn(0,1, flagEaseGrid[# xx,yy], 1),0.5);
					draw_sprite_ext(sFlag,mip,_xx,_yy+30,mipScale*_ySize,mipScale*_xSize,0,c_white,1);	
				}
				
			}
		}
	}
}

updateDrawing = false;