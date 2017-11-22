fadeIn = true;
fadeInInit = true;
fadeInTimer = 0;
rebootGrid = false;
fadeOut = false;
fadeOutTimer = false;
alpha = 0;
updateSize = false;

presetTimer = 0;
bestTimeTimer = 0;


if (file_exists("save.sav")) {
	oGridControl.enabled = true;
	menu = noone;
	disabled = true;
	instance_destroy();
} else {
	menu = scr_menu_create(0,0,1,1);
	menu.alpha = 0;
	menu.depth = depth-1;

	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.5,0.1)
	playButton = scr_menu_create_button(menu,0.5,0.42,"Play","play",true);

	settingsButton = scr_menu_create_button(menu,0.5,0.75,"Settings","settings",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.4,0.07)
	sizeToggle = scr_menu_create_button(menu,0.5,0.62,"Custom","sizeToggle",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.8,0.2)
	nameLabel = scr_menu_create_label(menu, 0.5, 0.2, "miniSweeper")
	
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.9, 0.09);
	var _startString = scr_format_gridstring(global.gridWidth, global.gridHeight, global.mineCount);
	if (global.onPhone) {
		var _array = ["7x10 10*", "12x22 40*","18x32 100*"];
	} else {
		var _array = ["10x7 10*", "22x12 40*","32x18 100*"];	
	}
	if (!array_contains(_array, _startString)) {
		_array[@ 3] = _startString;
	}

	sizeSelection = scr_menu_create_slider(menu, 0.5, 0.54, true, _array, _startString, "18x32 100*");
	
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.20, 0.04);
	minesLabel = scr_menu_create_label(menu, 0.85, 0.48, "40%*");
	minesLabel.alpha = 0.8;
	
	recordLabel = scr_menu_create_label(menu, 0.15, 0.48, "10:20:42");
	recordLabel.alpha = 0.8;
	
	var _result = global.highScores[? scr_format_gridstring_unordered(global.gridWidth, global.gridHeight, global.mineCount)];
	if (_result != undefined) {
		bestTimeTimer = 1;
	}
}

