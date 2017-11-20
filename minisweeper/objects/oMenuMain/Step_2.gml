if (!fadeOut) {
	var _selected = scr_menu_get_selected(menu);
	if (_selected) {
		switch (_selected.tag) {
			case "play":
				oGridControl.enabled = true;
				if (rebootGrid) {
					with oGridControl {
						if (other.updateSize) {
							scr_grid_update_size();
						}
						scr_reset_grid();	
						locked = false;
						firstPress = true;
					}
				}
				with oCamera {
					x = oGridControl.fieldWidth/2 - width/2;
					y = oGridControl.fieldHeight/2 - height/2;
				}
				oGridControl.redrawFrames = 2;
				fadeOut = true;
				menu.enabled = false;
				break;
		}
	}
	
	
	var _updated = scr_menu_get_updated_slider(menu);
	if (_updated) {
		switch (_updated) {
			case sizeSelection:
				var _str = sizeSelection.selected;
				var _ind = string_pos("x",_str);
				var _wStr = string_copy(_str, 1, _ind-1);
				var _str = string_delete(_str, 1, _ind);
				var _ind = string_pos(" ",_str);
				var _hStr = string_copy(_str, 1, _ind-1);
				var _str = string_delete(_str, 1, _ind);
				var _mStr = string_copy(_str, 1, string_length(_str)-1);
				
				global.gridWidth = real(_wStr);
				global.gridHeight = real(_hStr);
				global.mineCount = real(_mStr);
				updateSize = true;
				scr_save_settings();
				break;
			
		}
	}
}
