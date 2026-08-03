if(dealing) {
	var player_num = ds_list_size(player_hand);
	if(player_num < 4) {
		var dealt_card = ds_list_find_value(deck, ds_list_size(deck) - 1);
		ds_list_delete(deck, ds_list_size(deck)-1);
		ds_list_add(player_hand, dealt_card);
		dealt_card.x = 200 + player_num * 100;
		dealt_card.y = room_height - 200;
		dealt_card.in_hand = true;
	} else {
		dealing = false;
	}
} else if (!compare && !clean_up) {
	if(select_one != noone && select_two != noone) compare = true;
} else if(compare){
	if(select_one.face_index == select_two.face_index) show_debug_message("you matched!");
	else show_debug_message("ur a loser :(");
	compare = false;
	clean_up = true;
} else if(clean_up) {
	//Check number of cards in player hand
	//if there are cards in the player's hand
	//access the next card in the player's hand
	//remove it from the player's hand list
	//add it to the discard list
	//set the card's position to visually be where the discard pile is
	//reset the card's variables in_face and face_up
	
	//when there are no cards in the player's hand
	//return to dealing cards
}