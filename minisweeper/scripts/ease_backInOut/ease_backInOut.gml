/// @description ease_backInOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime
/// @param overshoot
var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b, //change
    s = argument[4]; //overshoot

s*=1.525; t /= d/2;
if t < 1 
    {
    return c/2*(t*t*(((s)+1)*t - s)) + b;
    }
t-=2;
return c/2*((t)*t*(((s)+1)*t + s) + 2) + b;
