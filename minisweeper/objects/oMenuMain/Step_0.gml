var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();


var _ratio = _guiW/_guiH;

if (_ratio) > 0.6 {
	menu.width = 0.6/_ratio;
	menu.height = 1;
} else {
	menu.width = 1;
	menu.height = 1;
}
	
if (fadeIn) {
	fadeInTimer+=deltaTimeS;
	if (fadeInTimer >= 1) {
		fadeIn = false;
		fadeInInit = false;
	}
}

if (fadeOut) {
	fadeOutTimer+=deltaTimeS*1.5;
	if (fadeOutTimer >= 1) {
		instance_destroy();	
		exit;
	}
}

var _result = global.highScores[? scr_format_gridstring_unordered(global.gridWidth, global.gridHeight, global.mineCount)];
if (_result == undefined) {
	bestTimeTimer -= deltaTimeS*3;
} else {
	recordLabel.text = scr_get_formatted__time( _result);
	bestTimeTimer += deltaTimeS*3;
}

bestTimeTimer = clamp(bestTimeTimer,0,1);

if (global.presetGrid) {
	customTimer -= deltaTimeS;
} else {
	customTimer += deltaTimeS;	
}

var _minePercent = clamp(round((100*global.mineCount)/(global.gridWidth*global.gridHeight)),0,100);
minesLabel.text = string(_minePercent) + "%*";

customTimer = clamp(customTimer,0,1);

recordLabel.x     = ease_quadOut(-0.1,0.15, bestTimeTimer, 1);
recordLabel.alpha = ease_quadIn (0,1, clamp(bestTimeTimer,0,0.2),0.2)

var _ease = ease_quadInOut(0,1,customTimer, 1);

var _mTimer = clamp(customTimer*3 - 2,0,1);
minesLabel.x     = ease_quadOut(1.1, 0.85, _mTimer, 1);
minesLabel.alpha = ease_quadIn (0,1, clamp(_mTimer,0,0.2),0.2)

playButton.y	 = lerp(playButtonY    , playButtonYCustom    , _ease);
nameLabel.y		 = lerp(nameLabelY     , nameLabelYCustom     , _ease);
recordLabel.y	 = lerp(recordLabelY   , recordLabelYCustom   , _ease);
minesLabel.y	 = lerp(minesLabelY	   , minesLabelYCustom    , _ease);
settingsButton.y = lerp(settingsButtonY, settingsButtonYCustom, _ease);
sizeToggle.y	 = lerp(sizeToggleY	   , sizeToggleYCustom    , _ease);

heightSelection.alpha = lerp(0,1,_ease);
widthSelection.alpha  = lerp(0,1,_ease);
mineSelection.alpha   = lerp(0,1,_ease);

sizeSelection.alpha   = lerp(1,0,_ease);

sliderWidthLabel.alpha   = lerp(0,0.7,_ease);
sliderHeightLabel.alpha  = lerp(0,0.7,_ease);
sliderMineLabel.alpha    = lerp(0,0.7,_ease);

sizeToggle.text = global.presetGrid ? "Custom" : "Preset"


if (customTimer) < 1  {
	sizeSelection.enabled = true;
} else {
	sizeSelection.enabled = false;	
}
if (customTimer > 0) {
	widthSelection.enabled = true;
	heightSelection.enabled = true;
	mineSelection.enabled = true;
} else {
	widthSelection.enabled = false;
	heightSelection.enabled = false;
	mineSelection.enabled = false;
}


alpha = 1;
if (fadeIn) {
	alpha *= fadeInTimer;	
}
if (fadeOut) {
	alpha *= (1-fadeOutTimer);	
}

menu.alpha = alpha;
menu.x = 0.5-menu.width/2;
menu.y = 0.5-menu.height/2;