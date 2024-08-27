/// @description Insert description here
// You can write your code in this editor


if (place_meeting(x,y,Obj_golf_pin)){
	hole_over = true;
	//in_hole += 0.5;
} else {
	in_hole = 0;
}

var collision_instance = instance_place(x,y,obj_floor)
vsp += grv
if (collision_instance != noone) {
	if collision_instance.angle == 0 {
		hsp = -hsp * 0.5;
		vsp = -vsp * 0.5;
	} else {
	
		//if (!place_meeting(x + sign(hsp), y + sign(vsp), obj_floor)) {
		//	if (!(hsp < 0.6 and hsp > -0.6 and vsp < 0.6 and vsp > -0.6)) {
		//        x += sign(hsp) * 2;
		//        y += sign(vsp) * 2;
		//	}
	    //}
		////////var wall_angle = collision_istance.angle;

		////////// Calculate the wall's normal angle
		////////var normal_angle = wall_angle + 90;

		////////// Calculate the ball's velocity vector angle
		////////var ball_angle = point_direction(0, 0, hsp, vsp);

		////////// Calculate the angle of incidence
		////////var incidence_angle = ball_angle + normal_angle;

		////////// Calculate the angle of reflection
		////////var reflection_angle = normal_angle + incidence_angle;

		////////// Calculate the new hsp and vsp using the reflection angle
		////////var spee = point_distance(0, 0, hsp, vsp);
		////////hsp = lengthdir_x(spee, reflection_angle);
		////////vsp = lengthdir_y(spee, reflection_angle);
		////////hsp *= 0.9
		////////vsp *= 0.9
		//if (place_meeting(x - sign(hsp), y - sign(vsp), obj_floor)) {
		
        
		//	if (!(hsp < 0.6 and hsp > -0.6 and vsp < 0.6 and vsp > -0.6)) {
		//		x += sign(hsp);
		//		y += sign(vsp);
		//	}
	    //} 

	  // Move vertically out of the collision
		// Calculate the hypotenuse
		var hypothanoiseu = sqrt(sqr(hsp) + sqr(vsp));
		show_debug_message("hypothanoiseu:");
		show_debug_message(hypothanoiseu);

		// Calculate the sine of the angle of attack
		var sin_angle = vsp / hypothanoiseu;
		show_debug_message("sin_angle:");
		show_debug_message(sin_angle);

		// Calculate the angle of attack (in radians)
		var angle_of_attack = arcsin(sin_angle);
		show_debug_message("angle_of_attack:");
		show_debug_message(angle_of_attack);

		// Bounce angle of the floor
		var bounce_angle_of_floor = collision_instance.angle * (pi/180); // Assume this is in radians
		show_debug_message("bounce_angle_of_floor:");
		show_debug_message(bounce_angle_of_floor);

		// Calculate the reflection angle
		// This uses the fact that angle of reflection = 2 * normal_angle - incident_angle
		var return_angle = angle_of_attack - bounce_angle_of_floor;

		// Calculate the angle of reflection
		var reflection_angle = bounce_angle_of_floor - return_angle;
		show_debug_message("reflection_angle:");
		show_debug_message(reflection_angle);

		// Calculate the new velocity components after reflection
		var newvsp = hypothanoiseu * sin(reflection_angle);
		var newhsp = hypothanoiseu * cos(reflection_angle);

		show_debug_message("new vsp:");
		show_debug_message(newvsp);
		show_debug_message("new hsp:");
		show_debug_message(newhsp);
	
		// Calculate the angle of attack (in radians)
		if place_meeting(x,y,obj_floor45) {
			if hsp > vsp {
				
				hsp = newhsp * 0.3
				vsp = newvsp * 0.3
				hsp = hsp
				vsp = -vsp
				x += hsp
				y += vsp
			} 
			if hsp <= vsp {
				hsp = newhsp * 0.3
				vsp = newvsp * 0.3
				hsp = -hsp
				vsp = -vsp 
				x += hsp
				y += vsp
			}
		
		}
		//vsp = newvsp * 0.3;
		//hsp = newhsp * 0.3
		//vsp = newvsp * 0.3
		//x = x + hsp
		//y = y + vsp
	
		//if (place_meeting(x, y, obj_floor)) {
		//	y += sign(vsp);
		//}
		//if (place_meeting(x, y, obj_floor45)) or (place_meeting(x, y, obj_floor22_5)) {
		//	x += sign(hsp);
		//	y += sign(vsp);
		//} 
		//} 
		var stop_threshold = 0.05;
		//if (abs(hsp) < stop_threshold) hsp = 0;
		//if (abs(vsp) < stop_threshold) vsp = 0;
	}
}


//	if (hsp != 0) {
//		if (vsp != 0) {
//			if collision_istance.angle == 0 {
//				if hsp != 0 {
//					if (hsp < -0.1) and (hsp < 0.1) and (vsp > -0.1) and (vsp < 0.1) and hsp != 0 and vsp != 0 {
//						hsp = 0
//						vsp = 0
//					}
						
//					vsp = -vsp * 0.5
//					hsp *= 0.5
//				}
//			} else {
//				if hsp > 0{
//					var hypothanoiseu = (sqr(hsp) + sqr(vsp))
//					hypothanoiseu = sqrt(hypothanoiseu)

//					var sign_anlge = vsp / hypothanoiseu
//					show_debug_message("hsp:")
//					show_debug_message(hsp)
//					show_debug_message("vsp:")

			
//					show_debug_message(vsp)
//					show_debug_message("hypothanoisu:")
//					show_debug_message(hypothanoiseu)
//					show_debug_message("sin-1:")
//					show_debug_message(sign_anlge)
//					var angle_of_attack = arcsin(sign_anlge)
//					show_debug_message("angle of attack:")
//					show_debug_message(angle_of_attack)
//					var bounce_angle_5f_floor = collision_ist5nce.angle
//		hsp = 0le_of_floor = bounce_angle_of_floor * (180/pi)
				//vsp = 0
//					show_debug_message(bounce_angle_of_floor)
//					var return_angle = angle_of_attack + bounce_angle_of_floor
//					if angle_of_attack == bounce_angle_of_floor {
//						var return_angle = 180 - bounce_angle_of_floor
					
//					}

//					show_debug_message("final angle:")
//					show_debug_message(return_angle)
				
//					var newvsp = hypothanoiseu * sin(return_angle)
//					show_debug_message("new vsp")
//					show_debug_message(newvsp)
//					var newhsp = sqrt((sqr(hypothanoiseu)) + sqr(newvsp))
//					show_debug_message("new hsp")
//					show_debug_message(newhsp)
//					hsp sp
//					vsp sp
//				}
//				if hsp< 0 {
//					show_debug_message("boom boom mf")
//					var hypothanoiseu = ((sqr(hsp)) + sqr(vsp))
//					hypothanoiseu = -(sqrt(hypothanoiseu))
//					var sign_anlge = vsp / hypothanoiseu
//					show_debug_message("hsp:")
//					show_debug_message(hsp)
//					show_debug_message("vsp:")
//					show_debug_message(vsp)
//					show_debug_message("hypothanoisu:")
//					show_debug_message(hypothanoiseu)
//					show_debug_message("sin-1:")
//					show_debug_message(sign_anlge)
//					var angle_of_attack = arcsin(sign_anlge)
//					show_debug_message("angle of attack:")
//					show_debug_message(angle_of_attack)
//					var bounce_angle_of_floor = collision_istance.angle
//					bounce_angle_of_floor = bounce_angle_of_floor * (180/pi)
//					show_debug_message("bounce angle of floor")
//					show_debug_message(bounce_angle_of_floor)
					
//					if angle_of_attack == bounce_angle_of_floor {
//						var return_angle = 180 - bounce_angle_of_floor
					
//					} else {
//						var return_angle = angle_of_attack + bounce_angle_of_floor
//					}
//					show_debug_message("final angle:")
//					show_debug_message(return_angle)
				
//					var newvsp = hypothanoiseu * sin(return_angle)
//					show_debug_message("new vsp")
//					show_debug_message(newvsp)
//					var newhsp = sqrt((sqr(hypothanoiseu)) + sqr(newvsp))
//					show_debug_message("new hsp")
//					show_debug_message(newhsp)
//					//newhsp -= newhsp
//					//newvsp -= newvsp
//					vsp = newvsp
//					hsp = newhsp

//				}
			
			
//			if (place_meeting(x, y, obj_floor)) {
//				y -= 3;

//	        }
//			hsp *= 0.2
//			vsp *= 0.2
//			}

//		} else {
//			hsp = -hsp * 0.5
//			vsp = -vsp * 0.5
//		}
//	} else {
//		hsp = -hsp * 0.5
//		vsp = -vsp * 0.5
//	}
//	if (hsp > -0.1) and (hsp < 0.1) and (vsp > -0.1) and (vsp < 0.1) and hsp != 0 and vsp != 0 {
//		hsp *= 5
//		vsp *= 5
//	}
	
	
	
//}

if place_meeting(x + hsp,y,obj_deflector) {
	if (!place_meeting(x+sign(hsp), y, obj_deflector)) {
		x += sign(hsp);
	}
	hsp = -hsp * 0.5;

}

if place_meeting(x,y + vsp,obj_deflector) {
	if (!place_meeting(x, y+sign(vsp), obj_deflector)) {
		y += sign(vsp);
	}
	vsp = -vsp * 0.5;

}


x += hsp;
y += vsp;












//if (place_meeting(x, y + vsp, obj_floor)){
//	if (!place_meeting(x, y +sign(vsp), obj_floor)) {
//		y += sign(vsp);
//	}
//	if (place_meeting(x, y + vsp, obj_floor45)){
//		if (!place_meeting(x, y +sign(vsp), obj_floor45)) {
//			y += sign(vsp);
//		}
//		hsp = hsp * 0.5;
//		vsp = vsp * 0.5
//		var new_vsp = -hsp;
//		var new_hsp = -vsp;
//		hsp = new_hsp;
//		vsp = new_vsp;
//		if hsp < 0.01 {
//			hsp = 0
//			vsp = 0
//		}
//		if hsp == 0 {
//			vsp = 0
//		}
//	} else { 
//		if (place_meeting(x, y + vsp, obj_floor135)){
//			if (!place_meeting(x, y +sign(vsp), obj_floor135)) {
//				y += sign(vsp);
//			}
//			hsp = hsp * 0.5;
//			vsp = vsp * 0.5;
//			var new_vsp2 = hsp;
//			var new_hsp2 = -vsp;
//			hsp = new_hsp2;
//			vsp = new_vsp2;

//			if hsp < 0.01 {
//				hsp = 0
//				vsp = 0
//			}
//			if hsp == 0 {
//				vsp = 0
//			}
		
//		} else {
//			if (place_meeting(x, y + vsp, obj_floor157_5)){
//				if (!place_meeting(x, y +sign(vsp), obj_floor157_5)) {
//					y += sign(vsp);
//				}
//				//hsp = hsp * 0.5;
//				//vsp = vsp * 0.5;
//				var new_vsp2 = hsp * 0.2;
//				var new_hsp2 = vsp * 0.8;
//				hsp = new_hsp2;
//				vsp = new_vsp2;
//				if hsp < 0.01 {
//					hsp = 0
//					vsp = 0
//				}
//				if hsp == 0 {
//					vsp = 0
//				}
				
//			} else {
//				if (place_meeting(x + hsp, y, obj_floor22_5)) {
//					if (!place_meeting(x+sign(hsp), y, obj_floor22_5)) {
//						x += sign(hsp);
		
//					}
//					var new_vsp2 = -hsp * 0.2;
//					var new_hsp2 = -vsp * 0.8;
//					hsp = new_hsp2;
//					vsp = new_vsp2;
//					if hsp < 0.01 {
//						hsp = 0
//						vsp = 0
//					}
//					if hsp == 0 {
//						vsp = 0
//					}
					
//				} else {

//					hsp *= 0.5
//					vsp = -vsp * 0.5
//				}
//			}
//		}
	
	
//	//////////////////////////////////////////////////////////////////////////////var _triganomity = hsp / vsp
//	//////////////////////////////////////////////////////////////////////////////_triganomity = arctan(_triganomity)
	
//	//////////////////////////////////////////////////////////////////////////////if (place_meeting(x,y, obj_floor45)) {
		
//	//////////////////////////////////////////////////////////////////////////////}
//	//////////////////////////////////////////////////////////////////////////////var hypothanoiseu = ((hsp^2) + (vsp^2))
//	//////////////////////////////////////////////////////////////////////////////hypothanoiseu = hypothanoiseu / hypothanoiseu
	
	

//	}
	
	

//}
//if (place_meeting(x + hsp, y, obj_floor)){
//	if (!place_meeting(x+sign(hsp), y, obj_floor)) {
//		x += sign(hsp);
//	}

//	if (place_meeting(x + hsp, y, obj_floor45)) {
//		if (!place_meeting(x+sign(hsp), y, obj_floor45)) {
//			x += sign(hsp);
		
//		}

//		hsp = hsp * 0.5;
//		vsp = vsp * 0.5;
//		var new_vsp = hsp * -1;
//		var new_hsp = vsp * -1;
//		hsp = new_hsp;
//		vsp = new_vsp;
//		if hsp < 0.01 {
//			hsp = 0
//			vsp = 0
//		}
//		if hsp == 0 {
//			vsp = 0
//		}
		
	
//	} else {
//		if (place_meeting(x + hsp, y, obj_floor135)) {
//			if (!place_meeting(x+sign(hsp), y, obj_floor135)) {
//				x += sign(hsp);
		
//			}

//			hsp = hsp * 0.5;
//			vsp = vsp * 0.5;
//			var new_vsp2 = hsp * 1;
//			var new_hsp2 = vsp * -1;
//			hsp = new_hsp2;
//			vsp = new_vsp2;
//			if hsp < 0.01 {
//				hsp = 0
//				vsp = 0
//			}
//			if hsp == 0 {
//				vsp = 0
//			}	
//		} else {
//			if (place_meeting(x + hsp, y, obj_floor157_5)) {
//				if (!place_meeting(x+sign(hsp), y, obj_floor157_5)) {
//					x += sign(hsp);
		
//				}

//				//hsp = hsp * 0.5;
//				//vsp = vsp * 0.5;
//				var new_vsp2 = hsp * 0.2;
//				var new_hsp2 = vsp * 0.8;
//				hsp = new_hsp2;
//				vsp = new_vsp2;
//				if hsp < 0.01 {
//					hsp = 0
//					vsp = 0
//				}
//				if hsp == 0 {
//					vsp = 0
//				}
//			} else {
//				if (place_meeting(x + hsp, y, obj_floor22_5)) {
//					if (!place_meeting(x+sign(hsp), y, obj_floor22_5)) {
//						x += sign(hsp);
		
//					}
//					var new_vsp2 = -hsp * 0.2;
//					var new_hsp2 = -vsp * 0.8;
//					hsp = new_hsp2;
//					vsp = new_vsp2;
//					if hsp < 0.01 {
//						hsp = 0
//						vsp = 0
//					}
//					if hsp == 0 {
//						vsp = 0
//					}
//				} else {

//					hsp = -hsp * 0.5;
//				}
//			}
			
//		}
//	}

//}

//if hsp >= 1 and (place_meeting(x,y,obj_floor)) {
//	y -= 1
	
//}

//if (place_meeting(x,y,obj_floor)) or ((place_meeting(x,y - 1,obj_floor22_5)) or (place_meeting(x,y - 1,obj_floor157_5)) or (place_meeting(x,y - 1,obj_floor135)) or (place_meeting(x,y - 1,obj_floor45)))  {
//	timer += 1;
//}
//if (!place_meeting(x,y,obj_floor)) {
//	timer = 0;
//}

//if timer >= 10 {
//	y -= 1
//}


