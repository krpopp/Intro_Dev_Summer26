//set that we've collected the key
has_key = true;
//play the key sound
audio_play_sound(snd_key, 1, false);
//remove the key from the game
instance_destroy(other);