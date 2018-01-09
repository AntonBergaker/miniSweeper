height = 700;
width = 700;
timer = 0;

var _guiX = global.guiWidth;
var _guiY = global.guiHeight;

t_lost = "You Lost";
t_won = "You Won";

t_retry = "Retry";
t_again = "Again";

lost = false;
destroy = false;
destroyTimer = false;

introTimer = 2;

firstStep = true;

//spawn outside the screen
startY = _guiY + height/2

targetY = _guiY/2;

menu = scr_menu_create(-1,-1,0.6,0.6);
menu.depth = depth-1;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.5,0.17)
playButton = scr_menu_create_button(menu,0.5,0.55,lost ? t_retry : t_again,"retry",true);

settingsButton = scr_menu_create_button(menu,0.5,0.73,"Menu","menu",false);
	
scr_menu_set_button_settings(menu,fa_center,fa_middle,fThinMenu,0.55,0.13)
nameLabel = scr_menu_create_label(menu, 0.5, 0.22, lost ? t_lost : t_won);

backGround = scr_menu_create_sprite(menu, 0.5,0.45,1.7,1.7,sBigBox, ThemeColors.Card);