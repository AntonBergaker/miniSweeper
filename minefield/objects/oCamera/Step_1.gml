//look for changes
if (global.windowWidth != window_get_width() || global.windowHeight != window_get_height()) {
	global.displayRatio = window_get_width()/window_get_height();
	global.internalWidth = window_get_width();
	global.internalHeight = window_get_height();
	global.windowWidth = window_get_width();
	global.windowHeight = window_get_height();
		
		
	window_set_size(global.windowWidth,global.windowHeight);
		
	surface_resize(application_surface,global.internalWidth,global.internalHeight);
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = global.windowWidth;
	view_hport[0] = global.windowHeight;

	width = global.internalWidth*3;
	height = global.internalHeight*3;
		
	oGridControl.updateDrawing = true;
	timer = 3;
		
	camera_set_view_size(camera,width,height);
}
timer -= deltaTimeS;
if timer > 0 {
	oGridControl.updateDrawing = true;	
}