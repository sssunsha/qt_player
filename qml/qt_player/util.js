
var util_model_list  = ["qt", "qml", "qt quick", "qt quick control"];


// player root
var size_count = 40;
var player_root_width = 16*size_count;
var player_root_height = 9*size_count;


// player screen view



// player control view
var player_control_height = 1 * size_count;
var player_control_color = "#262626";


// control player
var control_player_width = 1 * size_count;
var control_player_margin = size_count/8;
var control_player_source = "qrc:///image/play.png";
var control_palyer_source_pressed = "qrc:///image/played.png";
var control_player_source_released = control_player_source;
var control_player_source_paused = "qrc:///image/pause.png"


// control progress
var control_progress_width =  8 * size_count;
var control_progress_margin = control_player_margin;
var control_progress_maxvalue = 100.0;
var control_progress_minvalue = 0.0;
var control_progress_defalut_value = 50.0;
var control_progress_bar_background_color = "#181313";
var control_progress_bar_color = "#f12323";


// control time
var control_time_width = 1.5 *size_count;
var control_time_margin = control_player_margin;
var control_time_total = 100;
var control_time_current = 50;
var control_time_margin = control_player_margin;



// control mute
var control_mute_width = 1 * size_count;
var control_mute_margin = size_count/8;
var control_mute_source = "qrc:///image/mute.png";
var control_unmute_source = "qrc:///image/unmute.png";

// control volume
var control_volum_width = 2 * size_count;
var control_volum_margin = size_count/8;
var control_volum_color = "#8F8F8F";

// control fullscreen

var control_fullscreen_source = "qrc:///image/fullscreen.png";
var control_fullscreen_margin = size_count/6;
var control_fullscreen_width = 1 * size_count;
var control_fullscreen_pressed_source = "qrc:///image/fullscreen_pressed.png";

