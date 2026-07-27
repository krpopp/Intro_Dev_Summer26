/// @description Insert description here
// You can write your code in this editor

part = part_system_create(prt_player);
part_system_depth(part, 30);

var _dust_ind = part_system_get_info(part);
dust = _dust_ind.emitters[0].parttype.ind;

var _star_ind = part_system_get_info(part);
stars = _star_ind.emitters[1].parttype.ind;