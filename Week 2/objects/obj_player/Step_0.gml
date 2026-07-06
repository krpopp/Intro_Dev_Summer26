if(keyboard_check(ord("W"))){
	if(sprite_index != spr_frog_backward) {
		sprite_index = spr_frog_backward;
		image_speed = 5;
	}
	y_speed = -1;
	//y--;	
} else if(keyboard_check(ord("S"))){
	if(sprite_index != spr_frog_forward) {
		show_debug_message("change")
		sprite_index = spr_frog_forward;
		image_speed = 5;
	}
	y_speed = 1;
	//y++;
} else if(keyboard_check(ord("A"))){
	if(sprite_index != spr_frog_side) {
		sprite_index = spr_frog_side;
		image_speed = 5;
	}
	image_xscale = -1;
	x_speed = -1;
	//x--;
} else if(keyboard_check(ord("D"))){
	if(sprite_index != spr_frog_side) {
		sprite_index = spr_frog_side;
		image_speed = 5;
	}
	image_xscale = 1;
	x_speed = 1;
	//x++;
} else {
	image_speed = 0;
}	

if(place_meeting(x + x_speed, y, obj_wall)){
	can_move = false;
}

if(can_move){ 
	x += x_speed;
}

can_move = true;

if(place_meeting(x, y + y_speed, obj_wall)){
	can_move = false;	
}

if(can_move){
	y += y_speed;
}

x_speed = 0;
y_speed = 0;