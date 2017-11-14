/// @description ease_quadInOut_peek
/// @param start
/// @param end
/// @param currenttime
/// @param peek
/// @param totaltime


var var_start = argument0;
var var_end = argument1;
var var_current = argument2;
var var_peek = argument3;
var var_total = argument4; 

if var_current < var_peek
    {return ease_quadInOut(var_start, var_end,var_current,var_peek)}
else
    {return ease_quadInOut(var_end, var_start,var_current-var_peek,var_total-var_peek)}
