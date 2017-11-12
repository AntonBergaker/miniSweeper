for (var xx=0;xx<gridWidth;xx++) {
	for (var yy=0;yy<gridHeight;yy++) {
		if (!mineGrid[# xx,yy]) {
			nearGrid[# xx,yy] = scr_get_nearby(mineGrid,xx,yy);
		}
	}
}