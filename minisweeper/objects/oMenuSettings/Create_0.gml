menu = scr_menu_create(0,0,1,1);
menu.depth = depth-1;
menu.alpha = 0;

tMinesFive = "5 Left";
tMinesAlways = "Always";
tMinesNever = "Never";

scr_menu_set_button_settings(menu,fa_left,fa_middle,fLightMenu,0.8,0.05);
var i=1.5;

textTween       = scr_menu_create_label(menu, 0.07, 0.1*i++, "Animations");
textInstant     = scr_menu_create_label(menu, 0.07, 0.1*i++, "Clear Animation");
textTimer       = scr_menu_create_label(menu, 0.07, 0.1*i++, "Show Timer");
textTimerMenu   = scr_menu_create_label(menu, 0.07, 0.1*i  , "Show Highscore");

i+=0.8;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.05);
textSlider = scr_menu_create_label(menu, 0.5, 0.1*i, "Theme");
i+=0.7;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.09);
themeSlider = scr_menu_create_slider(menu, 0.5, 0.1*i, true, global.themeNames, global.currentTheme, "Default")

i++;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.05);
textSlider = scr_menu_create_label(menu, 0.5, 0.1*i, "Show Mines Left");
i+=0.7;

if (global.showMines == ShowMinesState.Always) {
	var _mineStr = tMinesAlways;	
} else if (global.showMines == ShowMinesState.Never) {
	var _mineStr = tMinesNever;	
} else {
	var _mineStr = tMinesFive;	
}

scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.09);
showMineSlider = scr_menu_create_slider(menu, 0.5, 0.1*i++, true, [tMinesAlways, tMinesFive, tMinesNever],_mineStr, tMinesAlways)


i+=0.4;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.5,0.09);
exitButton = scr_menu_create_button(menu, 0.5, 0.1*i++, "Back", "back", 0);

scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.2,0.08);
var i=1.5;
toggleTween     = scr_menu_create_toggle(menu,0.8,0.1*i++,"tween"    , global.tweenEnabled);
toggleInstant   = scr_menu_create_toggle(menu,0.8,0.1*i++,"instant"  , global.clearAnimation);
toggleTimer     = scr_menu_create_toggle(menu,0.8,0.1*i++,"timer"    , global.showTimer);
toggleTimerMenu = scr_menu_create_toggle(menu,0.8,0.1*i++,"timermenu", global.showTimerMenu);
alpha = 0;
fadeIn = 0;
fadeOut = false;