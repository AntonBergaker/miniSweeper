//look for changes
var _check = false;
if (steps >= 5) {
	_check = true;
	steps = 0;
}

if (_check) {
	if (global.windowWidth != window_get_width()      || global.windowHeight != window_get_height()
	||  global.guiWidth    != display_get_gui_width() || global.guiHeight    != display_get_gui_height()
	|| forceCheck > 0) {
		if (window_get_width() != 0 && window_get_height() != 0) {
			var _preZoom = width / global.internalWidth;
			display_set_gui_maximise();
			global.displayRatio = window_get_width()/window_get_height();
			global.internalWidth = window_get_width();
			global.internalHeight = window_get_height();
			global.windowWidth = window_get_width();
			global.windowHeight = window_get_height();
			global.guiWidth = display_get_gui_width();
			global.guiHeight = display_get_gui_height();
			global.dpi = display_get_dpi_x();
			global.dpiScale = global.dpi/72;
			global.dpiScale *= global.dpiScaleFactor;	
			
			if (global.forceWindowX != -1 && global.forceWindowY != -1) {
				var _xx = global.forceWindowX;
				var _yy = global.forceWindowY;
				_xx = clamp(_xx, 0, display_get_width() - window_get_width());
				_yy = clamp(_yy, 0, display_get_height() - window_get_height());
				window_set_position(_xx, _yy);
				if (forceCheck == 1) {
					global.forceWindowX = -1;
					global.forceWindowY = -1;
				}
			}
			
		
			if (!global.onPhone && forceCheck <= 1) {
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
		
			log("reset cam");
			oGridControl.updateDrawing = true;
			timer = 3;
		
			camera_set_view_size(camera,width,height);
			forceCheck--;
		}
	}
	
	if (!global.onPhone && (window_get_x() != global.lastWindowX || window_get_y() != global.lastWindowY)) {
		
		global.lastWindowX = window_get_x();
		global.lastWindowY = window_get_y();
		scr_save_settings();
	}
}

steps++;
timer -= deltaTimeS;
if timer > 0 {
	oGridControl.updateDrawing = true;	
}