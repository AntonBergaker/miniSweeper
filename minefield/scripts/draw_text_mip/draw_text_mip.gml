/// @param x
/// @param y
/// @param text
switch mip {
	case 0:
		draw_set_font(fMineTextMip0);
		break;
	case 1:
		draw_set_font(fMineTextMip1);
		break;
	case 2:
		draw_set_font(fMineTextMip2);
		break;
	case 3:
		draw_set_font(fMineTextMip3);
		break;
}
draw_text_transformed(argument0,argument1,argument2,mipScale,mipScale,0);