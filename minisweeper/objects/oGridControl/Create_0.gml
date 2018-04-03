gridWidth = global.gridWidth;
gridHeight = global.gridHeight;
gridMines = global.mineCount;

//a list keeping track of how many clearing sounds to play and when
soundsToPlay = ds_list_create();

//a list keeping track of current sounds playing so we don't play too loudly

clearPitch = 0;

flagPitch = 0;
flagPitchTimer = 0;
flagPitchRandomOffset = 0;

minePitch = 0;

enabled = false;
locked = LockedState.Unlocked;

updateDrawing = false;
firstStep = true;

gameplayTime = 0;
inputController = instance_create_depth(0,0,0,oInput);
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

previewUpdateList = ds_list_create();

lastPanX = 0;
lastPanY = 0;
panSpeedX = 0;
panSpeedY = 0;

for (var i=4;i>=0;i--) {
	panDiffsX[i] = 0;
	panDiffsY[i] = 0;
}

redrawFrames = 0;

won = 0;
wonTimer = 0;


lost = 0;
lostTimer = 0;

timerX = 0;
minesX = 0;
minesGuiBounce = 0;

resetting = 0;
hideOnReset = false;
hideOnResetTimer = 0;

fieldWidth  = gridWidth*160 + 50;
fieldHeight = gridHeight*160+ 50;

pinchStartDistance = 0;
pinchStartScale = 0;

settingsButtonFinger = -1;
settingsButtonTime = 0;
settingsButtonFade = 0;

mip = 1;
mipScale = power(2,mip);

surf = -1;

finalActive = false;
finalPressX = 0;
finalPressY = 0;
finalPressTime = 0;

saveTimer = 0;

gameTime = 0;

toBeCleared = ds_list_create();

gearX = 0;
gearY = 0;
gearScale = 1;
gearRot = 0;
gearColor = c_white;

enum TouchAction {
	None,
	Pan,
	MenuPan,
	Pinch1,
	Pinch2,
	Slider
}

enum LockedState {
	Locked,
	Unlocked,
	InputLocked
}

scr_calculate_grid_near();
