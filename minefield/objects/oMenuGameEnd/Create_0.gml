scr_mouse_init();

height = 700;
width = 700;
timer = 0;

var _guiX = display_get_gui_width ();
var _guiY = display_get_gui_height();

t_lost = "You Lost";
t_won = "You Won";

t_retry = "Retry";
t_again = "Again";

lost = false;

firstStep = true;

//spawn outside the screen
startY = _guiY + height/2

targetY = _guiY/2;