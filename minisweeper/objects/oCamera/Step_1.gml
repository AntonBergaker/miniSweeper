//look for changes
if (global.windowWidth != window_get_width() || global.windowHeight != window_get_height() || forceCheck) {
	if (window_get_width() != 0 && window_get_height() != 0) {
		var _preZoom = width / global.internalWidth;
		
		global.displayRatio = window_get_width()/window_get_height();
		global.internalWidth = window_get_width();
		global.internalHeight = window_get_height();
		global.windowWidth = window_get_width();
		global.windowHeight = window_get_height();
		global.guiWidth = display_get_gui_width();
		global.guiHeight = display_get_gui_height();
		global.dpi = display_get_dpi_x();
		
		if (!global.onPhone) {
			scr_save_settings();
		}
		
		window_set_size(global.windowWidth,global.windowHeight);
		
		if (surface_exists(oGridControl.surf)) {
			surface_resize(oGridControl.surf,global.internalWidth,global.internalHeight);
		}
		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = global.windowWidth;
		view_hport[0] = global.windowHeight;

		width  = _preZoom * global.internalWidth;
		height = _preZoom * global.internalHeight;
		
		oGridControl.updateDrawing = true;
		timer = 3;
		
		camera_set_view_size(camera,width,height);
		forceCheck = false;
	}
}
log(width);
timer -= deltaTimeS;
if timer > 0 {
	oGridControl.updateDrawing = true;	
}