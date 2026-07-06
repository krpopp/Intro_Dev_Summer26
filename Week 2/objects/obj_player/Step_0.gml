//PLAYER INPUT AND ANIMATION
//if we press the W,A,S, or D keys
//change the sprite file (if it's not already that file)
//and turn on the animation
//set our speed
//if we did not press W,A,S, or D then turn off the animation
if(keyboard_check(ord("W"))){
	if(sprite_index != spr_frog_backward) {
		sprite_index = spr_frog_backward;
		image_speed = 5;
	}
	y_speed = -1;
} else if(keyboard_check(ord("S"))){
	if(sprite_index != spr_frog_forward) {
		show_debug_message("change")
		sprite_index = spr_frog_forward;
		image_speed = 5;
	}
	y_speed = 1;
} else if(keyboard_check(ord("A"))){
	if(sprite_index != spr_frog_side) {
		sprite_index = spr_frog_side;
		image_speed = 5;
		image_xscale = -1;
	}
	x_speed = -1;
} else if(keyboard_check(ord("D"))){
	if(sprite_index != spr_frog_side) {
		sprite_index = spr_frog_side;
		image_speed = 5;
		image_xscale = 1;
	}
	x_speed = 1;
} else {
	image_speed = 0;
}	



//reset our movement boolean
can_move = true;

//if we would collide with a wall in the x direction we want to move
//set the movement boolean to false
if(place_meeting(x + x_speed, y, obj_wall)){
	can_move = false;
}

//if we're able to move, move on the x axis
if(can_move){ 
	x += x_speed;
}

//do the above again but for the y axis
can_move = true;

if(place_meeting(x, y + y_speed, obj_wall)){
	can_move = false;	
}

if(can_move){
	y += y_speed;
}

//reset our speed at the end of the frame
x_speed = 0;
y_speed = 0;