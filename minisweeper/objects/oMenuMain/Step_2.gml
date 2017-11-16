var _selected = scr_menu_get_selected(menu);
if (_selected) {
	switch (_selected.tag) {
		case "play":
			oGridControl.enabled = true;
			instance_destroy();
			break;
		
		
	}
}