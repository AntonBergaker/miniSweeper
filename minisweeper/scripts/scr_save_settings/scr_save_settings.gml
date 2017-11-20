var _map = ds_map_create();
var _gridSize = ds_map_create();
	ds_map_add(_gridSize, "width" , global.gridWidth);
	ds_map_add(_gridSize, "height", global.gridHeight);
	ds_map_add(_gridSize, "mines" , global.mineCount);
ds_map_add_map(_map,"grid_size",_gridSize)

var _highScores = ds_map_create();
	ds_map_copy(_highScores, global.highScores);
ds_map_add_map(_map, "highscores" , _highScores)

if (file_exists("save.json")) {
	file_delete("save.json");	
}
var _file = file_text_open_write("save.json");
file_text_write_string(_file,json_encode(_map));
file_text_close(_file);

ds_map_destroy(_map);