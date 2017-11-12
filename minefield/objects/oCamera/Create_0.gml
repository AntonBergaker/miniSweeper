camera = camera_create_view(0,0,global.internalWidth,global.internalHeight,0,noone,0,0,0,0);

surface_resize(application_surface,global.internalWidth,global.internalHeight);
view_enabled    = true;
view_visible[0] = true;
view_camera[0] = camera;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = global.windowWidth;
view_hport[0] = global.windowHeight;