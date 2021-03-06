global.themes = ds_map_create();

var _theme;

_theme = scr_theme_create(
	"Default",
	c_white,
	$53C800,
	$CAF6B9,
	$333333,
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
	c_white,
	$205E1B,
	c_white,
	$222222
);
ds_map_add(global.themes, _theme[? "name"], _theme);


_theme = scr_theme_create(
	"Red",
	c_white,
	$3539E5,
	$DDDDDD,
	c_black,
	c_white,
	c_black,
	$3539E5,
	c_white,
	$eeeeee
);
ds_map_add(global.themes, _theme[? "name"], _theme);


_theme = scr_theme_create(
	"Contrast",
	c_white,
	c_black,
	$dddddd,
	c_black,
	c_white,
	c_white,
	c_black,
	c_white,
	$ffffff
);
ds_map_add(global.themes, _theme[? "name"], _theme);


_theme = scr_theme_create(
	"Night",
	c_black,
	$222222,
	c_black,
	$dddddd,
	c_black,
	c_white,
	$aaaaaa,
	$dddddd,
	$333333
);
ds_map_add(global.themes, _theme[? "name"], _theme);



_theme = scr_theme_create(
	"Mini",
	c_white,
	$53C800,
	c_white,
	$333333,
	c_black,
	c_black,
	$49E047,
	c_white,
	$eeeeee
);
ds_map_add(global.themes, _theme[? "name"], _theme);



global.themeNames = ["Default", "Dark", "Red", "Contrast", "Night", "Mini"];