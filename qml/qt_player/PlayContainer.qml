import QtQuick 2.0
import QtMultimedia 5.5
import "help.js" as Help

Image {
    id: image
    source :"qrc:///image/screem.png"


    MediaPlayer {
        id: playContainer_mediaPlayer
//        property alias xxx: playContainer_mediaPlayer
        source: "qrc:///video/test.mp4"
        autoPlay: false
        autoLoad: false

        onPlaying: Help.on_video_playing();
        onPaused:  Help.on_video_paused();
        onError:  Help.on_video_error();
        onStopped: Help.on_video_stop();
        onPlaybackStateChanged: console.log("11111111111 --> " + playContainer_mediaPlayer.status)
    }

    VideoOutput {
        id: playContainer_video
        anchors.fill: parent
        fillMode:VideoOutput.Stretch
        source: playContainer_mediaPlayer
    }

    function doMute(isMute){
        playContainer_mediaPlayer.muted = isMute;
    }

    function doPlay(isPlay){
        if(isPlay)
        {
            playContainer_mediaPlayer.play();
        }
        else
        {
            playContainer_mediaPlayer.pause();
        }
    }
}


