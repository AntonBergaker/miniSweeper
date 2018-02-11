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
		case "back":
			menu.enabled = false;
			scr_menu_stack_pushtoend(menu);
			fadeOut = true;
			if (inGame) {
				oGridControl.locked = gridPreLock;	
			}
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