/// @description ease_bounceOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime

var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b; //change

t/=d;
if (t < (1/2.75)) 
    {
    return c*(7.5625*t*t) + b;
    }
else if (t < (2/2.75)) 
    {
    t-=(1.5/2.75);
    return c*(7.5625*(t)*t + .75) + b;
    }
else if (t < (2.5/2.75)) 
    {
    t-=(2.25/2.75);
    return c*(7.5625*(t)*t + .9375) + b;
    } 
else 
    {
    t-=(2.625/2.75);
    return c*(7.5625*(t)*t + .984375) + b;
    }
