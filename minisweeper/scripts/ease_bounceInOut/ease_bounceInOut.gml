/// @description ease_bounceInOut
/// @param start
/// @param end
/// @param currenttime
/// @param totaltime

var b = argument[0], e = argument[1], //start value, end value
    t = argument[2], d = argument[3], //current time, duration
    c = e - b; //change

if (t < d/2) {return ease_bounceIn(0,c,t*2,d) * .5 + b}
return ease_bounceOut(0,c,t*2-d,d) * .5 + c*.5 + b;
