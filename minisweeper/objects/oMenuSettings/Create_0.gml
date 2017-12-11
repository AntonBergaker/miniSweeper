menu = scr_menu_create(0,0,1,1);
menu.depth = depth-1;
menu.alpha = 0;

scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.3,0.1);

toggleTween = scr_menu_create_toggle(menu,0.8,0.2,"tween",0);
alpha = 0;
fadeIn = 0;