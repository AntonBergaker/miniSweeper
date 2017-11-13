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
			scr_draw_cell(xx,yy,0);
		}
	}
} else {
	var _len = ds_list_size(removeEaseList);
	for (var i=0;i<_len;i++) {
		var _arr = removeEaseList[| i];
		var _x = _arr[0];
		var _y = _arr[1];
		scr_draw_cell(_x,_y,1);
	}
	var _len = ds_list_size(flagEaseList);
	for (var i=0;i<_len;i++) {
		var _arr = flagEaseList[| i];
		var _x = _arr[0];
		var _y = _arr[1];
		scr_draw_cell(_x,_y,1);
	}
}

updateDrawing = false;