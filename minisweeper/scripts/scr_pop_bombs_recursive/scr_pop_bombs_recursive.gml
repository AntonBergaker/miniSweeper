///@param x
///@param y

var _x = argument0;
var _y = argument1;

var _maxW = gridWidth-1;
var _maxH = gridHeight-1;


for (var xx = max(_x-1, 0); xx<=min(_x+1, _maxW) ;xx++) {
	for (var yy = max(_y-1, 0); yy<=min(_y+1, _maxH) ;yy++) {
		if (mineEaseGrid[# xx,yy] == 0) {
				if (random(log10(minePitch+1)) < 0.1) {
					audio_play(aBomb,clamp(0.3 - log10(minePitch+1),0.06,0.5),random_range(0.9,1.1) + log10(minePitch+1));
					minePitch += 0.05;
				}
				minePitch += 0.05;
			ds_list_add(mineEaseList, [xx, yy]);
			mineEaseGrid[# xx,yy] = random_range(-0.1,0.1) + deltaTimeS;
		}
	}
}
