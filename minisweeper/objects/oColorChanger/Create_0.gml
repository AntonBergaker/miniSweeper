if (instance_number(object_index) >= 2) {
	with oColorChanger {
		if (id != other.id) {
			instance_destroy();	
		}
	}
}

backColorStart       = global.backColor;
buttonColorStart     = global.buttonColor;
solidColorStart      = global.solidColor;
clearedColorStart    = global.clearedColor;
buttonTextColorStart = global.buttonColor;
textColorStart       = global.textColor;
mineColorStart       = global.mineColor;
flagColorStart       = global.flagColor;
cardColorStart       = global.cardColor;

time = 0;