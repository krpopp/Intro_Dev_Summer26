if(abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.1);
	depth = -1000;
} else {
	x = target_x;
	depth = target_depth;
}

if(abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.1);
	depth = -1000;
} else {
	y = target_y;
	depth = target_depth;
}

if(face_index == 0) sprite_index = spr_blue;
else if (face_index == 1) sprite_index = spr_red;
else if(face_index == 2) sprite_index = spr_yellow;

if(!face_up) sprite_index = spr_card;

draw_self();