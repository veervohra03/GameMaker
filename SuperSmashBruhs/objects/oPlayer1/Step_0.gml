if (hascontrol)
{
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check(ord("W"));
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

// ---------- Calculate movement ----------
var move = key_right - key_left

hsp = move * walksp;

vsp = vsp + grv;

if (move == 1) drction = 1;
else drction = -1;

// ---------- Jumping ----------
canjump -= 1;
if (canjump > 0) && (key_jump)
{
	vsp = -9;
	canjump = 0;
}

// ---------- Horizonal Collision ----------
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// ---------- Vertical Collision ----------
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// ---------- Animation ----------
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayer1A;
	image_speed = 0;
	if (sign(vsp)>0) image_index = 1; else image_index = 0;
}
else
{
	canjump = 10;
	if (sprite_index == sPlayer1A) audio_play_sound(snLanding,4,false);
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer1;
	}
	else
	{
		sprite_index = sPlayer1R;
	}
}

// ---------- Flipping the image ----------
if (hsp != 0) image_xscale = sign(hsp);

if (hsp > 0)
{
	with (oGunP1)
	{
		image_angle = 0;
		image_yscale = 1;
	}
}
if (hsp < 0)
{
	with (oGunP1)
	{
		image_angle = 180;
		image_yscale = -1;
	}
}