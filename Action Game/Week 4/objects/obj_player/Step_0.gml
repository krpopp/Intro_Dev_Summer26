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

//find the y direction we're moving (+ is down, - is up)
var dir = sign(to_move_y);

//while we have pixels left to move
while(to_move_y != 0){
	//create two local variables to track if we're colliding
	//and what we're colliding with
	var colliding = false;
	var collide_with = noone;
	if(!knockout){
		//if we're moving down, check for collisions
		if(dir > 0){
			collide_with = instance_place(x, y + dir, obj_player);
			if(collide_with != noone){
				if(place_meeting(x, y, collide_with) == false){
					colliding = true;
					collide_with.y_vel = 50;
					collide_with.knockout = true;
				}
			} else {
				//if there is a platform in the next pixel we're going to move
				//store that platform in collide_with
				collide_with = instance_place(x, y + dir, obj_platform);	
				//if we detected something to collide with
				if(collide_with != noone) {
					//if we are not already colliding with that thing
					if(place_meeting(x, y, collide_with) == false){
						//set colliding to true
						colliding = true;	
					}
				}
			}
		}
	}
	
	//if we're not colliding
	if(!colliding){
		//move one pixel in the direction we're going
		y += dir;
		//reduce our count of pixels to move this frame by one
		to_move_y -= dir;
	} else {
		//otherwise, move
		y += dir;
		//set our velocity to our bounce velocity
		y_vel = bounce_vel;
		//clear out the variable that tracks our sub-pixel we have left to move
		r_y = 0;
		//break from the while loop
		break;
	}
}

//if the player presses the movement keys
//add acceleration to the x velocity
if(keyboard_check(left_key)){
	x_vel -= accel;
}

if(keyboard_check(right_key)){
	x_vel += accel;	
}

//add gravity to the y velocity
y_vel += grav;