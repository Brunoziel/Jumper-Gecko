var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var key_jumps = keyboard_check_released(vk_space)

var move = key_right - key_left != 0;



if(hspd != 0){
	image_xscale = sign(hspd);
}

if place_meeting(x, y + 1, obj_parede){
	pulos = pulosmax;
}

if place_meeting(x, y+1, obj_parede) && key_jump && pulos > 1 {
	vspd = -pulospd;
	sprite_index = spr_player_jump;
} else {
	vspd += grv;
	if key_jumps {
	if vspd<0 {
		vspd = vspd*.5;
	}
	}
	if key_jump && pulos > 1 {
	pulos--;
	vspd = -pulospd;
	sprite_index = spr_player_jump;
	}
}




vspd = clamp(vspd,vspd_min,vspd_max);

if(move){
	move_dir = point_direction(0,0,key_right - key_left,0);
	move_spd = approach(move_spd,move_spd_max,acc);
}else{
	move_spd = approach(move_spd,0,dcc);
}

hspd = lengthdir_x(move_spd, move_dir);


if place_meeting(x + hspd, y, obj_parede){
	while !place_meeting(x + sign(hspd), y, obj_parede){
		x += sign(hspd);
	}
	hspd = 0;
}

x+=hspd;

if place_meeting(x, y + vspd, obj_parede){
	while !place_meeting(x, y + sign(vspd), obj_parede){
		y += sign(vspd);
	}
	vspd = 0;
}

y+=vspd;

//Animação

if(hspd != 0){
	image_xscale = sign(hspd);
}

if (place_meeting(x, y+1, obj_parede)) && (hspd != 0) {
	sprite_index = spr_player_andando;
} else if (place_meeting(x, y+1, obj_parede)) && (hspd == 0) {
	sprite_index = spr_player_idle;
} 