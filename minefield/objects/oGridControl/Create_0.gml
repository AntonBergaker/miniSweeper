gridWidth = 20;
gridHeight = 36;
gridMines = 99;

backColor = c_white;
solidColor = -1
clearedColor = -1
textColor = c_black;
mineColor = -1;

updateDrawing = false;
firstStep = true;

global.darkMode = false;

if (global.darkMode) {
	solidColor = $7E231A;
	clearedColor = $282010;
	textColor = c_white;
	backColor = c_black;
	mineColor = c_white;
}

mineGrid = ds_grid_create(gridWidth, gridHeight);
clearedGrid = ds_grid_create(gridWidth, gridHeight);
flagGrid = ds_grid_create(gridWidth, gridHeight);
nearGrid = ds_grid_create(gridWidth, gridHeight);

aboutToClearGrid = ds_grid_create(gridWidth, gridHeight);

flagEaseGrid = ds_grid_create(gridWidth, gridHeight);
removeEaseGrid = ds_grid_create(gridWidth, gridHeight);
mineEaseGrid = ds_grid_create(gridWidth, gridHeight);

aboutToResetGrid = ds_grid_create(gridWidth, gridHeight);

flagEaseList = ds_list_create();
removeEaseList = ds_list_create();
mineEaseList = ds_list_create();
resetEaseList = ds_list_create();

lastPanX = 0;
lastPanY = 0;
panSpeedX = 0;
panSpeedY = 0;

redrawFrames = 0;

won = 0;
wonTimer = 0;

lost = 0;
lostTimer = 0;

resetting = 0;

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

scr_place_mines(gridMines);
scr_calculate_grid_near();

firstPress = true;
gameTime = 0;

toBeCleared = ds_list_create();


ds_grid_clear(clearedGrid,0);

scr_mouse_init();

enum TouchAction {
	None,
	Pan,
	Pinch1,
	Pinch2
}

instance_create_depth(0,0,0,oCamera);