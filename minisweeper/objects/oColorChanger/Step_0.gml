time+=deltaTimeS*2;

if time > 1 {
	time = 1;	
}

global.backColor    = merge_color(backColorStart   ,backColorEnd   , time);
global.buttonColor  = merge_color(buttonColorStart ,buttonColorEnd , time);
global.solidColor   = merge_color(solidColorStart  ,solidColorEnd  , time);
global.textColor    = merge_color(textColorStart   ,textColorEnd   , time);
global.clearedColor = merge_color(clearedColorStart,clearedColorEnd, time);
global.mineColor    = merge_color(mineColorStart   ,mineColorEnd   , time);
global.flagColor    = merge_color(flagColorStart   ,flagColorEnd   , time);
global.cardColor    = merge_color(cardColorStart   ,cardColorEnd   , time);

if time >= 1 {
	instance_destroy();
}