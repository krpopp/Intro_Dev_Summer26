switch(state){
	case STATES.DEALING:
		var player_num = ds_list_size(player_hand);
		if(player_num < 4 && move_timer == 0) {
			var dealt_card = ds_list_find_value(deck, ds_list_size(deck) - 1);
			ds_list_delete(deck, ds_list_size(deck)-1);
			ds_list_add(player_hand, dealt_card);
			dealt_card.target_x = 200 + player_num * 100;
			dealt_card.target_y = room_height - 200;
			dealt_card.in_hand = true;
		} else if(player_num == 4) {
			//dealing = false;
			state = STATES.SELECTING;
		}
		break;
	case STATES.SELECTING:
		if(select_one != noone && select_two != noone) state = STATES.COMPARING;
		//compare = true;
		break;
	case STATES.COMPARING:
		if(select_one.face_index == select_two.face_index) show_debug_message("you matched!");
		else show_debug_message("ur a loser :(");
		//compare = false;
		//clean_up = true;
		state = STATES.CLEANING;
		break;
	case STATES.CLEANING:
		//Check number of cards in player hand
		var player_num = ds_list_size(player_hand);
		if(player_num > 0 && move_timer == 0){
			//access the next card in the player's hand
			var next_card = ds_list_find_value(player_hand, ds_list_size(player_hand)-1);
			//remove it from the player's hand list
			ds_list_delete(player_hand, ds_list_size(player_hand)-1);
			//add it to the discard list
			ds_list_add(discard, next_card);
			//set the card's position to visually be where the discard pile is
			next_card.target_x = room_width - 200;
			//TO DO: make sure cards are stacked in discard
			next_card.target_y = y;
			//reset the card's variables in_face and face_up
			next_card.face_up = false;
			next_card.in_hand = false;
		} else if(player_num == 0){
			select_one = noone;
			select_two = noone;
			//set state to deal if there are still cards in the deck
			//set state to shuffle if there are no cards in the deck
		}
		break;
	case STATES.SHUFFLING:
		//if move_timer % 4 == 0
		break;
}
/*
if(dealing) {
	
} else if (!compare && !clean_up) {
	
} else if(compare){

} else if(clean_up) {

}*/

move_timer++;
if(move_timer > 16){
	move_timer = 0;
}