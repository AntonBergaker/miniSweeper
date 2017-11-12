var _change = mouse_wheel_down() - mouse_wheel_up();

if _change != 0
	{
	var _normalX = (mouse_x-oCamera.x)/oCamera.width;
	var _normalY = (mouse_y-oCamera.y)/oCamera.height;
	
	var _mX = oCamera.x + oCamera.width *_normalX;
	var _mY = oCamera.y + oCamera.height*_normalY;
	
	oCamera.width *= (1.1+_change*0.2);
	oCamera.height = oCamera.width/global.displayRatio;
	
	oCamera.x = _mX - oCamera.width  * _normalX;
	oCamera.y = _mY - oCamera.height * _normalY;
	updateDrawing = true;
	}


mip = clamp(round(log2(oCamera.width/global.windowWidth)/1.5),0,3);
mipScale = power(2,mip);

if (redrawFrames > 0) {
	redrawFrames--;
	updateDrawing = true;
}