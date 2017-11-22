global.themes = ds_map_create();

var _theme;

_theme = scr_theme_create(
	"Default",
	c_white,
	$53C800,
	$CAF6B9,
	c_black,
	c_black,
	$49E047,
	c_white,
	$eeeeee
);

ds_map_add(global.themes, _theme[? "name"], _theme);

_theme = scr_theme_create(
	"Dark",
	c_black,
	$205E1B,
	$232323,
	c_white,
	c_white,
	$205E1B,
	c_white,
	$222222
);
ds_map_add(global.themes, _theme[? "name"], _theme);