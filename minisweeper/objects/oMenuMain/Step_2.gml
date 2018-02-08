if (!fadeOut) {
	var _selected = scr_menu_get_selected(menu);
	if (_selected) {
		switch (_selected.tag) {
			case "play":
				oGridControl.enabled = true;
				if (rebootGrid || updateSize) {
					with oGridControl {
						if (other.updateSize || global.gridWidth != gridWidth
						|| global.gridHeight != gridHeight || global.mineCount != gridMines) {
							scr_grid_update_size();
						}
						scr_reset_grid();	
						locked = LockedState.Unlocked;
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
			
			case "settings":
				instance_create_layer(0,0,"MenuSettings", oMenuSettings)
				break;
			
			case "sizeToggle":
				global.presetGrid = !global.presetGrid;
				scr_save_settings();
				if (global.presetGrid) {
					var _inst = sizeSelection;
					var _str = scr_format_gridstring(global.gridWidth, global.gridHeight, global.mineCount);
					if (!array_contains(sizeSelection.data, _str)) {
						log("Didn't find old");
						sizeSelection.data[@ 3] = _str;
					}
					
					scr_menu_slider_set_position(sizeSelection, _str);
				} else {
					scr_menu_slider_set_position(widthSelection , global.gridWidth);
					scr_menu_slider_set_position(heightSelection, global.gridHeight);
					scr_menu_slider_set_position(mineSelection  , global.mineCount);
				}
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
			
			case heightSelection:
				global.gridHeight = _updated.selected;
				updateSize = true;
				scr_save_settings();
				break;
				
			case widthSelection:
				global.gridWidth = _updated.selected;
				updateSize = true;
				scr_save_settings();
				break;
				
			case mineSelection:
				global.mineCount = _updated.selected;
				updateSize = true;
				scr_save_settings();
				break;
		}
	}
}
