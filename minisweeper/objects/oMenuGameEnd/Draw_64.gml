if !firstStep {
	draw_sprite(sBigBox,0,x,y);
	
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fMineTextMip0);
	if (lost) {
		draw_text(x,y-110,t_lost);
	} else {
		draw_text(x,y-110,t_won);
	}
	
	draw_sprite_ext(sSmallBox,0,x,y+20,1,1,0,global.buttonColor,1);
	
	draw_set_font(fMediumMenu);
	draw_text(x,y+20,lost ? t_retry : t_again);
	
	draw_text(x,y+115,"Exit");
}