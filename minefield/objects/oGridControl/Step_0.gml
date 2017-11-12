///Check for starting moves
for (var i=0;i<5;i++) {
	if (touchAction[i] == TouchAction.None) {
		
		//Check clicking
		if (touchReleased[i]) {
			var _xx = touchReleaseX[i];
			var _yy = touchReleaseY[i];
		
			_xx = coord_to_grid_x(_xx);
			_yy = coord_to_grid_y(_yy);
		
			//Check if you released and clicked at the same square
			var _xx2 = coord_to_grid_x(touchPressX[i]);
			var _yy2 = coord_to_grid_y(touchPressY[i]);
		
			if touchPressTime[i] < 0.2 {
				if (_xx2 == _xx && _yy2 == _yy) {
					if (inside_grid(_xx,_yy)) {
						clearedGrid[# _xx, _yy] = true;
						if (nearGrid[# _xx, _yy]) == 0 {
							scr_clear_all_around_recursive(_xx,_yy);
						}
					}
				}
			}
		}
	
		//Check panning
		if (touchPressed[i]) {
			var _xx1 = touchX[i];
			var _yy1 = touchY[i];
			var _xx2 = touchPressX[i];
			var _yy2 = touchPressY[i];
			if (!touchCompleted[i]) {
				if (point_distance(_xx1,_yy1,_xx2,_yy2) > 40) {
					touchAction[i] = TouchAction.Pan;
					lastPanX = _xx2 - oCamera.x;
					lastPanY = _yy2 - oCamera.y;
					touchCompleted[i] = true;
				}
			}
		}

	
		//Check holding
		if (touchPressed[i] && !touchCompleted[i]) {
			if (touchPressTime[i] > 0.5) {
				var _xx = touchX[i];
				var _yy = touchY[i];
		
				_xx = coord_to_grid_x(_xx);
				_yy = coord_to_grid_y(_yy);
			
				var _xx2 = coord_to_grid_x(touchPressX[i]);
				var _yy2 = coord_to_grid_y(touchPressY[i]);
			
				if (_xx2 == _xx && _yy2 == _yy) {
					if (inside_grid(_xx,_yy)) {
						flagGrid[# _xx, _yy] = !flagGrid[# _xx, _yy];
					}
				}
			
				touchCompleted[i] = true;
			}
		}
	}
}

///panning
for (var i=0;i<5;i++) {
	if (touchAction[i] == TouchAction.Pan) {
		var _xx = touchX[i] - oCamera.x;
		var _yy = touchY[i] - oCamera.y;
		
		panSpeedX = (lastPanX - _xx);
		panSpeedY = (lastPanY - _yy);
		
		for (var ii=3;ii>=0;ii--) {
			panDiffsX[ii+1] = panDiffsX[ii];
			panDiffsY[ii+1] = panDiffsY[ii];
		}
		
		panDiffsX[i] = (lastPanX - _xx);
		panDiffsY[i] = (lastPanY - _yy);
		
		lastPanX = _xx;
		lastPanY = _yy;
		
		//If its the last frame set the speed to the last 5 highest,
		//because your movement can stop otherwise when releasing
		if (touchReleased[i]) {
			for (var ii=1;ii<4;ii++) {
				if (abs(panSpeedX) < abs(panDiffsX[ii])) {
					panSpeedX = panDiffsX[ii];	
				}
				if (abs(panSpeedY) < abs(panDiffsY[ii])) {
					panSpeedY = panDiffsY[ii];	
				}
			}
		}
	}
	
}

oCamera.x += panSpeedX;
oCamera.y += panSpeedY;

panSpeedX = lerp_time(panSpeedX,0,0.1,deltaTimeS);
panSpeedX = value_shift(panSpeedX, 0, deltaTimeS*4);

panSpeedY = lerp_time(panSpeedY,0,0.1,deltaTimeS);
panSpeedY = value_shift(panSpeedY, 0, deltaTimeS*4);