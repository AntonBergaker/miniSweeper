if (!enabled) {
	exit;	
}

if (!surface_exists(surf)) {
	surf = surface_create(global.internalWidth, global.internalHeight);
	updateDrawing = true;
	log("New surface");
}
if (surface_exists(surf)) {
	surface_set_target(surf);
	if (updateDrawing) {
		draw_set_color(global.backColor);
		draw_rectangle(0,0,global.internalWidth,global.internalHeight,0);
		
		draw_set_color(global.textColor);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);

		var _startX = clamp(coord_to_grid_x(oCamera.x)-1,0,gridWidth -1);
		var _startY = clamp(coord_to_grid_y(oCamera.y)-1,0,gridHeight-1);

		var _endX = ceil(clamp(coord_to_grid_x(oCamera.x+oCamera.width )+1,0,gridWidth));
		var _endY = ceil(clamp(coord_to_grid_y(oCamera.y+oCamera.height)+1,0,gridHeight));

		for (var xx=_startX;xx<_endX;xx++) {
			for (var yy=_startY;yy<_endY;yy++) {
				scr_draw_cell(xx,yy,0);
			}
		}
	} else {
		var _len1 = ds_list_size(removeEaseList);
		var _len2 = ds_list_size(flagEaseList);
		var _len3 = ds_list_size(updateCellList);
		
		if (_len1 || _len2 || _len3) {
			draw_set_color(global.textColor);
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);	
		}
		
		for (var i=0;i<_len1;i++) {
			var _arr = removeEaseList[| i];
			var _x = _arr[0];
			var _y = _arr[1];
			scr_draw_cell(_x,_y,1);
		}

		for (var i=0;i<_len2;i++) {
			var _arr = flagEaseList[| i];
			var _x = _arr[0];
			var _y = _arr[1];
			scr_draw_cell(_x,_y,1);
		}

		for (var i=_len3-1;i>=0;i--) {
			var _arr = updateCellList[| i];
			var _x = _arr[0];
			var _y = _arr[1];
			scr_draw_cell(_x,_y,1);
			ds_list_delete(updateCellList,i);
		}
	}
	surface_reset_target();
}
updateDrawing = false;