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
updateCellList = ds_list_create();