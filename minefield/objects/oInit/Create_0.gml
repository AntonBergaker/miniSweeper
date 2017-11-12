if (os_type == os_android) {
	global.displayRatio = display_get_width()/display_get_height();
	global.internalWidth = 2000;
	global.internalHeight = global.internalWidth/global.displayRatio;
	global.windowWidth = display_get_width();
	global.windowHeight = display_get_height();
	
} else {
	global.displayRatio = 1;
	global.internalWidth = 2000;
	global.internalHeight = 2000;
	global.windowHeight = 900;
	global.windowWidth = 900;
}

window_set_size(global.windowWidth,global.windowHeight);

scr_init_variables();

room_goto_next();