/// @description Insert description here
// You can write your code in this editor
skey_left = keyboard_check(vk_left);
skey_right = keyboard_check(vk_right);
skey_jump = keyboard_check_pressed(vk_up);
skey_space = keyboard_check_pressed(vk_space)
skey_a = keyboard_check_pressed(ord("a"))
skey_d = keyboard_check_pressed(ord("d"))
var original_x = x;
var original_y = y;

var _move = 0;

_move = skey_right - skey_left;

if (_move == -1) {
	sprite_index = Sprite2_running;
	draw_sprite_ext(sprite_index, image_index, x, y, -1, 1, 0, c_white, 1);

}
if (_move == 1) {
	
	sprite_index = Sprite2_running;
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);

}
if (_move == 0) {
	sprite_index = Sprite2;
}


hsp = _move * walksp;

// Wall collision
function horzontal_collision_and_bouncing() {
	if (place_meeting(x + hsp, y, obj_floor)){
		if (!place_meeting(x+sign(hsp), y, obj_floor)) {
			x += sign(hsp);
		}
		hsp = 0;
		y = y -4
	}
	x += hsp
	
}
// Jumping
function jumping() {
	if (place_meeting(x, y + 1, obj_floor)) and (skey_jump) {
		vsp = - 7
	}
	
}
// Verticle collision and gravity
function verticle_collsion() {
	if (place_meeting(x, y + vsp, obj_floor)){
		if (!place_meeting(x, y +sign(vsp), obj_floor)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;


}
// Gravity
function gravity_for_player(){
	vsp += gravityvar;
}
// hitting ball
function hitting_the_ball () {
	if place_meeting(x,y,obj_golfball) {
		if (keyboard_check_pressed(vk_space))
		{
			obj_golfball.y -= 3
			var _hiting_speed_dis = hitting_distance * direction_towards
			obj_golfball.hsp += _hiting_speed_dis;
			
			var _hiting_speed_hei = hitting_height
			obj_golfball.vsp -= _hiting_speed_hei;
			
		}
	}

}
//changing direction
function direction_hit () {
	if (keyboard_check_pressed(ord("A"))) && direction_towards == 1 {
		direction_towards = -1
	}
	if (keyboard_check_pressed(ord("D"))) && direction_towards == -1 {
		direction_towards = 1
	}
	
}

// changing clubs
function change_club () {
    if (keyboard_check_pressed(vk_enter) && club < 14) {
        club += 1;
    } 
    // Decrement club if vk_f2 is pressed and club is greater than 1
    if (keyboard_check_pressed(vk_shift) && club > 0) {
        club -= 1;
    }
	switch (club) {
        case 1:
            hitting_distance = 14;
            hitting_height = 5;
            break;
        case 2:
            hitting_distance = 13;
            hitting_height = 6;
            break;
        case 3:
            hitting_distance = 12;
            hitting_height = 7;
            break;
        case 4:
            hitting_distance = 11;
            hitting_height = 4;
            break;
        case 5:
            hitting_distance = 10;
            hitting_height = 5;
            break;
        case 6:
            hitting_distance = 9;
            hitting_height = 6;
            break;
        case 7:
            hitting_distance = 8;
            hitting_height = 7;
            break;
        case 8:
            hitting_distance = 8;
            hitting_height = 8;
            break;
        case 9:
            hitting_distance = 7;
            hitting_height = 8;
            break;
        case 10:
            hitting_distance = 6;
            hitting_height = 9;
            break;
        case 11:
            hitting_distance = 6;
            hitting_height = 10;
            break;
        case 12:
            hitting_distance = 5;
            hitting_height = 11;
            break;
        case 13:
            hitting_distance = 4;
            hitting_height = 12;
            break;
        case 14:
            hitting_distance = 10;
            hitting_height = 0;
            break;
        default:
            hitting_distance = 1;
            hitting_height = 0;
            break;
	}

}

horzontal_collision_and_bouncing()
verticle_collsion()
gravity_for_player()
jumping()

direction_hit()
change_club()
hitting_the_ball()
