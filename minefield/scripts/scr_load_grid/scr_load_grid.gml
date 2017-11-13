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
	file_text_close(_file);
	
	ds_grid_copy(flagEaseGrid,flagGrid);
	ds_grid_copy(aboutToClearGrid, clearedGrid);
	ds_grid_copy(removeEaseGrid, clearedGrid);
}