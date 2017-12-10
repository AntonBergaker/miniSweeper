if (file_exists("save.sav")) {
	var _file = file_text_open_read("save.sav");
	var _str;
	var _saveVersion = file_text_read_real(_file);
	file_text_readln(_file);
	gridWidth = file_text_read_real(_file);
	file_text_readln(_file);
	gridHeight = file_text_read_real(_file);
	file_text_readln(_file);
	gridMines = file_text_read_real(_file);
	file_text_readln(_file);
	scr_grid_create_grids();
	
	_str = file_text_read_string(_file);
	file_text_readln(_file);
	ds_grid_read(mineGrid,_str);
	
	_str = file_text_read_string(_file);
	file_text_readln(_file);
	ds_grid_read(clearedGrid,_str);
	
	_str = file_text_read_string(_file);
	file_text_readln(_file);
	ds_grid_read(flagGrid,_str);
	
	gameplayTime = file_text_read_real(_file);
	file_text_readln(_file);
	
	file_text_close(_file);
	
	ds_grid_copy(flagEaseGrid,flagGrid);
	ds_grid_copy(aboutToClearGrid, clearedGrid);
	ds_grid_copy(removeEaseGrid, clearedGrid);
	

	minesLeft = ds_grid_get_sum(mineGrid,0,0,gridWidth-1,gridHeight-1);
	leftToClear = gridWidth*gridHeight - ds_grid_get_sum(clearedGrid,0,0,gridWidth-1,gridHeight-1) - minesLeft;
	minesLeft -= ds_grid_get_sum(flagGrid,0,0,gridWidth-1,gridHeight-1);
}