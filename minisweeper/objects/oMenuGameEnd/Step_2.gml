var _inst = scr_menu_get_selected(menu);
if (!destroy) {
	if (_inst) {
		switch _inst.tag {
			case "retry":
				with (oGridControl) {
					repeat(3) {
						scr_reset_place_recursive( irandom(gridWidth-1), irandom(gridHeight-1));
					}
					resetting = true;
					locked = false;
				}
				toMenu = false;
				introTimer = -1;
				destroy = true;
				menu.enabled = false;
				break;
			case "menu":
				with (oGridControl) {
					repeat(3) {
						scr_reset_place_recursive( irandom(gridWidth-1), irandom(gridHeight-1));
					}
					locked = true;
					resetting = true;
					hideOnReset = true;
					hideOnResetTimer = 0;
				}
				var _inst = instance_create_layer(0,0,"MenuMain",oMenuMain);
				_inst.fadeIn = true;
				_inst.rebootGrid = true;
				introTimer = -1;
				destroy = true;
				toMenu = true;
				menu.enabled = false;
				break;
		
		}
	
	}
}