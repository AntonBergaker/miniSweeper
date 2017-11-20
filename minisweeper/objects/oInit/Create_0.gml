if (os_type == os_android) {
	global.displayRatio = window_get_width()/window_get_height();
	global.internalWidth = window_get_width();
	global.internalHeight = window_get_height();
	global.windowWidth = window_get_width();
	global.windowHeight = window_get_height();
	global.dpi = display_get_dpi_x();
	
} else {
	global.displayRatio = 1366/768;
	global.internalWidth = 1366;
	global.internalHeight = global.internalWidth/global.displayRatio;
	global.windowHeight = 768;
	global.windowWidth = 1366;
	global.dpi = 72;
}

show_debug_overlay(1)

window_set_size(global.windowWidth,global.windowHeight);

global.gridWidth = 7;
global.gridHeight = 10;
global.mineCount = 10;
global.highScores = ds_map_create();

global.saveVersion = 0;

scr_themes_create();
global.currentTheme = "Default";

scr_load_settings();
scr_theme_apply(global.currentTheme);
timer = 0;

device_mouse_dbclick_enable(0);

scr_init_variables();

application_surface_draw_enable(0);
application_surface_enable(0);

randomize();