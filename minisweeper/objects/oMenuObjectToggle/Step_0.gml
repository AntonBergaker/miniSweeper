event_inherited();

if (lastH != height || lastW != width || lastX != x || lastY != y) {
	lastX = x;
	lastY = y;
	lastWidth = width;
	lastHeight = height;
	scr_calculate_button_area();
}

clickedFade -= deltaTimeS*3;
checkedTimer = value_shift(checkedTimer, checked, deltaTimeS*3);