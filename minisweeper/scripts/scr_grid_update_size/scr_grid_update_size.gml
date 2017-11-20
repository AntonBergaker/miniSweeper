gridWidth = global.gridWidth;
gridHeight = global.gridHeight;
gridMines = global.mineCount;

ds_grid_resize(aboutToClearGrid,gridWidth,gridHeight);
ds_grid_resize(aboutToResetGrid,gridWidth,gridHeight);
ds_grid_resize(clearedGrid,gridWidth,gridHeight);
ds_grid_resize(mineEaseGrid,gridWidth,gridHeight);

ds_grid_resize(removeEaseGrid,gridWidth,gridHeight);
ds_grid_resize(flagEaseGrid,gridWidth,gridHeight);
ds_grid_resize(flagGrid,gridWidth,gridHeight);
ds_grid_resize(mineGrid,gridWidth,gridHeight);
ds_grid_resize(nearGrid,gridWidth,gridHeight);

fieldWidth  = gridWidth*160 + 50;
fieldHeight = gridHeight*160+ 50;
minesLeft = gridMines;