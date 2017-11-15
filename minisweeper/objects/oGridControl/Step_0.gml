///Check for starting moves
if (!enabled) {
	exit;	
}

if (firstStep) {
	updateDrawing = true;
	firstStep = false;
}

var _updatedField = false;

if (won == 0 && lost == 0 && resetting == 0) {
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
		
				if (inside_grid(_xx,_yy)) {
					if (_xx2 == _xx && _yy2 == _yy) {
						if (touchPressTime[i] < 0.2 - mineGrid[# _xx,_yy]*0.1) {
							if (!flagGrid[# _xx,_yy]) {
								if (firstPress) {
									var __xx1 = max(_xx - 2,0);
									var __yy1 = max(_yy - 2,0);
									var __xx2 = min(_xx + 2,gridWidth -1);
									var __yy2 = min(_yy + 2,gridHeight-1);
									while (ds_grid_get_sum(mineGrid, __xx1, __yy1, __xx2, __yy2) >= 1) {
										ds_grid_clear(mineGrid,0);
										scr_place_mines(gridMines);
									}
									scr_calculate_grid_near();
									firstPress = false;
								}
								if (!clearedGrid[# _xx, _yy]) {
									scr_clear_place(_xx, _yy);
									_updatedField = true;
								} else {
									var _nearFlags = scr_get_nearby(flagGrid, _xx, _yy);
									if (_nearFlags == nearGrid[# _xx, _yy]) {
										scr_clear_near(_xx,_yy);
										_updatedField = true;
									}
								}
							}
						}
					}
				}
			}
		
			//Check pinching
			if (touchPressed[i]) {
				//Check if we have two fingers down
				for (var ii=0;ii<5;ii++) {
					if (ii != i) {
						if (touchPressed[ii]) {
							if (touchAction[ii] == TouchAction.Pan || touchCompleted[ii] == false) {
								touchAction[i]  = TouchAction.Pinch1;
								touchAction[ii] = TouchAction.Pinch2;
								touchCompleted[i]  = true;
								touchCompleted[ii] = true;
							
								pinchStartScale = oCamera.width;
								pinchStartDistance = point_distance(
									device_mouse_raw_x(i),
									device_mouse_raw_y(i),
									device_mouse_raw_x(ii),
									device_mouse_raw_y(ii));
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
				if (!touchCompleted[i] && touchAction[i] == TouchAction.None) {
					if (point_distance(_xx1,_yy1,_xx2,_yy2) > 40) {
						touchAction[i] = TouchAction.Pan;
						lastPanX = _xx2 - oCamera.x;
						lastPanY = _yy2 - oCamera.y;
						touchCompleted[i] = true;
					}
				}
			}
		
		
			if (os_type != os_android) {
				if device_mouse_check_button_pressed(i,mb_right) {
					var _xx = touchX[i];
					var _yy = touchY[i];
		
					_xx = coord_to_grid_x(_xx);
					_yy = coord_to_grid_y(_yy);	
				
					if (inside_grid(_xx,_yy) && !clearedGrid[# _xx, _yy]) {
						scr_flag_cell(_xx,_yy);
					}
				}
			}
		
			//Check holding
			if (touchPressed[i] && !touchCompleted[i]) {
				if (touchPressTime[i] > 0.4) {
					var _xx = touchX[i];
					var _yy = touchY[i];
		
					_xx = coord_to_grid_x(_xx);
					_yy = coord_to_grid_y(_yy);
			
					var _xx2 = coord_to_grid_x(touchPressX[i]);
					var _yy2 = coord_to_grid_y(touchPressY[i]);
			
					if (_xx2 == _xx && _yy2 == _yy) {
						if (inside_grid(_xx,_yy) && !clearedGrid[# _xx, _yy]) {
							scr_flag_cell(_xx,_yy);
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

	//Pinching
	for (var i=0;i<5;i++) {
		if (touchAction[i] == TouchAction.Pinch1 || touchAction[i] == TouchAction.Pinch2) {
			updateDrawing = true;
		
			var _opposite = touchAction[i] == TouchAction.Pinch1 ? TouchAction.Pinch2 : TouchAction.Pinch1;
			var _foundOther = false;
			for (var ii=0;ii<5;ii++) {
				if (ii != i && touchAction[ii] == _opposite) {
					_foundOther = true;
				
					var _normalX = ((touchX[i]-oCamera.x) + (touchX[ii]-oCamera.x)) / (oCamera.width*2);
					var _normalY = ((touchY[i]-oCamera.y) + (touchY[ii]-oCamera.y)) / (oCamera.height*2);
				
					var _mX = oCamera.x + oCamera.width * _normalX;
					var _mY = oCamera.y + oCamera.height* _normalY;
				
					var _newDist = point_distance(
						device_mouse_raw_x(i),
						device_mouse_raw_y(i),
						device_mouse_raw_x(ii),
						device_mouse_raw_y(ii));
					var _change = pinchStartDistance / _newDist;
				
					oCamera.width  = pinchStartScale * _change;
					oCamera.height = oCamera.width/global.displayRatio;
				
					var _halfX = oCamera.width/2;
					var _halfY = oCamera.height/2;
				
					oCamera.x = _mX - oCamera.width * _normalX;
					oCamera.y = _mY - oCamera.height* _normalY;
				
					//Convert the other to a pan
					if (touchReleased[i]) {
						if (!touchReleased[ii]) {
							touchAction[ii] = TouchAction.Pan;
							lastPanX = touchX[ii] - oCamera.x;
							lastPanY = touchY[ii] - oCamera.y;
							touchCompleted[ii] = true;
						}
					}
					else if (touchReleased[ii]) {
						if (!touchReleased[i]) {
							touchAction[i] = TouchAction.Pan;
							lastPanX = touchX[i] - oCamera.x;
							lastPanY = touchY[i] - oCamera.y;
							touchCompleted[i] = true;
						}
					}
				}
			}
			if (!_foundOther) {
				touchAction[i] = TouchAction.None;	
			}
		}
	}

	if (abs(panSpeedX) + abs(panSpeedY) > 0) {
		updateDrawing = true;	
	}

	oCamera.x += panSpeedX;
	oCamera.y += panSpeedY;

	var _dir = point_direction(0,0,panSpeedX,panSpeedY);
	var _len = oCamera.width/1000;

	panSpeedX = lerp_time(panSpeedX,0,0.2,deltaTimeS*2.5);
	panSpeedX = value_shift(panSpeedX, 0, abs(lengthdir_x(_len,_dir)) * deltaTimeS);

	panSpeedY = lerp_time(panSpeedY,0,0.2,deltaTimeS*2.5);
	panSpeedY = value_shift(panSpeedY, 0, abs(lengthdir_y(_len,_dir)) * deltaTimeS);
	if (!firstPress) {
		gameplayTime += deltaTimeS;
	}
}

///Easing
var _len = ds_list_size(flagEaseList);

for (var i=0;i<_len;i++) {
	var _arr = flagEaseList[| i];
	var _x = _arr[0];
	var _y = _arr[1];
	
	var _val = flagEaseGrid[# _x, _y];
	_val = value_shift(_val, flagGrid[# _x, _y], deltaTimeS*3);
	flagEaseGrid[# _x, _y] = _val;
	if (_val == 0 || _val == 1) {
		ds_list_delete(flagEaseList,0);
		i--;
		_len--;
		ds_list_add(updateCellList,[_x,_y]);
	}
}


var _len = ds_list_size(removeEaseList);

for (var i=0;i<_len;i++) {
	var _arr = removeEaseList[| i];
	var _x = _arr[0];
	var _y = _arr[1];
	
	var _val = removeEaseGrid[# _x, _y];
	_val += deltaTimeS*3;
	removeEaseGrid[# _x, _y] = min(_val,1);
	if (_val >= 1) {
		ds_list_delete(removeEaseList,0);
		i--;
		_len--;
		ds_list_add(updateCellList,[_x,_y]);
	}
}


var _len = ds_list_size(mineEaseList);
if (_len > 0) {
	updateDrawing = true;	
}

for (var i=0;i<_len;i++) {
	var _arr = mineEaseList[| i];
	var _x = _arr[0];
	var _y = _arr[1];
	
	var _val = mineEaseGrid[# _x, _y];
	_val += deltaTimeS*3;
	mineEaseGrid[# _x, _y] = min(_val,1);
	if abs(_val - .5) < deltaTimeS*4 {
		scr_pop_bombs_recursive(_x, _y);	
	}
	
	if (_val >= 1) {		
		ds_list_delete(mineEaseList,0);
		i--;
		_len--;
	}
}

if (resetting) {
	var _len = ds_list_size(resetEaseList);
	if (_len > 0) {
		updateDrawing = true;	
	}

	for (var i=0;i<_len;i++) {
		var _arr = resetEaseList[| i];
		var _x = _arr[0];
		var _y = _arr[1];
		var _remove = false;
	
		if (mineGrid[# _x, _y]) {
			var _val = mineEaseGrid[# _x, _y];
			_val -= deltaTimeS*2;
			mineEaseGrid[# _x, _y] = max(_val,0);
			if (_val <= 0) {
				mineGrid[# _x, _y] = false;
				audio_play(aBombDown,0.2);
			}
		} else if (flagGrid[# _x, _y]) {
			var _val = flagEaseGrid[# _x, _y];
			_val -= deltaTimeS*2;
			flagEaseGrid[# _x, _y] = max(_val,0);
			if (_val <= 0) {
				flagGrid[# _x, _y] = false;
				audio_play(aFlagDown,0.2);
			}
		} else if (clearedGrid[# _x, _y]) {
			var _val = removeEaseGrid[# _x, _y];
			_val -= deltaTimeS*2;
			removeEaseGrid[# _x, _y] = max(_val,0);
			if (_val <= 0) {
				clearedGrid[# _x, _y] = false;	
			}
		} else {
			_remove = true;	
		}
	
	
		var _val = aboutToResetGrid[# _x,_y];
		_val += deltaTimeS*3;
		aboutToResetGrid[# _x,_y] = _val;
	
		if abs(_val - .2) < deltaTimeS*4 {
			scr_reset_place_recursive(_x, _y);	
			log(_x,_y);
		}
	
		if (_remove && _val > .4) {
			ds_list_delete(resetEaseList,i);
			i--;
			_len--;		
		}
	}
	if (_len == 0) {
		firstPress = true;	
		ds_grid_clear(aboutToClearGrid,0);
		ds_grid_clear(aboutToResetGrid,0);
		ds_grid_clear(mineEaseGrid,0);
		ds_grid_clear(mineGrid,0);
		ds_grid_clear(nearGrid,0);
		scr_place_mines(gridMines);
		scr_calculate_grid_near();
		won = false;
		lost = false;
		resetting = false;
		wonTimer = 0;
		lostTimer = 0;
		gameplayTime = 0;
		timerX = 0;
		minesLeft = gridMines;
	} else {
		gameplayTime = lerp_time(gameplayTime,0,0.1,deltaTimeS);
		minesLeft = lerp_time(minesLeft,gridMines,0.1,deltaTimeS);
	}
}


if (os_type == os_android && os_is_paused()) {
	redrawFrames = 3;
	if (lost == 0 && won == 0 && resetting == 0 && firstPress == 0) {
		scr_save_grid();
	}
}

saveTimer+= deltaTimeS;
if (saveTimer > 10  && lost == 0 && won == 0 && resetting == 0 && firstPress == 0) {
	scr_save_grid();
	saveTimer = 0;
}


var _len = ds_list_size(toBeCleared);
for (var i=0;i<_len;i++) {
	var _arr = toBeCleared[| i];

	var _time = _arr[2];
	if (gameTime - _time) > 0.05 {
		var _x = _arr[0];
		var _y = _arr[1];
		
		if (!clearedGrid[# _x, _y]) {
			scr_clear_place(_x,_y);
		}

		ds_list_delete(toBeCleared,i);
		i--;
		_len--;
	}
}

if (pitch > 0) {
	pitch-= deltaTimeS*10;
	if (pitch < 0) {
		pitch = 0;	
	}
}


if (_updatedField) {
	var _won = true;
	for (var xx=0;xx<gridWidth;xx++) {
		for (var yy=0;yy<gridHeight;yy++) {
			if (clearedGrid[# xx,yy] == 0 && mineGrid[# xx,yy] == 0) {
				_won = false;
				xx+=gridWidth+1;
				break;
			}
		}
	}
	
	if (_won) {
		won = 1;
	}
}

if (won==1) {
	wonTimer+=deltaTimeS;	
	if (wonTimer > 1) {
		won = 2;
		wonTimer = 0;
			lost = 2;
		if (file_exists("save.sav")) {
			file_delete("save.sav");	
		}
		instance_create_depth(x,y,-10,oMenuGameEnd);
	}
}

if (lost == 1) {	
	lost = 2;
	if (file_exists("save.sav")) {
		file_delete("save.sav");	
	}
	instance_create_depth(x,y,-10,oMenuGameEnd);
	oMenuGameEnd.lost = true;
}
if (lost == 2) {
		
}