fadeIn = true;
fadeInInit = true;
fadeInTimer = 0;
rebootGrid = false;
fadeOut = false;
fadeOutTimer = false;
alpha = 0;
updateSize = false;

customTimer = 0;
bestTimeTimer = 0;

var _wide = global.guiWidth > global.guiHeight;


if (global.saveExists) {
	oGridControl.enabled = true;
	menu = noone;
	disabled = true;
	instance_destroy();
} else {
	menu = scr_menu_create(0,0,1,1);
	menu.alpha = 0;
	menu.depth = depth-1;

	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.5,0.1);
	playButtonY = 0.42;
	playButtonYCustom = 0.33;
	playButton = scr_menu_create_button(menu,0.5,playButtonY,"Play","play",true);

	settingsButtonY = 0.75;
	settingsButtonYCustom = 0.83;
	settingsButton = scr_menu_create_button(menu,0.5,0.75,"Settings","settings",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.4,0.07)
	sizeToggleY = 0.62;
	sizeToggleYCustom = 0.7;
	sizeToggle = scr_menu_create_button(menu,0.5,0.62,"Custom","sizeToggle",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.8,0.2)
	nameLabelY = 0.2;
	nameLabelYCustom = 0.17;
	nameLabel = scr_menu_create_label(menu, 0.5, 0.2, "miniSweeper")
	
	/*scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.08,0.08)
	audioButton = scr_menu_create_button(menu, 0.1,0.9, " ", "audio", false);
	audioSprite = scr_menu_create_sprite(menu, 0.1, 0.9, 0.08, 0.08, sNote, ThemeColors.Text);
	audioSprite.alpha = 0.8;
	*/
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.9, 0.09);
	var _startString = scr_format_gridstring(global.gridWidth, global.gridHeight, global.mineCount);
	if (!_wide) {
		var _array = ["7x10 10*", "12x22 40*","18x32 100*"];
	} else {
		var _array = ["10x7 10*", "22x12 40*","32x18 100*"];	
	}
	if (!array_contains(_array, _startString)) {
		_array[@ 3] = _startString;
	}

	sizeSelectionY = 0.54;
	sizeSelection = scr_menu_create_slider(menu, 0.5, sizeSelectionY, true, _array, _startString, "18x32 100*");
	
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.8, 0.08);
	widthSelectionY = 0.46;
	widthSelection = scr_menu_create_slider(menu, 0.6, widthSelectionY, false, [1,200], global.gridWidth, "999");
	widthSelection.linesMod = 3;
	
	heightSelectionY = 0.54;
	heightSelection = scr_menu_create_slider(menu, 0.6, heightSelectionY, false, [1, 200], global.gridHeight, "999");
	heightSelection.linesMod = 3;
	
	mineSelectionY = 0.62;
	mineSelection = scr_menu_create_slider(menu, 0.6, mineSelectionY, false, [1, 9999], global.mineCount, "9999");
	mineSelection.linesMod = 3;
	
	
	scr_menu_set_button_settings(menu, fa_left, fa_middle, fLightMenu, 0.20, 0.07);
	sliderWidthLabel  = scr_menu_create_label(menu, 0.1, widthSelectionY , "W");
	sliderHeightLabel = scr_menu_create_label(menu, 0.1, heightSelectionY, "H");
	sliderMineLabel   = scr_menu_create_label(menu, 0.1, mineSelectionY  , "*");

	
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.20, 0.04);
	minesLabelY = 0.48;
	minesLabelYCustom = 0.41;
	minesLabel = scr_menu_create_label(menu, 0.85, 0.48, "40%*");
	minesLabel.alpha = 0.8;
	
	recordLabel = scr_menu_create_label(menu, 0.15, 0.48, "10:20:42");
	recordLabelY = 0.48;
	recordLabelYCustom = 0.41;
	recordLabel.alpha = 0.8;
	
	var _result = global.highScores[? scr_format_gridstring_unordered(global.gridWidth, global.gridHeight, global.mineCount)];
	if (_result != undefined && global.showTimerMenu) {
		bestTimeTimer = 1;
	}
	if (!global.presetGrid) {
		customTimer = 1;	
	}
}

