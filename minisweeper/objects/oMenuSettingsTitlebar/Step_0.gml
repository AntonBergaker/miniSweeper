if parentMenu.menu.y < 0 {
	alphaTimer += deltaTimeS*5;
} else {
	alphaTimer -= deltaTimeS*5;
}

alphaTimer = clamp(alphaTimer,0,1);

var _fadeIn = parentMenu.fadeIn;
var _dpiScale = global.dpiScale;

gearX = oGridControl.gearX;
gearY = oGridControl.gearY;
gearScale = oGridControl.gearScale;
gearRot = oGridControl.gearRot;
gearColor = oGridControl.gearColor;

var _offX = x*global.guiWidth;

gearX = clamp(_offX+40*_dpiScale, 0, gearX);
gearRot = lerp(gearRot, 0, _fadeIn);
gearColor = merge_color(gearColor, global.textColor, _fadeIn);

var _menu = parentMenu.menu;
exitButton.height = (_dpiScale*75) / global.guiHeight;
exitButton.width = (global.guiHeight*exitButton.height)/(_menu.width*global.guiWidth)*1.1;
exitButton.y = -_menu.y + exitButton.height/2;
exitButton.x = -_menu.x/_menu.width + x/_menu.width + exitButton.width/2;
