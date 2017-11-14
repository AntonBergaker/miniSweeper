/// @description ease_quadIn
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime
var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b; //change

t /= d;
return c*t*t + b;
