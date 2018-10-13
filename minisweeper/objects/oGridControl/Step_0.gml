///Check for starting moves
if (!enabled) {
	exit;	
}

if (instance_exists(oMenuGameEnd)) {
	with oMenuGameEnd {
		event_perform(ev_other,ev_user0);	
	}
}

var _in = inputController;

if (firstStep) {
	updateDrawing = true;
	firstStep = false;
}

#region Mouse controls



//Gridpressing
if (locked != LockedState.Locked) {
	for (var i=0;i<5;i++) {
		
		if (locked == LockedState.Unlocked) {
			//Check for starting clicking settings rectangle or switch button
			if (_in.touchAction[i] == TouchAction.None && _in.touchCompleted[i] == false && switchButtonFinger == -1 && settingsButtonFinger == -1) {
				if (_in.touchPressed[i]) {
					var _xx = _in.touchPressXGui[i];
					var _yy = _in.touchPressYGui[i];
				
					var _guiX = global.guiWidth;
					var _guiY = global.guiHeight;

					var _dpiScale = global.dpiScale;
				
					//If settings
					if (point_in_rectangle(_xx, _yy, _guiX-65*_dpiScale, 0, _guiX, 65*_dpiScale)) {
						settingsButtonFinger = i;
						settingsButtonTime = 1;
						settingsButtonFade = 0;
					}
					//If switch
					if (global.showSwitchButton) {
						if (point_distance(_xx, _yy, switchButtonX, switchButtonY)) < 256 * switchButtonScale {
							switchButtonFinger = i;	
							switchButtonTime = 0;
						}
					}
				}
			}
		}
		

		if (_in.touchAction[i] == TouchAction.None) {
			if (locked == LockedState.Unlocked) {
				
			
				//Check holding down for preview
				if (_in.touchPressed[i] && _in.touchAction[i] == TouchAction.None && _in.touchCompleted[i] == false && settingsButtonFinger != i) {
					var _xx = _in.touchX[i];
					var _yy = _in.touchY[i];

					_xx = coord_to_grid_x(_xx);
					_yy = coord_to_grid_y(_yy);
		
					//Check if you released and clicked at the same square
					var _xx2 = coord_to_grid_x(_in.touchPressX[i]);
					var _yy2 = coord_to_grid_y(_in.touchPressY[i]);
						
					if (inside_grid(_xx,_yy)) {
						if (_xx2 == _xx && _yy2 == _yy) {
							if (_in.touchPressTime[i] < 0.3) {
								if (clearedGrid[# _xx, _yy] && nearGrid[# _xx, _yy] > 0) {
									var _nearFlags = scr_get_nearby(flagGrid, _xx, _yy);
									if (_nearFlags == nearGrid[# _xx, _yy]) {
										for (var j=max(_xx-1, 0);j<=min(_xx+1, gridWidth-1);j++) {
											for (var jj=max(_yy-1, 0);jj<=min(_yy+1, gridHeight-1);jj++) {
												if (!flagGrid[# j, jj]) {
													if (previewEaseGrid[# j, jj] <= 0) {
														ds_list_add(previewEaseList, [j, jj]);	
													}
													ds_list_add(previewUpdateList, [j, jj]);
												}
											}
										}
									}
								}
							}
						}
					}
				}
				
				//Check clicking
				if (_in.touchReleased[i]) {
					if (settingsButtonFinger == i || switchButtonFinger == i) {
						var _xx = _in.touchReleaseXGui[i];
						var _yy = _in.touchReleaseYGui[i];
				
						var _guiX = global.guiWidth;
						var _guiY = global.guiHeight;

						var _dpiScale = global.dpiScale;
						
						if (settingsButtonFinger == i) {
							if (point_in_rectangle(_xx, _yy, _guiX-65*_dpiScale, 0, _guiX, 65*_dpiScale)) {
								var _inst = instance_create_layer(0,0, "MenuSettings", oMenuSettings);
								_inst.inGame = true;
								_inst.gridPreLock = locked;
								locked = LockedState.Locked;
							}
						} else {
							if (point_distance(_xx, _yy, switchButtonX, switchButtonY)) < 256 * switchButtonScale {
								global.switchedControls = !global.switchedControls;
							}
							
						}
					} else {
						var _xx = _in.touchReleaseX[i];
						var _yy = _in.touchReleaseY[i];

						_xx = coord_to_grid_x(_xx);
						_yy = coord_to_grid_y(_yy);
		
						//Check if you released and clicked at the same square
						var _xx2 = coord_to_grid_x(_in.touchPressX[i]);
						var _yy2 = coord_to_grid_y(_in.touchPressY[i]);
		
						if (inside_grid(_xx,_yy)) {
							if (_xx2 == _xx && _yy2 == _yy) {
								if (clearedGrid[# _xx, _yy] && _in.touchPressTime[i] < 0.4) {
									var _nearFlags = scr_get_nearby(flagGrid, _xx, _yy);
									if (_nearFlags == nearGrid[# _xx, _yy]) {
										scr_clear_near(_xx,_yy);
										finalPressX = _in.touchReleaseX[i];
										finalPressY = _in.touchReleaseY[i];
									}	
								} else {
									if (global.switchedControls) {
										if (_in.touchPressTime[i] < 0.3) {
											scr_execute_flag(_xx, _yy, i);
										}
									} else {
										if ((_in.touchPressTime[i] < 0.3 - mineGrid[# _xx,_yy]*0.1)) {
											scr_execute_clear(_xx, _yy, i);
										}
									}
								}
							}
						}
					}
				}
			}
		
			//Check pinching
			if (_in.touchPressed[i]) {
				//Check if we have two fingers down
				for (var ii=0;ii<5;ii++) {
					if (ii != i) {
						if (_in.touchPressed[ii]) {
							if (_in.touchAction[ii] == TouchAction.Pan || _in.touchCompleted[ii] == false) {
								_in.touchAction[i]  = TouchAction.Pinch1;
								_in.touchAction[ii] = TouchAction.Pinch2;
								_in.touchCompleted[i]  = true;
								_in.touchCompleted[ii] = true;
							
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
			if (_in.touchPressed[i]) {
				var _xx1 = _in.touchX[i];
				var _yy1 = _in.touchY[i];
				var _xx2 = _in.touchPressX[i];
				var _yy2 = _in.touchPressY[i];
				if (!_in.touchCompleted[i] && _in.touchAction[i] == TouchAction.None) {
	
					if (global.onPhone) {
						var _dpi = global.dpi/7;
					} else {
						var _dpi = 15;
					}
					
					var _timePressed = _in.touchPressTime[i];
					
					if (point_distance(_xx1,_yy1,_xx2,_yy2) > _dpi*(oCamera.width/global.internalWidth) && _timePressed > 0.06) {
						_in.touchAction[i] = TouchAction.Pan;
						lastPanX = _xx2 - oCamera.x;
						lastPanY = _yy2 - oCamera.y;
						_in.touchCompleted[i] = true;
					}
				}
			}
		
			if (locked == LockedState.Unlocked) {
			
				if device_mouse_check_button_pressed(i,mb_right) {
					var _xx = _in.touchX[i];
					var _yy = _in.touchY[i];
		
					_xx = coord_to_grid_x(_xx);
					_yy = coord_to_grid_y(_yy);	
				
					if (inside_grid(_xx,_yy) && !clearedGrid[# _xx, _yy]) {
						scr_flag_cell(_xx,_yy);
					}
				}
		
				//Check holding
				if (_in.touchPressed[i] && !_in.touchCompleted[i] && i!=settingsButtonFinger) {
					if (_in.touchPressTime[i] > 0.4) {
						var _xx = _in.touchX[i];
						var _yy = _in.touchY[i];
		
						_xx = coord_to_grid_x(_xx);
						_yy = coord_to_grid_y(_yy);
			
						var _xx2 = coord_to_grid_x(_in.touchPressX[i]);
						var _yy2 = coord_to_grid_y(_in.touchPressY[i]);
			
						if (_xx2 == _xx && _yy2 == _yy) {
							if (inside_grid(_xx,_yy) && !clearedGrid[# _xx, _yy]) {
								if (global.switchedControls) {
									scr_execute_clear(_xx, _yy, i);
								} else {
									scr_execute_flag(_xx, _yy, i);	
								}
							}
						}
			
						_in.touchCompleted[i] = true;
					}
				}
			}
		}
	}


	///panning
	for (var i=0;i<5;i++) {
		if (_in.touchAction[i] == TouchAction.Pan) {
			var _xx = _in.touchX[i] - oCamera.x;
			var _yy = _in.touchY[i] - oCamera.y;
		
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
			if (_in.touchReleased[i]) {
				for (var ii=1;ii<4;ii++) {
					if (abs(panSpeedX) < abs(panDiffsX[ii])) {
						panSpeedX = panDiffsX[ii];	
					}
					if (abs(panSpeedY) < abs(panDiffsY[ii])) {
						panSpeedY = panDiffsY[ii];	
					}
				}
				panSpeedX = (panSpeedX + array_average(panDiffsX)) / 2;
				panSpeedY = (panSpeedY + array_average(panDiffsY)) / 2;
			}
		}
	}

	//Pinching
	for (var i=0;i<5;i++) {
		if (_in.touchAction[i] == TouchAction.Pinch1 || _in.touchAction[i] == TouchAction.Pinch2) {
			updateDrawing = true;
		
			var _opposite = _in.touchAction[i] == TouchAction.Pinch1 ? TouchAction.Pinch2 : TouchAction.Pinch1;
			var _foundOther = false;
			for (var ii=0;ii<5;ii++) {
				if (ii != i && _in.touchAction[ii] == _opposite) {
					_foundOther = true;
				
					var _normalX = ((_in.touchX[i]-oCamera.x) + (_in.touchX[ii]-oCamera.x)) / (oCamera.width*2);
					var _normalY = ((_in.touchY[i]-oCamera.y) + (_in.touchY[ii]-oCamera.y)) / (oCamera.height*2);
				
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
					
					
					var _maxZoom = min(0.5,72/global.dpi);
					//And don't make it too small
					var _zoomLevel = oCamera.width / global.internalWidth;
	
					if (_zoomLevel < _maxZoom) {
						oCamera.width = global.internalWidth * _maxZoom;
						oCamera.height = oCamera.width / global.displayRatio;
					}
				
					oCamera.x = _mX - oCamera.width * _normalX;
					oCamera.y = _mY - oCamera.height* _normalY;
				
					//Convert the other to a pan
					if (_in.touchReleased[i]) {
						if (!_in.touchReleased[ii]) {
							_in.touchAction[ii] = TouchAction.Pan;
							lastPanX = _in.touchX[ii] - oCamera.x;
							lastPanY = _in.touchY[ii] - oCamera.y;
							_in.touchCompleted[ii] = true;
						}
					}
					else if (_in.touchReleased[ii]) {
						if (!_in.touchReleased[i]) {
							_in.touchAction[i] = TouchAction.Pan;
							lastPanX = _in.touchX[i] - oCamera.x;
							lastPanY = _in.touchY[i] - oCamera.y;
							_in.touchCompleted[i] = true;
						}
					}
				}
			}
			if (!_foundOther) {
				_in.touchAction[i] = TouchAction.None;	
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
}

#endregion

#region Ease control
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

var _len = ds_list_size(previewUpdateList);

for (var i=0;i<_len;i++) {
	var _arr = previewUpdateList[| i];
	var _x = _arr[0];
	var _y = _arr[1];
	
	previewEaseGrid[# _x, _y] += deltaTimeS*12;
}

ds_list_clear(previewUpdateList);

var _len = ds_list_size(previewEaseList);

for (var i=0;i<_len;i++) {
	var _arr = previewEaseList[| i];
	var _x = _arr[0];
	var _y = _arr[1];
	
	var _val = previewEaseGrid[# _x, _y];
	_val -= deltaTimeS*7.5;
	previewEaseGrid[# _x, _y] = clamp(_val,0,1);
	if (_val <= 0) {
		ds_list_delete(previewEaseList,i);
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
				if (!hideOnReset) {
					audio_play(aBombDown,0.2);
				}
			}
		} else if (flagGrid[# _x, _y]) {
			var _val = flagEaseGrid[# _x, _y];
			_val -= deltaTimeS*2;
			flagEaseGrid[# _x, _y] = max(_val,0);
			if (_val <= 0) {
				flagGrid[# _x, _y] = false;
				if (!hideOnReset) {
					audio_play(aFlagDown,0.2);
				}
			}
		} else if (!hideOnReset && clearedGrid[# _x, _y]) {
			var _val = removeEaseGrid[# _x, _y];
			_val -= deltaTimeS*2;
			removeEaseGrid[# _x, _y] = max(_val,0);
			if (_val <= 0) {
				clearedGrid[# _x, _y] = false;	
			}
		} else if (hideOnReset) {
			clearedGrid[# _x, _y] = true;
			var _val = removeEaseGrid[# _x, _y];
			_val += deltaTimeS*2;
			removeEaseGrid[# _x, _y] = min(_val,1);
			if ( min(_val,1) == 1) {
				_remove = true;	
			}
		} else {
			_remove = true;	
		}
	
	
		var _val = aboutToResetGrid[# _x,_y];
		_val += deltaTimeS*3;
		aboutToResetGrid[# _x,_y] = _val;
	
		if abs(_val - .2) < deltaTimeS*4 {
			scr_reset_place_recursive(_x, _y);	
		}
	
		if (_remove && _val > .4) {
			ds_list_delete(resetEaseList,i);
			i--;
			_len--;		
		}
	}
	if (_len == 0 || hideOnResetTimer >= 0.9999) {
		if (hideOnReset) {
			enabled = false;
			locked = LockedState.Unlocked;
			scr_reset_grid();
		}
		firstPress = true;
	}
}

if (firstPress || resetting) {
	gameplayTime = lerp_time(gameplayTime,0,0.1,deltaTimeS);
	minesLeft = lerp_time(minesLeft,gridMines,0.1,deltaTimeS);	
}

if (hideOnReset) {
	hideOnResetTimer += deltaTimeS;
	hideOnResetTimer = clamp(hideOnResetTimer,0,1);
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

#endregion

#region audio
if (minePitch > 0) {
	minePitch-= deltaTimeS*10;
	if (minePitch < 0) {
		minePitch = 0;	
	}
}


///Clearing sounds
for (var i=0; i<ds_list_size(soundsToPlay); i+= 1) {
	var _extracted = 0;
	var _aud = noone;
	
	for (var ii=0;ii<4;ii++) {
		if (i >= ds_list_size(soundsToPlay)) {
			break;	
		}
		if (gameTime - soundsToPlay[| i] > 0.05 - (_extracted*0.0125)) {
			_extracted++;
			ds_list_delete(soundsToPlay,i);
		}
	}
	
	if (_extracted >= 4) {
		_aud = aBleepChord4;
	} else if (_extracted >= 3) {
		_aud = aBleepChord3;
	} else if (_extracted >= 2) {
		_aud = choose(aBleepDouble1, aBleepDouble2, aBleepDouble3);
	} else if (_extracted >= 1) {
		_aud = aBleepFlat;
	}
	
	if _extracted > 0 {
		i--;
		if (random(log10(clearPitch+1)) < 0.1) {
			audio_play(_aud,clamp(0.5 - log10(clearPitch+1),0.1,0.5),random_range(0.8,1.2) + log10(clearPitch+1));
			clearPitch += 0.1*_extracted;
		}
	}
}


clearPitch -= deltaTimeS*5;
if (clearPitch < 0) {
	clearPitch = 0;	
}

//Flag sounds
flagPitchTimer = clamp(flagPitchTimer-deltaTimeS,0,1);
if (flagPitchTimer <= 0) {
	flagPitch -= deltaTimeS * (1+flagPitch);
	flagPitch -= deltaTimeS;
	if (flagPitch <= 0) {
		flagPitch = 0;
		flagPitchRandomOffset = random_range(-.1,.3);
	}
}

#endregion

if ((os_type == os_android || os_type == os_ios) && os_is_paused()) {
	redrawFrames = 3;
	oCamera.forceCheck = 5;
	if (lost == 0 && won == 0 && resetting == 0 && firstPress == 0) {
		scr_save_grid();
	}
}

if (!firstPress && locked == LockedState.Unlocked) {
	gameplayTime += deltaTimeS;
}


saveTimer+= deltaTimeS;
if (saveTimer > 10  && lost == 0 && won == 0 && resetting == 0 && firstPress == 0) {
	scr_save_grid();
	saveTimer = 0;
}

	
if (settingsButtonFinger >= 0) {
	settingsButtonFade = clamp(settingsButtonFade+deltaTimeS*3,0,1)
	if (!_in.touchPressed[settingsButtonFinger]
	  || _in.touchAction[settingsButtonFinger] != TouchAction.None
	  || _in.touchCompleted[settingsButtonFinger]) {
		settingsButtonFinger = -1;
	}
} else {
	settingsButtonFade -= deltaTimeS*3;	
}
if (switchButtonFinger >= 0) {
	switchButtonTime = clamp(switchButtonTime + deltaTimeS*2.4, 0, 0.7);
	
	if (!_in.touchPressed[switchButtonFinger]
	  || _in.touchAction[switchButtonFinger] != TouchAction.None) {
		switchButtonFinger = -1;
	}
} else if (switchButtonTime != -1) {
	switchButtonTime += deltaTimeS*4;
	if (switchButtonTime > 1) {
		switchButtonTime = -1;	
	}
}


switchButtonFlipTime = value_shift(switchButtonFlipTime, global.switchedControls, deltaTimeS*3);

settingsButtonTime -= deltaTimeS;

if (instance_exists(oColorChanger)) {
	updateDrawing = true;	
}

if (won == 0 && leftToClear <= 0 && enabled && !firstPress && lost == 0) {
	finalPressTime = 0;
	finalActive = true;
	finalLost = false;
	won = 1;
}

if finalActive {
	finalPressTime+=deltaTimeS;
	updateDrawing = true;
	if (finalLost && finalPressTime > 3)
	|| (finalPressTime > 8) {
		finalActive = false;	
	}
}


if (won==1) {
	locked = LockedState.InputLocked;
	wonTimer+=deltaTimeS;	
	if (wonTimer > 0.5) {
		won = 2;
		wonTimer = 0;
		lost = 2;
		
		//if (global.saveExists) {
		//	file_delete("game.json");
		//	global.saveExists = false;
		//}
		
		var _newHighscore = false;
		var _str = scr_format_gridstring_unordered(gridWidth, gridHeight, gridMines);
		var _val = ds_map_find_value(global.highScores, _str);
		if (_val == undefined) {
			global.highScores[? _str] = gameplayTime;
			_newHighscore = true;
			scr_save_settings();
		} else if (gameplayTime < _val) {
			ds_map_replace(global.highScores, _str, gameplayTime);
			_newHighscore = true;
			scr_save_settings();
		}
		//Don't show in the menu if timers are disabled that you got a new highscore
		if (global.showTimer == false && global.showTimerMenu == false) {
			_newHighscore = false;
		}
		
		var _layer = layer_get_id("MenuGameEnd");
		if (_layer < 0) {
			_layer = layer_create(100, "MenuGameEnd");
		}
		var _inst = instance_create_layer(0, 0, _layer, oMenuGameEnd);
		_inst.newHighscore = _newHighscore;
		if (_newHighscore) {
			_inst.newHighscoreValue = gameplayTime;	
		}
	}
}

if (lost == 1) {
	finalPressTime = 0;
	finalActive = true;
	finalLost = true;
	locked = LockedState.InputLocked;
	lost = 2;
	
	if (global.saveExists) {
		file_delete("game.json");
		global.saveExists = false;
	}
	
	var _layer = layer_get_id("MenuGameEnd");
	if (_layer < 0) {
		_layer = layer_create(100, "MenuGameEnd");
	}
	instance_create_layer(0, 0, _layer, oMenuGameEnd);
	
	oMenuGameEnd.lost = true;
}


var _change = mouse_wheel_down() - mouse_wheel_up();

if (_change != 0)
	{
	var _normalX = (_in.touchX[0]-oCamera.x)/oCamera.width;
	var _normalY = (_in.touchY[0]-oCamera.y)/oCamera.height;
	
	var _mX = oCamera.x + oCamera.width *_normalX;
	var _mY = oCamera.y + oCamera.height*_normalY;
	
	var _maxZoom = min(0.5,72/global.dpi);
	
	oCamera.width *= (1.1+_change*0.2);
	oCamera.height = oCamera.width/global.displayRatio;
	
	//And don't make it too small
	var _zoomLevel = oCamera.width / global.internalWidth;
	
	if (_zoomLevel < _maxZoom) {
		oCamera.width = global.internalWidth * _maxZoom;
		oCamera.height = oCamera.width / global.displayRatio;
	}
	
	oCamera.x = _mX - oCamera.width  * _normalX;
	oCamera.y = _mY - oCamera.height * _normalY;
	updateDrawing = true;
	
	}