/// @description Insert description here
// You can write your code in this editor

part = part_system_create(prt_player);
part_system_depth(part, 30);

var _dust_ind = part_system_get_info(part);
dust = _dust_ind.emitters[0].parttype.ind;

var _star_ind = part_system_get_info(part);
stars = _star_ind.emitters[1].parttype.ind;

shake_time = 5;
shake_amount = 10;

bg_time = 5;
layer_id = layer_get_id("Background");
back_id = layer_background_get_id(layer_id);

squash_speed = 0.05;
squash_timer = 0;

x_curve = animcurve_get_channel(anm_jump, "x_scale");
y_curve = animcurve_get_channel(anm_jump, "y_scale");