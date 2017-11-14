if room == rMain {
	//if it fits
	if (width < oGridControl.fieldWidth) {
		x = clamp(x, 0, oGridControl.fieldWidth -width );
	} else { //else it sits
		x = (oGridControl.fieldWidth-width)/2;
	}
	if (height < oGridControl.fieldHeight) {
		y = clamp(y, 0, oGridControl.fieldHeight-height);
	} else {
		y = (oGridControl.fieldHeight-height)/2;	
	}
	camera_set_view_pos(camera,x,y);
	camera_set_view_size(camera,width,height);
}