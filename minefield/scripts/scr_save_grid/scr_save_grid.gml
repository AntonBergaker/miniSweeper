if (file_exists("save.sav")) {
	file_delete("save.sav");	
}
var _file = file_text_open_write("save.sav");
file_text_write_string(_file,ds_grid_write(mineGrid));
file_text_writeln(_file);
file_text_write_string(_file,ds_grid_write(clearedGrid));
file_text_writeln(_file);
file_text_write_string(_file,ds_grid_write(flagGrid));
file_text_close(_file);