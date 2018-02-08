var _len;

var _guiW = global.guiWidth;
var _guiH = global.guiHeight;

var _x = x * _guiW;
var _y = y * _guiH;

var _scaleW = _guiW * width;
var _scaleH = _guiH * height;


draw_set_color(global.textColor);

_len = ds_list_size(sprites);
for (var i=0;i<_len;i++) {
	var _inst = sprites[|i];
	if (instance_exists(_inst)) {
		scr_menu_draw_sprite(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
	}
}

_len = ds_list_size(buttons);
for (var i=0;i<_len;i++) {
	var _inst = buttons[|i];
	if (instance_exists(_inst)) {
		scr_menu_draw_button(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
	}
}
_len = ds_list_size(labels);
for (var i=0;i<_len;i++) {
	var _inst = labels[|i];
	if (instance_exists(_inst)) {
		scr_menu_draw_label(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
	}
}
_len = ds_list_size(sliders);
if (_len > 0) {
	
	var _anyupdated = false;
	for (var i=0;i<_len;i++) {
		var _inst = sliders[|i];
		if (instance_exists(_inst) && _inst.updatedDraw && _inst.enabled) {
			_anyupdated = true;
			break;
		}
	}
	
	if (_anyupdated) {
		for (var i=0;i<_len;i++) {
			var _inst = sliders[|i];
			if (instance_exists(_inst) && _inst.updatedDraw && _inst.enabled) {
				scr_menu_draw_slider_text(_inst, _scaleW * _inst.width, _scaleH * _inst.height);	
			}
		}

		gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

		for (var i=0;i<_len;i++) {
			var _inst = sliders[|i];
			if (instance_exists(_inst) && _inst.updatedDraw && _inst.enabled) {
				scr_menu_draw_slider_mask(_inst, _scaleW * _inst.width, _scaleH * _inst.height);	
				_inst.updatedDraw = false;
			}
		}
	
		gpu_set_blendmode(bm_normal);
	}
	
	for (var i=0;i<_len;i++) {
		var _inst = sliders[|i];
		if (instance_exists(_inst)  && _inst.enabled) {
			if (surface_exists(_inst.surf)) {
				draw_surface_ext(_inst.surf, _x + (_inst.x - _inst.width/2) * _scaleW, _y + (_inst.y - _inst.height/2) * _scaleH,1,1,0,c_white,alpha*_inst.alpha)	
			}
			scr_menu_draw_slider_lines(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);	
		}
	}
}

var _len = ds_list_size(toggles);
for (var i=0;i<_len;i++) {
	var _inst = toggles[| i];	
	if (instance_exists(_inst)) {
		scr_menu_draw_toggle(_inst, _x + _inst.x * _scaleW, _y + _inst.y * _scaleH, _scaleW * _inst.width, _scaleH * _inst.height);		
	}
}