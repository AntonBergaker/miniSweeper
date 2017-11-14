/// @description ease_expoInOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime

var b = argument0, e = argument1, //start value, end value
    t = argument2, d = argument3, //current time, duration
    c = e - b; //change

t /= d/2;
if (t < 1) {return c/2 * power(2, 10 * (t - 1)) + b};
t--;
return c/2 * (-power(2, -10 * t) + 2) + b;
