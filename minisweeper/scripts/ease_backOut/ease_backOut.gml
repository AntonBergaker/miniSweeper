/// @description ease_backOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime
/// @param overshoot
var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b, //change
    s = argument[4]; //overshoot

t = t/d-1;
return c*((t)*t*((s+1)*t + s) + 1) + b;