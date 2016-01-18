
// component event handle function for the player

function handle_screen_click(){
    switch(play_state)
    {
    case 0:
        // the state is stopped, change to play
        play_container.doPlay(true);
        break;
    case 1:
        break;
    case 2:
        // the state is playing, change to paused
        play_container.doPlay(false);
        break;
    case 3:
        // the state is paused, change to paused
        play_container.doPlay(true);
        break;
    }
}


function handle_screen_double_click(){
    if(is_fullscreen)
    {
        is_fullscreen = false;
        console.log("handle_screen_double_click --> change to screen " + is_fullscreen);
        help_cpp.handleFullScreen(is_fullscreen);
    }
    else
    {
        is_fullscreen = true;
        console.log("handle_screen_double_click --> change to screen " + is_fullscreen)
        help_cpp.handleFullScreen(is_fullscreen);
    }
}

function handle_control_play_button_released(){
    handle_screen_click();
}

function handle_control_mute_button_clicked(){
    if(mute_state)
    {
        mute_state = false;
    }
    else
    {
        mute_state = true;
    }
    play_container.doMute(mute_state);

}


function handle_control_fullscreen_button_released(){
    handle_screen_double_click();
}

// control function for the player


// stop : 0 loaded : 1 playing : 2 paused : 3 error : -1
function on_video_loaded(){
    play_state = 1;
    console.log("video is loaded ..." + play_state + " -- " + playContainer_mediaPlayer.playbackState);
}

function on_video_playing(){
    play_state = 2;
    console.log("video is playing ..." + play_state + " -- " + playContainer_mediaPlayer.playbackState);
}

function on_video_paused(){
    play_state = 3;
    console.log("video is paused ..." + play_state + " -- " + playContainer_mediaPlayer.playbackState);
}

function on_video_stop(){
    play_state = 0;
    console.log("video is stopped ..." + play_state + " -- " + playContainer_mediaPlayer.playbackState);
}

function on_video_error(){
    play_state = -1;
    console.log("video is error ..." + play_state + " -- " + playContainer_mediaPlayer.playbackState);
}

