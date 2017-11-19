var _selected = scr_menu_get_selected(menu);
if (!fadeOut) {
	if (_selected) {
		switch (_selected.tag) {
			case "play":
				oGridControl.enabled = true;
				if (rebootGrid) {
					with oGridControl {
						scr_reset_grid();	
						locked = false;
						firstPress = true;
					}
				}
				fadeOut = true;
				menu.enabled = false;
				break;
		}
	}
}