if (!enabled) {
	exit;	
}

mip = clamp(round(log2(oCamera.width/global.windowWidth)/1.5),0,3);
mipScale = power(2,mip);

if (redrawFrames > 0) {
	redrawFrames--;
	updateDrawing = true;
}