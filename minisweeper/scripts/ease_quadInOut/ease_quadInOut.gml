/// @description ease_quadInOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime
var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b; //change

t /= d/2;
if (t < 1) {return c/2*t*t + b};
t--;
return -c/2 * (t*(t-2) - 1) + b;
