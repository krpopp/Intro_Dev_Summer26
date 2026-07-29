//% means modulo; gets the remainder of the two nums
// ex: 5 / 2 remainder = 1
// 4 / 2 remainder = 0
// 3 / 2 remainder = 1
if(bg_time % 2 == 0){
	layer_background_blend(back_id, c_white);
} else {
	layer_background_blend(back_id, #38405F);
}

if(bg_time > 0){
	bg_time--;
	alarm[1] = 1;
} else {
	layer_background_blend(back_id, #38405F);
	bg_time = 5;
}