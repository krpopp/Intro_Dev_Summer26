//add the player's current velocity to the 
//remaining pixels to move
r_x += x_vel;
r_y += y_vel;

//round the remaining pixels to move
//set a local var to that number
var to_move_x = round(r_x);
var to_move_y = round(r_y);

//get the the difference between the TRUE velocity
//and the amount we can move this frame
//store the <1 pixel velocity to try to move it next frame
r_x -= to_move_x;
r_y -= to_move_y;

//change x by however much we're moving this frame
x += to_move_x;

var dir = sign(to_move_y);

while(to_move_y != 0){
	var colliding = false;
	var collide_with = noone;
	
	if(dir > 0){
		collide_with = instance_place(x, y + dir, obj_platform);	
		//THIS IS WHERE YOU'D PUT PLAYER COLLISION
		
		if(collide_with != noone) {
			if(place_meeting(x, y, collide_with) == false){
				colliding = true;	
			}
		}
	}
	
	if(!colliding){
		y += dir;
		to_move_y -= dir;
	} else {
		y += dir;
		y_vel = bounce_vel;
		r_y = 0;
		break;
	}
}

//if the player presses the movement keys
//add acceleration to the x velocity
if(keyboard_check(vk_left)){
	x_vel -= accel;
}

if(keyboard_check(vk_right)){
	x_vel += accel;	
}

y_vel += grav;