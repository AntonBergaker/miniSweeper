if room == rMain {
	
	//also fit the zoom
	if (width > oGridControl.fieldWidth && height > oGridControl.fieldHeight) {
		var _fieldRatio = oGridControl.fieldWidth/oGridControl.fieldHeight;
		if (_fieldRatio > global.displayRatio) {
			width = oGridControl.fieldWidth;
			height = width/global.displayRatio;
		} else {
			height = oGridControl.fieldHeight;
			width = height*global.displayRatio;
		}
	}
	
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