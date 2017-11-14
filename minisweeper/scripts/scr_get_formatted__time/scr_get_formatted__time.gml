///@param time
var _seconds = floor(argument0);

var _hours = _seconds div (60*60);
	_seconds = _seconds mod (60*60);

var _minutes = _seconds div 60;
	_seconds = round(_seconds mod 60);



var _str = "";
if (_hours > 0) {
	_str += string(_hours) + ":";
}
if (_minutes > 0 || _hours > 0) {
	if (_minutes == 0) {
		_str += string("00:");	
	}
	else if (_minutes > 9 || _hours == 0) {
		_str += string(_minutes) + ":";
	} else {
		_str += "0"+string(_minutes) + ":"
	}
}
if (_minutes > 0 || _hours > 0) {
	if (_seconds == 0) {
		_str += "00";
	} else if (_seconds < 10) {
		_str += "0" + string(_seconds);	
	} else {
		_str += string(_seconds);	
	}
} else {
	_str += string(_seconds);	
}

return _str;