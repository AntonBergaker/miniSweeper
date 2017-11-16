global.backColor = c_white;
global.solidColor = $53C800;
global.clearedColor = $CAF6B9;
global.textColor = c_black;
global.mineColor = c_black;
global.buttonColor = $49E047;

global.darkMode = false;

if (global.darkMode) {
	global.solidColor = $7E231A;
	global.clearedColor = $282010;
	global.textColor = c_white;
	global.backColor = c_black;
	global.mineColor = c_white;
	global.buttonColor = c_gray;
}

if (file_exists("save.sav")) {
	oGridControl.enabled = true;
	menu = noone;
	instance_destroy();
} else {
	menu = scr_menu_create(0,0,1,1);
	menu.depth = depth-1;

	scr_menu_set_button_settings(menu,fa_center,fa_middle,fMineTextMip0,0.6,0.1)
	playButton = scr_menu_create_button(menu,0.5,0.5,"Play","play",true);

	settingsButton = scr_menu_create_button(menu,0.5,0.7,"Settings","settings",false);
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.8,0.2)
	nameLabel = scr_menu_create_label(menu, 0.5, 0.2, "miniSweeper")
}