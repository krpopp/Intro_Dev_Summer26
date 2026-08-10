/// @description Insert description here
// You can write your code in this editor

//slow the player down on the x-axis
x_vel *= 0.9

//adding gravity to the y velocity
y_vel += grav;

//r = remainder
//add the current speed to the leftover
//speed from the last frame
r_y += y_vel;
r_x += x_vel;

//round the velocity
//these are the pixels we're moving this frame
var to_move_y = round(r_y);
var to_move_x = round(r_x);

//remove the rounded amount so that we have the leftover speed
r_y -= to_move_y;
r_x -= to_move_x;

//find the distance between the player and the walls
var dist_to_r_wall = room_width - x - 8;
var dist_to_l_wall = x - 8;

//if we've hit the right wall
if(to_move_x >= dist_to_r_wall) {
	//nudge the player to the left
	x = room_width - 9;
	//reverse our velocity
	x_vel = abs(x_vel) * -1;
	//reset the remainder variable
	r_x = 0;
} else if(to_move_x < -dist_to_l_wall) {
	audio_play_sound(snd_wallhit, 99, 0);
	//if we've hit the left wall
	//nudge to the right
	x = 9; 
	//reverse the velocity
	x_vel = abs(x_vel);
	//reset the remainder variable
	r_x = 0;
} else {
	//otherwise
	//move however much we need to move this frame
	x += to_move_x;
}

//find the y direction that we're moving
var dir = sign(to_move_y);

while(to_move_y != 0) {
	//track IF we've collided w/ anything
	var colliding = false;
	//track what instance we have collided with
	var collidewith = noone;
	
	//check for collisions if we're moving downward
	if(dir >= 0) {
		//set to a player that may be one pixel beneath me
		collidewith = instance_place(x, y + dir, obj_player);
		
		//if we've collided w/ a player
		if(collidewith != noone) {
			//if we're not already overlapping w/ that player
			if(place_meeting(x, y, collidewith) == false) {
				//track that we've hit somethingh
				colliding = true;
				//bounce  the other player down
				collidewith.y_vel = max(0, collidewith.y_vel + 2);
			}
		} else {
		
			//set to a burger that may be one pixel beneath me
			collidewith = instance_place(x, y + dir, obj_platform);
			//if we're going to collide w/ a burger
			if(collidewith != noone) {
				//and if we've not already overlapped w/ that burger
				if(place_meeting(x, y, collidewith) == false) {
					//track that we've hit something
					alarm[0] = 1;
					squash_timer += squash_speed;
					part_particles_create(part, x, y + 6, dust, 10);
					colliding = true;
				}
			}
		}
		
	}
	
	// if we're NOT colliding w/ anything
	if(!colliding) {
		//move one pixel in the direction we're moving
		y += dir;
		//remove that pixel from the pixels we're tracking this frame
		to_move_y -= dir;
	} else {
		//if we did collide w/ something
		//move one pixel in the direction we've moving
		y = y + dir;
		//change our y velocity to the bouncing velocity
		y_vel = bounce_vel;
		//reset our remaining pixels to move
		//(since we're bouncing in another direction, we don't care about the leftovers)
		r_y = 0;
		//break out of this while loop
		break;
	}
}

//if we hit the left key
if(keyboard_check(ord(left_key))) {
	//decrease our x velocity by the acceleration
	x_vel -= accel;
}
//if we hit the right eye
if(keyboard_check(ord(right_key))) {
	//increase our x velocity by the acceleration
	x_vel += accel;
}

if(squash_timer != 0) {
	squash_timer += squash_speed;
	image_xscale = animcurve_channel_evaluate(x_curve, squash_timer);
	image_yscale = animcurve_channel_evaluate(y_curve, squash_timer);
	if(squash_timer > 1){
		image_xscale = 1;
		image_yscale = 1;
		squash_timer = 0;
	}
}


//handle smooth camera movement
targetx = x - (camera_get_view_width(view_camera[0]) / 2); //where we want the camera to be  - centered on the player
targety = y - (camera_get_view_height(view_camera[0]) / 2);
currentx = camera_get_view_x(view_camera[0]); //current camera position
currenty = camera_get_view_y(view_camera[0]);
//blend between the current and target camera positions for smooth movement
camera_set_view_pos(view_camera[0],targetx * 0.1 + currentx *0.9, targety*0.1 + currenty*0.9)

if(y > room_height) {
	y = 10;
}



