var _change = mouse_wheel_down() - mouse_wheel_up();

if _change != 0
	{
	global.internalHeight *= (1.1+_change*0.2);
	global.internalWidth = global.internalHeight;

	camera_set_view_size(oCamera.camera,global.internalWidth,global.internalHeight);
	}


mip = clamp(round(log2(global.internalHeight/1280)),0,3);
mipScale = power(2,mip);

log(mip);