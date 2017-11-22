///@param color

switch argument0 {
	case ThemeColors.Background:
		return global.backColor;
	case ThemeColors.Button:
		return global.buttonColor;
	case ThemeColors.Text:
		return global.textColor;
	case ThemeColors.Solid:
		return global.solidColor;
	case ThemeColors.Cleared:
		return global.clearedColor;
	case ThemeColors.Mine:
		return global.mineColor;
	case ThemeColors.Flag:
		return global.flagColor;
	case ThemeColors.Card:
		return global.cardColor;
	default:
		return c_white;
}