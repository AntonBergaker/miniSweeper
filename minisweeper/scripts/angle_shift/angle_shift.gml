/// @param current_angle
/// @param target_angle
/// @param speed


var _angle = argument[0] mod 360;
var _target_angle = argument[1] mod 360;

if abs(angle_difference(_angle, _target_angle)) < argument[2] {
    _angle = _target_angle
}
else {
    _angle += sign(angle_difference(_angle, _target_angle)) * -argument[2]
}
    
return _angle;
