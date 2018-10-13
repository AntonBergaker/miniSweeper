///@param x0
///@param y0
///@param x1
///@param y1
///@param color
///@param alpha

var _x0 = round(argument0);
var _y0 = round(argument1);
var _x1 = round(argument2);
var _y1 = round(argument3);
var _color = argument4;
var _alpha = argument5;

var _width  = _x1 - _x0;
var _height = _y1 - _y0;

var _cornerScale = min(_width, _height)/270;
var _cOff = 64*_cornerScale;

var _rX0 = _x0 + _cOff;
var _rX1 = _x1 - _cOff;
var _rY0 = _y0 + _cOff;
var _rY1 = _y1 - _cOff;

draw_sprite_ext(sButtonCorner, 0, _rX0, _rY0, _cornerScale, _cornerScale, 90, _color, _alpha);
draw_sprite_ext(sButtonCorner, 0, _rX1, _rY0, _cornerScale, _cornerScale, 0, _color, _alpha);
draw_sprite_ext(sButtonCorner, 0, _rX1, _rY1, _cornerScale, _cornerScale, 270, _color, _alpha);
draw_sprite_ext(sButtonCorner, 0, _rX0, _rY1, _cornerScale, _cornerScale, 180, _color, _alpha);

var _mX = (_x0 + _x1)/2
var _mY = (_y0 + _y1)/2


draw_sprite_ext(sButtonMiddle, 0, _mX, _mY, (_width)/256, (_rY1 - _rY0)/256, 0, _color, _alpha);

draw_sprite_ext(sButtonMiddle, 0, _mX, (_y0 + _rY0)/2, (_rX1 - _rX0)/256, (_y0 - _rY0)/256, 0, _color, _alpha);
draw_sprite_ext(sButtonMiddle, 0, _mX, (_y1 + _rY1)/2, (_rX1 - _rX0)/256, (_y0 - _rY0)/256, 0, _color, _alpha);
