var num_inst = instance_number(obj_collect);

if(frames_since_inst > frames_bt_inst || num_inst < 5){
	if(num_inst < max_inst){
		var new_inst = instance_create_layer(
		random_range(30, room_width - 30), 
		random_range(100, room_height - 100), 
		"Instances", obj_collect);
		
		var tries = 0;
		while(collision_rectangle(new_inst.x, new_inst.y, new_inst.x + 32, new_inst.y + 32, obj_collect, false, true) != noone && tries < 3000){
			new_inst.x = random_range(30, room_width - 30);
			new_inst.y = random_range(100, room_height - 100);
			tries += 1;
		}
		frames_since_inst = 0;
	}
}

frames_since_inst++;