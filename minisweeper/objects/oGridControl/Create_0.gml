gridWidth = global.gridWidth;
gridHeight = global.gridHeight;
gridMines = global.mineCount;

pitch = 0;

enabled = false;
locked = false;

updateDrawing = false;
firstStep = true;

instance_create_depth(0,0,0,oCamera);

//If a save exists import it
if (file_exists("save.sav")) {
	scr_load_grid();
	firstPress = false;
} else {
	scr_grid_create_grids();
	firstPress = true;
	minesLeft = gridMines;
	leftToClear = gridWidth * gridHeight - gridMines;
}

lastPanX = 0;
lastPanY = 0;
panSpeedX = 0;
panSpeedY = 0;

redrawFrames = 0;

won = 0;
wonTimer = 0;


lost = 0;
lostTimer = 0;

timerX = 0;
minesX = 0;
minesGuiBounce = 0;

gameplayTime = 0;

resetting = 0;
hideOnReset = false;
hideOnResetTimer = 0;

fieldWidth  = gridWidth*160 + 50;
fieldHeight = gridHeight*160+ 50;

pinchStartDistance = 0;
pinchStartScale = 0;

for (var i=4;i>=0;i--) {
	panDiffsX[i] = 0;
	panDiffsY[i] = 0;
}

mip = 1;
mipScale = power(2,mip);

surf = -1;


saveTimer = 0;

gameTime = 0;

toBeCleared = ds_list_create();


scr_mouse_init();

enum TouchAction {
	None,
	Pan,
	Pinch1,
	Pinch2
}


scr_calculate_grid_near();
