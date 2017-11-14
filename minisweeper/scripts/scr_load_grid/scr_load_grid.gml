if (file_exists("save.sav")) {
	var _file = file_text_open_read("save.sav");
	var _str;
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
	
	gridWidth = ds_grid_width(mineGrid);
	gridHeight = ds_grid_height(mineGrid);
	minesLeft = ds_grid_get_sum(mineGrid,0,0,gridWidth-1,gridHeight-1) - ds_grid_get_sum(flagGrid,0,0,gridWidth-1,gridHeight-1);
}