if(face_index == 0) sprite_index = spr_blue;
else if (face_index == 1) sprite_index = spr_red;
else if(face_index == 2) sprite_index = spr_yellow;

if(!face_up) sprite_index = spr_card;

draw_self();