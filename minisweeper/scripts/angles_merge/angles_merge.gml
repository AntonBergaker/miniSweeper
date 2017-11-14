var _valueCount = argument_count-1;
var _amount = clamp(argument[0], 0, 0.999999999);
var _normal = _amount * (_valueCount-1);
var _valueIndex = floor(_normal)+1;

return angle_lerp(argument[_valueIndex], argument[_valueIndex+1], frac(_normal));