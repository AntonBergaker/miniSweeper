fadeIn = false;
fadeInTimer = 0;
rebootGrid = false;
fadeOut = false;
fadeOutTimer = false;
alpha = 0;
updateSize = false;


if (file_exists("save.sav")) {
	oGridControl.enabled = true;
	menu = noone;
	instance_destroy();
} else {
	menu = scr_menu_create(0,0,1,1);
	menu.alpha = 0;
	menu.depth = depth-1;

	scr_menu_set_button_settings(menu,fa_center,fa_middle,fMineTextMip0,0.6,0.1)
	playButton = scr_menu_create_button(menu,0.5,0.42,"Play","play",true);

	settingsButton = scr_menu_create_button(menu,0.5,0.75,"Settings","settings",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fMineTextMip0,0.4,0.07)
	sizeToggle = scr_menu_create_button(menu,0.5,0.62,"Presets","sizeToggle",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.8,0.2)
	nameLabel = scr_menu_create_label(menu, 0.5, 0.2, "miniSweeper")
	
	scr_menu_set_button_settings(menu, fa_center, fa_middle, fLightMenu, 0.9, 0.09);
	var _startString = string(global.gridWidth)+"x" + string(global.gridHeight) + " " +string(global.mineCount) + "*"

	sizeSelection = scr_menu_create_slider(menu, 0.5, 0.54, true, ["7x10 10*", "12x22 40*","18x32 100*"], _startString, "18x32 100*");
}