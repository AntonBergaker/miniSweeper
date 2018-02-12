if room == rMain {
	var _dpiScale = global.dpi/72;
	if (global.onPhone) {
		_dpiScale*=0.4;	
	}
	
	//Camera offsets so you can always reach the mine under the settings
	var _minY = -(height/global.guiHeight)*70*_dpiScale;
	var _maxY = 0;
	
	var _fieldWidth  = oGridControl.fieldWidth;
	var _fieldHeight = oGridControl.fieldHeight - _minY + _maxY;
	
	//also fit the zoom
	if (width > _fieldWidth && height > _fieldHeight) {
		var _fieldRatio = _fieldWidth/_fieldHeight;
		if (_fieldRatio > global.displayRatio) {
			width = _fieldWidth;
			height = width/global.displayRatio;
		} else {
			height = _fieldHeight;
			width = height*global.displayRatio;
		}
	}
	
	//if it fits
	if (width < _fieldWidth) {
		x = clamp(x, 0, oGridControl.fieldWidth -width );
	} else { //else it sits
		x = (oGridControl.fieldWidth-width)/2;
	}
	if (height < _fieldHeight) {
		y = clamp(y, _minY, oGridControl.fieldHeight-height+_maxY);
	} else {
		y = (oGridControl.fieldHeight+_minY/2-height)/2;	
	}
	
	camera_set_view_pos(camera,x,y);
	camera_set_view_size(camera,width,height);
}