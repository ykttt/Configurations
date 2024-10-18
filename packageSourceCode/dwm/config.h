/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx      = 4;        /* border pixel of windows */
static const unsigned int gappx         = 18;       /* window gap pixel */
static const unsigned int snap          = 32;       /* snap pixel */

static const int showbar                = 1;        /* 0 means no bar */
static const int topbar                 = 1;        /* 0 means bottom bar */

/*
 * Occupied tag:
 *
 *              vertoffset,     loffset,        roffset,        hsqueeze
 *      default (box):
 *              0,              0,              0,              1
 *      line on the top:  (<font>:pixelsize=34)
 *              3,              15,             17,             5
 *      short line on the top left: (<font>:pixelsize=34)
 *              15              15,             57,             5
 *
 */
static const int tag_label_vertoffset   = 3;        /* box vertical offset */
static const int tag_label_loffset      = 15;       /* box left offset */
static const int tag_label_roffset      = 17;       /* box right offset */
static const int tag_label_hsqueeze     = 5;        /* box height = boxw / tag_label_hsqueeze *//* min = 1 */

static const int bar_horipad            = 16;       /* horizontal padding pixel of status bar *//* default = 2 */
static const int bar_vertpad            = 6;        /* vertical padding pixel of status bar *//* default = 2 */
static const int bar_horigap            = 18;       /* horizontal gap pixel of status bar */
static const int bar_vertgap            = 18;       /* vertical gap pixel of status bar */

static const char *fonts[]              = { "Hurmit Nerd Font:pixelsize=34" };

static const char col_uns_fg[]          = "#af8260";
static const char col_uns_bg[]          = "#322c2b";
static const char col_uns_bd[]          = "#af8260";
/* static const char col_sel_fg[]          = "#803d3b"; */
static const char col_sel_fg[]          = "#e4c59e";
static const char col_sel_bg[]          = "#322c2b";
static const char col_sel_bd[]          = "#e4c59e";

static const char *colors[][3]          = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_uns_fg, col_uns_bg, col_uns_bd },
	[SchemeSel]  = { col_sel_fg, col_sel_bg,  col_sel_bd  },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance    title       tagmask isfloating monitor */
	{ "zoom",               NULL,       NULL,       0,      1,      0 },
	{ "discord",            NULL,       NULL,       0,      1,      0 },
	{ "steam",              NULL,       NULL,       0,      1,      0 },
	{ "mpv",                NULL,       NULL,       0,      1,      0 },
	{ "fcitx5-config-qt",   NULL,       NULL,       0,      1,      0 },
	{ "Nvidia-settings",    NULL,       NULL,       0,      1,      0 },
	{ "Pavucontrol",        NULL,       NULL,       0,      1,      0 },
	{ "QQ",                 NULL,       NULL,       0,      1,      0 },
};

/* layout(s) */
static const float mfact     = 0.618; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "",      NULL },    /* no layout function means floating behavior */
	{ "",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *runcmd[] = { "rofi", "-show", "run", "-theme", "~/.config/rofi/launchers/type-4/style-9.rasi", NULL };
static const char *dmenucmd[] = { "rofi", "-show", "drun", "-theme", "~/.config/rofi/launchers/type-4/style-9.rasi", NULL };
static const char *windowucmd[] = { "rofi", "-show", "window", "-theme", "~/.config/rofi/launchers/type-4/style-9.rasi", NULL };
static const char *termcmd[]  = { "alacritty", NULL };

static const Key keys[] = {
        /* modifier             key                             function                argument */
	{ MODKEY,               XK_colon,                       spawn,                  {.v = runcmd } },
	{ MODKEY,               XK_semicolon,                   spawn,                  {.v = dmenucmd } },
	{ MODKEY,               XK_w,                           spawn,                  {.v = windowucmd } },
	{ MODKEY,	        XK_Return,                      spawn,                  {.v = termcmd } },
	{ MODKEY,               XK_b,                           togglebar,              {0} },
	{ MODKEY,               XK_j,                           focusstack,             {.i = +1 } },
	{ MODKEY,               XK_k,                           focusstack,             {.i = -1 } },
	{ MODKEY,               XK_a,                           incnmaster,             {.i = +1 } },
	{ MODKEY,               XK_d,                           incnmaster,             {.i = -1 } },
	{ MODKEY,               XK_h,                           setmfact,               {.f = +0.05} },
	{ MODKEY,               XK_l,                           setmfact,               {.f = -0.05} },
	{ MODKEY,               XK_i,                           zoom,                   {0} },
	{ MODKEY,               XK_Tab,                         view,                   {0} },
	{ MODKEY,               XK_q,                           killclient,             {0} },
	{ MODKEY,               XK_t,                           setlayout,              {.v = &layouts[0]} },
	{ MODKEY,               XK_f,                           setlayout,              {.v = &layouts[1]} },
	{ MODKEY,               XK_m,                           setlayout,              {.v = &layouts[2]} },
	{ MODKEY|ControlMask,   XK_f,                           togglefullscreen,       {0} },
	{ MODKEY,               XK_space,                       setlayout,              {0} },
	{ MODKEY|ControlMask,   XK_space,                       togglefloating,         {0} },
	{ MODKEY,               XK_0,                           view,                   {.ui = ~0 } },
	{ MODKEY|ControlMask,   XK_0,                           tag,                    {.ui = ~0 } },
	{ MODKEY,               XK_comma,                       focusmon,               {.i = -1 } },
	{ MODKEY,               XK_period,                      focusmon,               {.i = +1 } },
	{ MODKEY|ControlMask,   XK_comma,                       tagmon,                 {.i = -1 } },
	{ MODKEY|ControlMask,   XK_period,                      tagmon,                 {.i = +1 } },
	TAGKEYS(                XK_1,                                                   0)
	TAGKEYS(                XK_2,                                                   1)
	TAGKEYS(                XK_3,                                                   2)
	TAGKEYS(                XK_4,                                                   3)
	TAGKEYS(                XK_5,                                                   4)
	{ MODKEY|ControlMask,   XK_q,                           quit,                   {0} },
	{ MODKEY,	        XK_u,                           spawn,                  SHCMD("~/library/scripts/lockscreen/lock.sh") },
        { MODKEY,               XK_Print,                       spawn,                  SHCMD("scrot ~/pictures/screenshots/'scr-%Y%m%d-%H%M%S-$wx$h.png'") },
        { 0,                    XK_Print,                       spawn,                  SHCMD("scrot -s ~/pictures/screenshots/scr-'%Y%m%d-%H%M%S-$wx$h.png'") },
        { 0,                    XF86XK_MonBrightnessDown,       spawn,                  SHCMD("xbacklight -dec 5") },
        { 0,                    XF86XK_MonBrightnessUp,         spawn,                  SHCMD("xbacklight -inc 5") },
        { 0,                    XF86XK_AudioMute,               spawn,                  SHCMD("amixer set Master toggle; kill -35 $(pidof dwmblocks)") },
        { 0,                    XF86XK_AudioLowerVolume,        spawn,                  SHCMD("amixer set Master 1%-; kill -35 $(pidof dwmblocks)") },
        { 0,                    XF86XK_AudioRaiseVolume,        spawn,                  SHCMD("amixer set Master 1%+; kill -35 $(pidof dwmblocks)") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

