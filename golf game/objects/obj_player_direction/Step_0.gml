/// @description Insert description here
// You can write your code in this editor
x = character.x
y = character.y
switch (character.club) {
	case 1:
		image_angle = 8;
		break;
	case 2:
		image_angle = 13;
		break;
	case 3:
		image_angle = 20;
		break;
	case 4:
		image_angle = 17;
		break;
	case 5:
		image_angle = 25;
		break;
	case 6:
		image_angle = 30;
		break;
	case 7:
		image_angle = 35;
		break;
	case 8:
		image_angle = 40;
		break;
	case 9:
		image_angle = 45;
		break;
	case 10:
		image_angle = 50;
		break;
	case 11:
		image_angle = 53;
		break;
	case 12:
		image_angle = 55;
		break;
	case 13:
		image_angle = 60;
		break;
	case 14:
		x = 999999
		y = 999999
		break;
	default:
		image_angle = 0;
		break;
}


if (character.direction_towards == -1) {
	image_angle *= character.direction_towards
	image_angle -= 180
}