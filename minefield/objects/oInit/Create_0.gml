if (os_type == os_android) {
	global.displayRatio = window_get_width()/window_get_height();
	global.internalWidth = window_get_width();
	global.internalHeight = window_get_height();
	global.windowWidth = window_get_width();
	global.windowHeight = window_get_height();
	
} else {
	global.displayRatio = 1366/768;
	global.internalWidth = 1366;
	global.internalHeight = global.internalWidth/global.displayRatio;
	global.windowHeight = 768;
	global.windowWidth = 1366;
}

window_set_size(global.windowWidth,global.windowHeight);
surface_resize(application_surface,global.internalWidth*2,global.internalHeight*2);

game_set_speed(60,gamespeed_fps)

timer = 0;

device_mouse_dbclick_enable(0);


scr_init_variables();

randomize();