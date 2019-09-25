menu = scr_menu_create(0,0,1,1);
menu.depth = depth-1;
menu.alpha = true;
menu.handlesStep = false;


titlebar = instance_create_depth(1,0, depth-2, oMenuSettingsTitlebar);
titlebar.parentMenu = id;

//Created first so it's always clicked first
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.09,0.09);
exitButton = scr_menu_create_button(menu, 0, 0, "   ", "back", 0);
exitButton.visible = false;
titlebar.exitButton = exitButton;




fadeIn = 0;
fadeOut = false;