var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], 
					cam_x + irandom_range(-shake_amount, shake_amount),
					cam_y + irandom_range(-shake_amount, shake_amount));
					
if(shake_time > 0) {
	shake_time--;
	shake_amount--;
	alarm[0] = 1;
} else {
	shake_time = 5;
	shake_amount = 10;
}