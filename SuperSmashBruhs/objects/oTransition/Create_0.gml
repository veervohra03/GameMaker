// Size, variables and mode
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5
percent_target = 1.2

enum TRANS_MODE
{
	OFF = 5,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
