//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

        {"",
                "~/library/scripts/dwmblocks/snd.sh",
        0, 1},

	{"",
                "~/library/scripts/dwmblocks/bat.sh",
        2, 0},

	{"",
                "~/library/scripts/dwmblocks/net.sh",
        2, 2},

        {"󱑂  ",
                "date '+%H:%M'",					        
        1, 0},

	{"󰃭  ",
                "LC_ALL=en_GB.UTF8 date '+%m/%d %a'",					        
        1, 0},

};
//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "   ";
static unsigned int delimLen = 5;
