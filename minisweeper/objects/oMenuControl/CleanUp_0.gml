if (!cleanedUp) {
	cleanedUp = true;
	scr_list_instance_destroy(buttons);
	scr_list_instance_destroy(labels);
	scr_list_instance_destroy(sprites);
	scr_list_instance_destroy(sliders);
}