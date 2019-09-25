var _guiW = global.guiWidth;
var _guiH = global.guiHeight;

var _x0 = ease_quadInOut(menu.x * _guiW, 0, fadeIn, 1);
var _x1 = _guiW

draw_sprite_ext(sDropshadow, 0, _x0, _guiH/2, (_x1-_x0)/120, _guiH/256, 180, c_white, 1);
draw_rect_color(_x0, 0, _x1, _guiH, global.backColor, 1);