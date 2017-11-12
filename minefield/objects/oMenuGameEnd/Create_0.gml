scr_mouse_init();

height = 700;
width = 700;
timer = 0;

var _guiX = display_get_gui_width ();
var _guiY = display_get_gui_height();




firstStep = true;

//spawn outside the screen
startY = _guiY + height/2

targetY = _guiY/2;