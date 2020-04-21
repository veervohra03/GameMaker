if (done == 0)
{
	vsp = vsp + grv;

	// ---------- Horizonal Collision ----------
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = -hsp;
	}
	x = x + hsp;


	// ---------- Vertical Collision ----------
	if (place_meeting(x,y+vsp,oWall))
	{
		if (vsp > 0) 
		{
			done = 1;
			alarm[0] = 60;
			image_index = 1;
		}
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp
}