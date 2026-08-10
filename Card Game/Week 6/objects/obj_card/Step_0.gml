if(in_hand && !face_up) {
	if(obj_dealer.select_one == noone || obj_dealer.select_two == noone){
		if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
			obj_dealer.select_card(id);
			face_up = true;	
		}
	}	
}