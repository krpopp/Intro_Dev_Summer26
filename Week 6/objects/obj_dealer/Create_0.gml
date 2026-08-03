num_cards = 12;

deck = ds_list_create();
player_hand = ds_list_create();
discard = ds_list_create();

//CHANGE LATER! THIS IS BAD!
dealing = true;
compare = false;
clean_up = false;

select_one = noone;
select_two = noone;

for(var i = 0; i < num_cards; i++){
	var new_card = instance_create_layer(x, y, "Instances", obj_card);
	ds_list_add(deck, new_card);
	new_card.in_hand = false;
	new_card.face_up = false;
	new_card.face_index = i % 3;
}

randomize();
ds_list_shuffle(deck);

for(var i = 0; i < ds_list_size(deck); i++){
	var card = ds_list_find_value(deck, i);
	card.y = y - 2 * i;
	card.depth = ds_list_size(deck) - i;
}

function select_card(card_id){
	if(select_one == noone) select_one = card_id;
	else if(select_two == noone) select_two = card_id;
}