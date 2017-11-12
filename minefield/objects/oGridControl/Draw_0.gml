draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

for (var xx=0;xx<gridWidth;xx++) {
	for (var yy=0;yy<gridHeight;yy++) {
		var _xx = 100+xx*150;
		var _yy = 100+yy*150;
		
		if (clearedGrid[# xx,yy]) {
			draw_sprite_ext(sCleared,mip,_xx,_yy,mipScale,mipScale,0,c_white,1)
			var _count = nearGrid[# xx,yy];
			if (_count >= 1) { 
				draw_text_mip(_xx,_yy, string(nearGrid[# xx,yy]));
			}
			if (mineGrid[# xx,yy]) {
				draw_sprite_ext(sFlag,mip,_xx,_yy,mipScale,mipScale,0,c_white,1);
			}
			
		} else {
			draw_sprite_ext(sSolid,mip,_xx,_yy,mipScale,mipScale,0,c_white,1);
			if (flagGrid[# xx,yy]) {
				draw_sprite_ext(sFlag,mip,_xx,_yy,mipScale,mipScale,0,c_white,1);	
			}
		}
	}
}
