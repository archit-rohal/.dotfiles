/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10", "fontawesome:size=14" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_matte_black[] = "#282828" ;
static const char col_olympic_blue[] = "#008ECC" ;
static const char col_green[] 	    = "#66FF00";
static const char col_yellow[] 	    = "#FFD300" ;
static const char bright_yellow[]   = "#FFFF00" ;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	/* [SchemeNorm] = { col_gray3, col_gray1, col_gray2 }, */
	/* [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  }, */
	[SchemeNorm] = { col_gray3, col_gray1, col_matte_black },
	[SchemeSel]  = { col_gray4, col_cyan, col_matte_black},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           0,         0,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "St",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
	{ "LF",      NULL,     NULL,           0,         0,          1,           0,        -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	//{ "><>",      NULL },//    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char scratchpadname[] = "scratchpad";
/* static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL }; */
/* static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", "-e", "lf", "/home/mark/temp", NULL }; */
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "190x47", "-e", "/usr/local/bin/chatgpt-chrome.sh", NULL };
/* static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "190x47", "-e", "sh", "-c", "/usr/local/bin/chatgpt-chrome.sh 2>/dev/null", NULL }; */


static const Key keys[] = {

	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ ShiftMask,                    XK_space,  spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_s,      togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
/*	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },*/
	{ MODKEY,                       XK_y,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_bracketleft,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_bracketright,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_a,       zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,             		XK_n,      killclient,     {0} },
	/* { MODKEY,                       XK_s,      setlayout,      {.v = &layouts[0]} }, */
	/* { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} }, */
	/* { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} }, */
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_u,                      0)
	TAGKEYS(                        XK_i,                      1)
	TAGKEYS(                        XK_o,                      2)
	TAGKEYS(                        XK_p,                      3)
	TAGKEYS(                        XK_w,                      4)
	TAGKEYS(                        XK_e,                      5)
	TAGKEYS(                        XK_r,                      6)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	/* { MODKEY, 			XK_semicolon, spawn, SHCMD("rofi -show drun") }, */
	{ MODKEY, 			XK_semicolon, spawn, SHCMD("rofi -modi drun -show drun -line padding 4 -hide-scrollbar -show-icons 2>/dev/null") },
	/*{ MODKEY,			XK_r, spawn, SHCMD("pamixer -i 5") },*/
	/*{ MODKEY,			XK_q, spawn, SHCMD("pamixer -d 5") },*/
	{ MODKEY,			XK_2, spawn, SHCMD("/home/mark/.config/shell_scripts/changevolume.sh up") },
	{ MODKEY,			XK_1, spawn, SHCMD("/home/mark/.config/shell_scripts/changevolume.sh down") },
	{ MODKEY, 			XK_l, spawn, SHCMD("xdg-open \"$(plocate / | rofi -threads 0 -width 100 -dmenu -i -p 'locate')\"") },
    { 0, XK_Print, spawn, SHCMD("maim --select | tee ~/Pictures/Screenshots/sc-$(date +'%d-%m-%Y-(%I:%M:%S%p)').png | xclip -selection clipboard -t image/png") },
    { 0, XK_Print, spawn, SHCMD("maim --select | tee ~/Pictures/Screenshots/sc-$(date +'%d-%m-%Y-(%I:%M:%S%p)').png | xclip -selection clipboard -t image/png") },
    /*{ 0, XF86XK_MonBrightnessUp, spawn, SHCMD("brillo -q -A 10") },
    { 0, XF86XK_MonBrightnessDown, spawn, SHCMD("brillo -q -U 10") },*/
    /*{ MODKEY|ShiftMask,             XK_w, spawn, SHCMD("/home/mark/.config/shell_scripts/rofi-wifi-menu/bash "./rofi-wifi-menu.sh"") },      */
    /*{ MODKEY|ShiftMask, XK_w, spawn, SHCMD("/home/mark/.config/shell_scripts/rofi-wifi-menu/bash \"./rofi-wifi-menu.sh\"") },*/
    { MODKEY, XK_q, spawn, {.v = (char*[]){"/bin/zsh", "-c", "cd ~/.config/shell_scripts/rofi-wifi-menu/ && ./rofi-wifi-menu.sh", NULL}} },
    { MODKEY|ShiftMask, XK_g, spawn, SHCMD("rofi -show emoji") },
    { MODKEY|ShiftMask, XK_c, spawn, SHCMD("rofi -show calc -no-show-match -no-sort") },
    { MODKEY|ShiftMask, XK_l, spawn, SHCMD("st -- vim /home/mark/obsidian-vault/English/Phrases\\ and\\ Idioms.md") },
    { MODKEY|ShiftMask, XK_v, spawn, SHCMD("st -- vim /home/mark/obsidian-vault/English/Words.md") },
    { MODKEY,                       XK_g,      spawn,          SHCMD("st -e zsh -i -c 'lf; exec zsh'") },
    { MODKEY|ShiftMask, XK_b, spawn, SHCMD("/home/mark/.config/rofi-bluetooth/rofi-bluetooth") },
    { MODKEY|ShiftMask, XK_slash, spawn, SHCMD("/home/mark/.config/shell_scripts/rofi_passScript.sh") },
    { MODKEY|ShiftMask, XK_n, spawn, SHCMD("st -- nvim /home/mark/obsidian-vault/") },
    { MODKEY|ControlMask, XK_bracketleft, spawn, SHCMD("/home/mark/.config/shell_scripts/startup_apps.sh")},
    { MODKEY|ControlMask, XK_equal,   spawn,          SHCMD("sudo brillo -q -A 5") },
    { MODKEY|ControlMask, XK_minus,   spawn,          SHCMD("sudo brillo -q -U 5") },
    { MODKEY,   XK_Pause,   spawn,      SHCMD("sudo systemctl restart ly.service")},
    { MODKEY, XK_t, spawn, SHCMD("st -e /bin/zsh -c '/usr/local/bin/play_yt_clip'") },

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

