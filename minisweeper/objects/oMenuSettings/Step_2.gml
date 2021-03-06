var _inst = scr_menu_get_selected(menu);
var _updated = false;

if (_inst) {
	switch (_inst.tag) {
		case "tween":
			global.tweenEnabled = _inst.checked;
			_updated = true;
			break;
		case "instant":
			global.clearAnimation = _inst.checked;
			_updated = true;
			break;
		case "timer":
			global.showTimer = _inst.checked;
			_updated = true;
			break;
		case "timermenu":
			global.showTimerMenu = _inst.checked;
			_updated = true;
			break;
		case "switchcontrols":
			global.switchedControls = _inst.checked;
			_updated = true;
			break;
		case "switchbutton":
			global.showSwitchButton = _inst.checked;
			_updated = true;
			break;
		case "vibrate":
			global.vibrate = _inst.checked;
			_update = true;
			break;
		case "audio":
			global.audioVolume = _inst.checked;
			_updated = true;
			break;
		case "controls":
			instance_create_layer(1, 0, "MenuSettingsControls", oMenuSettingsControls);
			break;
		case "back":
			menu.enabled = false;
			scr_menu_stack_pushtoend(menu);
			fadeOut = true;
			if (inGame) {
				oGridControl.locked = gridPreLock;	
			}
			oGridControl.updateDrawing = true;
			break;
		case "menu":
			with (oGridControl) {
				repeat(3) {
					scr_reset_place_recursive( irandom(gridWidth-1), irandom(gridHeight-1));
				}
				locked = LockedState.Locked;
				resetting = true;
				hideOnReset = true;
				hideOnResetTimer = 0;
			}
			
			if (global.saveExists) {
				file_delete("game.json");
				global.saveExists = false;
			}
			
			var _inst = instance_create_layer(0,0,"MenuMain",oMenuMain);
			_inst.fadeIn = true;
			_inst.fadeInInit = false;
			_inst.rebootGrid = true;
			menu.enabled = false;
			scr_menu_stack_pushtoend(menu);
			fadeOut = true;
			break;
	}
}

var _inst = scr_menu_get_updated_slider(menu);
if (_inst) {
	switch (_inst) {
		case themeSlider:
			var _nt = global.themes[? themeSlider.selected];
			scr_fade_theme(_nt);
			global.currentTheme = _nt[? "name"];
			_updated = true;
			break;
		case showMineSlider:
			var _str = showMineSlider.selected;
			if (_str == tMinesAlways) {
				global.showMines = ShowMinesState.Always;
			} else if (_str == tMinesNever) {
				global.showMines = ShowMinesState.Never;	
			} else {
				global.showMines = ShowMinesState.Five;	
			}
			_updated = true;
			break;
	}
}

if (_updated) {
	scr_save_settings();
}