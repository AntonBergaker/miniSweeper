event_inherited();

if (lastH != height || lastW != width || lastX != x || lastY != y) {
	lastX = x;
	lastY = y;
	lastWidth = width;
	lastHeight = height;
	updatedDraw = true;
	scr_calculate_button_area();
}
