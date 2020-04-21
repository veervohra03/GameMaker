x = oPlayer2.x;
y = oPlayer2.y + 10;

recoil = max(0,recoil - 1);

if (keyboard_check_pressed(ord("M"))) and (firing_delay == 0)
{
	firing_delay = 1;
	recoil = 4;
	//ScreenShake(2,10);
	image_speed = 1;
	audio_play_sound(snShoot,10,false);
	with (instance_create_layer(x,y,"Bullets",oBullet2))
	{
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

// ---------- Recoil ----------
x = x - lengthdir_x(recoil, image_angle)
y = y - lengthdir_y(recoil, image_angle)

// ---------- Rotating gun to face right direction ----------
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}
