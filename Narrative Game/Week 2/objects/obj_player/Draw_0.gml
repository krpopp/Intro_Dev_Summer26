//draw the sprite of this object
draw_self();


//if we've overlapped with an NPC, show their dialogue
if(overlap_npc_one){
	draw_set_colour(c_black);
	draw_text(x, y - 40, "Hello, NPC one!");
}

if(overlap_npc_two){
	draw_set_colour(c_black);
	draw_text(x, y - 40, "Hello, NPC two!");
}