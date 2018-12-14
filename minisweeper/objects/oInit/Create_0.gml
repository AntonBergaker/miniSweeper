global.onPhone = true;
global.dpiScaleFactor = 1;
if (os_type == os_windows || os_type == os_macosx || os_type == os_linux || os_type == os_uwp) {
	global.onPhone = false;	
}

global.browser = (os_browser != browser_not_a_browser);

if (os_type == os_android || os_type == os_ios) {
	global.displayRatio = window_get_width()/window_get_height();
	global.internalWidth = window_get_width();
	global.internalHeight = window_get_height();
	global.windowWidth = window_get_width();
	global.windowHeight = window_get_height();
	global.dpi = display_get_dpi_x();
	global.guiWidth = display_get_gui_width();
	global.guiHeight = display_get_gui_height();
	global.forceWindowX = window_get_x();
	global.forceWindowY = window_get_y();
	global.lastWindowX = window_get_x();
	global.lastWindowY = window_get_y();

} else {
	var _width = clamp(display_get_width(),0,1366);
	var _height = clamp(display_get_height(),0,768);
	global.displayRatio = _width/_height;
	global.internalWidth = _width;
	global.internalHeight = _height;
	global.windowHeight = _height;
	global.windowWidth = _width;
	global.dpi = display_get_dpi_x();
	global.guiWidth = display_get_gui_width();
	global.guiHeight = display_get_gui_height();
	global.forceWindowX = -1;
	global.forceWindowY = -1;
	global.lastWindowX = 0;
	global.lastWindowY = 0;
}

if global.browser {
	global.forceWindowX = 0;
	global.forceWindowY = 0;
}

show_debug_overlay(1)


global.dpiScale = global.dpi/72;
if (global.onPhone) {
	global.dpiScaleFactor = 0.4;
}
if (os_device = device_ios_ipad || os_device = device_ios_ipad_retina) {
	global.dpiScaleFactor = 0.7;	
}


global.dpiScale *= global.dpiScaleFactor;	

global.vibrate = true;
global.audioVolume = 1;
global.clearAnimation = true;
global.tweenEnabled = true;
global.showTimer = true;
global.showTimerMenu = true;
global.switchedControls = false;
global.showSwitchButton = false;
global.showMines = ShowMinesState.Five;

enum ShowMinesState {
	Always,
	Five,
	Never
}


global.gridWidth = 7;
global.gridHeight = 10;
global.mineCount = 10;
global.presetGrid = true;
global.highScores = ds_map_create();

global.saveVersion = 0;

scr_themes_create();
global.currentTheme = "Default";

scr_load_settings();

global.oldSaveExists = file_exists("save.sav");
global.saveExists    = file_exists("game.json");

if (!global.onPhone) {
	var _width = global.windowWidth;
	var _height = global.windowHeight;
	global.displayRatio = _width/_height;
	global.internalWidth = _width;
	global.internalHeight = _height;
}

scr_theme_apply(global.currentTheme);
timer = 0;

window_set_size(global.windowWidth,global.windowHeight);


device_mouse_dbclick_enable(0);

scr_init_variables();

application_surface_draw_enable(0);
application_surface_enable(0);

randomize();