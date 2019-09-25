menu = scr_menu_create(0,0,1,1);
menu.depth = depth-1;
menu.alpha = 0;
menu.handlesStep = false;


tMinesFive = "5 Left";
tMinesAlways = "Always";
tMinesNever = "Never";

inGame = false;
gridPreLock = LockedState.Unlocked;


menuOffsetY = 0;
lastPanY = 0;
panSpeedY = 0;

for (var i=4;i>=0;i--) {
	panDiffsY[i] = 0;
}

menuHeight = 2;

var i=2;

//If you're not in the menu
inMenu = instance_exists(oMenuMain) && oMenuMain.fadeOut = false;

titlebar = instance_create_depth(inMenu ? 0:1,0, depth-2, oMenuSettingsTitlebar);
titlebar.parentMenu = id;

//Created first so it's always clicked first
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.09,0.09);
exitButton = scr_menu_create_button(menu, 0, 0, "   ", "back", 0);
exitButton.visible = false;
titlebar.exitButton = exitButton;

if (!inMenu) {
	var _record = -1;
	var _str = scr_format_gridstring_unordered(oGridControl.gridWidth, oGridControl.gridHeight, oGridControl.gridMines);
	var _val = ds_map_find_value(global.highScores, _str);
	if (_val != undefined) {
		_record = _val;	
	}
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.07,0.07);
	flagSprite = scr_menu_create_sprite(menu, 0.16, 0.1*i, 0.1, 0.1, sFlag, ThemeColors.Text);
	squareSprite = scr_menu_create_sprite(menu, 0.66, 0.1*i-0.021, 0.05, 0.05, sSquare, ThemeColors.Solid);
	
	timerSprite = scr_menu_create_sprite(menu, 0.16, 0.1*i+0.085, 0.068, 0.068, sClock, ThemeColors.Text);
	
	if (_record >= 0) {
		recordSprite = scr_menu_create_sprite(menu, 0.66, 0.1*i+0.085, 0.068, 0.068, sStar, ThemeColors.Text);
	} else {
		recordSprite = noone;	
	}
	
	var _str;
	_str = string(round(oGridControl.gridMines-oGridControl.minesLeft)) + "/" + string(oGridControl.gridMines);
	scr_menu_set_button_settings(menu,fa_left,fa_middle,fLightMenu,0.3,0.06);
	flagLabel = scr_menu_create_label(menu, 0.225, 0.1*i-0.02, _str);
	
	var _val = oGridControl.firstPress || oGridControl.resetting ?
		100 :
		ceil(100 * oGridControl.leftToClear / (oGridControl.gridWidth * oGridControl.gridHeight - oGridControl.gridMines));
	_str = string(_val)+"%";
	squareLabel = scr_menu_create_label(menu, 0.735, 0.1*i-0.02, _str);
	
	_str = scr_get_formatted_time(oGridControl.gameplayTime);
	_str += string_delete( string(oGridControl.gameplayTime mod 1), 1, 1);	

	scr_menu_set_button_settings(menu,fa_left,fa_middle,fLightMenu,0.28,0.06);
	timerLabel = scr_menu_create_label(menu, 0.225, 0.1*i+0.09, _str);
	
	if (_record >= 0) {
		_str = scr_get_formatted_time(_record);
		_str += string_delete( string(_record mod 1), 1, 1);
		recordLabel = scr_menu_create_label(menu, 0.735, 0.1*i+0.09, _str);
	} else {
		recordLabel = noone;	
	}
	i+=2.4;
	
	
	scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.5,0.09);
	menuButton = scr_menu_create_button(menu, 0.5, 0.1*i, "Menu", "menu", 1);
	i+=0.9;
	
	splitSprite = scr_menu_create_sprite(menu, 0.5, 0.1*i, 1, 0.01, sSliderLine, ThemeColors.Text);
	i+=1.2;
} else {
	titlebar.alpha = 0;
	titlebar.inMenu = true;
}


i+=0.8;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.05);
textSlider = scr_menu_create_label(menu, 0.5, 0.1*i, "Theme");
i+=0.7;
scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.8,0.09);
themeSlider = scr_menu_create_slider(menu, 0.5, 0.1*i, true, global.themeNames, global.currentTheme, "Default")

i+=1.4;


scr_menu_set_button_settings(menu,fa_left,fa_middle,fLightMenu,0.6,0.08);
buttonControls = scr_menu_create_button(menu, 0.3+0.07, 0.1*i++, "CHANGE CONTROLS...", "controls", false);
buttonControls.textScale = 0.05/0.08;

i+=0.2;

var _toggleStart = i;


scr_menu_set_button_settings(menu,fa_left,fa_middle,fLightMenu,0.6,0.05);

textAudio       = scr_menu_create_label(menu, 0.07, 0.1*i++, "Audio");
if (global.onPhone) {
	textVibrations  = scr_menu_create_label(menu, 0.07, 0.1*i++, "Vibrations");
}
textTween        = scr_menu_create_label(menu, 0.07, 0.1*i++, "Animations");
textInstant      = scr_menu_create_label(menu, 0.07, 0.1*i++, "Clear Animation");
textTimer        = scr_menu_create_label(menu, 0.07, 0.1*i++, "Show Timer");
textTimerMenu    = scr_menu_create_label(menu, 0.07, 0.1*i++, "Show Highscore");



scr_menu_set_button_settings(menu,fa_center,fa_middle,fLightMenu,0.2,0.08);


var i=_toggleStart;
toggleAudio     = scr_menu_create_toggle(menu,0.8,0.1*i++,"audio"    , global.audioVolume);
if (global.onPhone) {
	toggleVibration = scr_menu_create_toggle(menu,0.8,0.1*i++,"vibrate"  , global.vibrate);
}
toggleTween        = scr_menu_create_toggle(menu,0.8,0.1*i++,"tween"         , global.tweenEnabled);
toggleInstant      = scr_menu_create_toggle(menu,0.8,0.1*i++,"instant"       , global.clearAnimation);
toggleTimer        = scr_menu_create_toggle(menu,0.8,0.1*i++,"timer"         , global.showTimer);
toggleTimerMenu    = scr_menu_create_toggle(menu,0.8,0.1*i++,"timermenu"     , global.showTimerMenu);

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

menuHeight = i*0.1;

alpha = 0;
fadeIn = 0;
fadeOut = false;