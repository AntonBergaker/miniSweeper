/// @param sound
/// @param [volume]
/// @param [pitch]

if global.audioVolume >= 0.05
{
    var _aud = audio_play_sound(argument[0],-1,0)
	var _volume;
	if argument_count > 1 {
		_volume = argument[1] * global.audioVolume;
	}
	else {
		_volume = global.audioVolume;
	}
	
    audio_sound_gain(_aud,_volume,0)
	
	if argument_count > 2 {
		audio_sound_pitch(_aud,argument[2]);
	}
	
    return _aud;
}
else {
	return noone
}