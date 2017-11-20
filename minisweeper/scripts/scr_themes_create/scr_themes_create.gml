global.themes = ds_map_create();

var _theme;

_theme = scr_theme_create(
	"Default",
	c_white,
	$53C800,
	$CAF6B9,
	c_black,
	c_black,
	$49E047
);

ds_map_add(global.themes, _theme[? "name"], _theme);

_theme = scr_theme_create(
	"Dark",
	$7E231A,
	$282010,
	c_white,
	c_black,
	c_white,
	c_gray
);
ds_map_add(global.themes, _theme[? "name"], _theme);