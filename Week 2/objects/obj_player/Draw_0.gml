draw_self();

if(overlap_npc_one){
	draw_set_colour(c_black);
	draw_text(x, y - 40, "Hello, NPC one!");
}

if(overlap_npc_two){
	draw_set_colour(c_black);
	draw_text(x, y - 40, "Hello, NPC two!");
}