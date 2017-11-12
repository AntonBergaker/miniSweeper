if !firstStep {
	draw_sprite(sBigBox,0,x,y);
	
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fMineTextMip0);
	draw_text(x,y-110,"You Lost");
	
	draw_sprite_ext(sSmallBox,0,x,y+20,1,1,0,$49E047,1);
	
	draw_set_font(fMediumMenu);
	draw_text(x,y+20,"Retry");
	
	draw_text(x,y+115,"Exit");
}