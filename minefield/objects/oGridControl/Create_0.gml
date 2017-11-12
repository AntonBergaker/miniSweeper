gridWidth = 60;
gridHeight = 60;

mineGrid = ds_grid_create(gridWidth, gridHeight);
clearedGrid = ds_grid_create(gridWidth, gridHeight);
flagGrid = ds_grid_create(gridWidth, gridHeight);
nearGrid = ds_grid_create(gridWidth, gridHeight);


lastPanX = 0;
lastPanY = 0;
panSpeedX = 0;
panSpeedY = 0;

for (var i=4;i>=0;i--) {
	panDiffsX[i] = 0;
	panDiffsY[i] = 0;
}

mip = 1;
mipInv = 1/mip;


for (var xx=0;xx<gridWidth;xx++) {
	for (var yy=0;yy<gridHeight;yy++) {
		mineGrid[# xx,yy] = choose(1,0,0,0,0);
	}
}

for (var xx=0;xx<gridWidth;xx++) {
	for (var yy=0;yy<gridHeight;yy++) {
		if (!mineGrid[# xx,yy]) {
			nearGrid[# xx,yy] = scr_get_nearby(mineGrid,xx,yy);
		}
	}
}

ds_grid_clear(clearedGrid,0);

for (var i=4;i>=0;i--) {
	touchX[i] = 0;
	touchY[i] = 0;
	touchPressed[i] = 0;
	touchReleased[i] = 0;
	touchPressX[i] = 0;
	touchPressY[i] = 0;
	touchReleaseX[i] = 0;
	touchReleaseY[i] = 0;
	touchPressTime[i] = 0;
	touchCompleted[i] = 0;
	touchAction[i] = TouchAction.None;
}

enum TouchAction {
	None,
	Pan,
	Pinch1,
	Pinch2
}

instance_create_depth(x,y,0,oCamera);