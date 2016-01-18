import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import HelpCpp 1.0

import "util.js" as Util
import "help.js" as Help

Rectangle {
    id : root
    width: Util.player_root_width
    height: Util.player_root_height

    // stop : 0 loaded : 1 playing : 2 paused : 3
    property int play_state: 0
    // unmute : false mute: false
    property bool mute_state: false
    // mark for full screen state
    property bool is_fullscreen: false

    // HelpCpp
    HelpCpp {
        id : help_cpp
    }

    Rectangle {
        id : screen
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: root.top
        anchors.bottom: control.top

        PlayContainer {
            id : play_container
            anchors.fill: screen
        }

        MouseArea {
            id : screen_mouseare
            anchors.fill: screen
            onClicked: Help.handle_screen_click()
            onDoubleClicked: Help.handle_screen_double_click()
        }

    }

    Rectangle {
        id : control
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        height: Util.player_control_height
        color: 	Util.player_control_color

        Player_button {
            id : control_player
            width : Util.control_player_width
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: Util.control_player_margin
            anchors.rightMargin: Util.control_player_margin
            anchors.topMargin: Util.control_player_margin
            anchors.bottomMargin: Util.control_player_margin
            source: (play_state == 2) ? Util.control_player_source_paused : Util.control_player_source

        }

        Rectangle {
            id : control_progress
            anchors.left: control_player.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width : Util.control_progress_width
            anchors.leftMargin: Util.control_progress_margin
            anchors.topMargin: Util.control_progress_margin
            anchors.rightMargin: Util.control_progress_margin
            anchors.bottomMargin: Util.control_progress_margin
            color : parent.color

            Slider {
                id : control_progressbar
                anchors.verticalCenter: parent.verticalCenter
                width : parent.width
                height : parent.height/8
                maximumValue: Util.control_progress_maxvalue
                minimumValue: Util.control_progress_minvalue
                value : Util.control_progress_defalut_value
                style: SliderStyle {
                    groove: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 8
                        color: Util.control_progress_bar_color
                        radius: 5
                    }
                }
            }
        }

        Rectangle {
            id : control_time
            width: Util.control_time_width
            height : parent.height/2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: control_progress.right
            anchors.leftMargin: Util.control_time_margin
            color : parent.color
            Text {
                text : Util.control_time_current + " / " + Util.control_time_total
                font.pixelSize: 12
                color: "#FFFFFF"
                font.italic: true
            }
        }

        Player_button {
            id : control_mute
            width : Util.control_mute_width
            anchors.left: control_time.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: Util.control_mute_margin
            anchors.rightMargin: Util.control_mute_margin
            anchors.topMargin: Util.control_mute_margin
            anchors.bottomMargin: Util.control_mute_margin
            source: (mute_state == false) ? Util.control_unmute_source :
                                            Util.control_mute_source
            onClicked : Help.handle_control_mute_button_clicked();
        }

        Rectangle {
            id : control_volume
            anchors.left: control_mute.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width : Util.control_volum_width
            color : parent.color
            anchors.leftMargin: Util.control_volum_margin
            anchors.topMargin: Util.control_volum_margin
            anchors.rightMargin: Util.control_volum_margin
            anchors.bottomMargin: Util.control_volum_margin
            z: 1

            Slider {
                id : control_progressbar_volum
                anchors.verticalCenter: parent.verticalCenter
                width : parent.width
                height : parent.height/8
                maximumValue: Util.control_progress_maxvalue
                minimumValue: Util.control_progress_minvalue
                value : Util.control_progress_defalut_value
                style: SliderStyle {
                    groove: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 8
                        color: Util.control_volum_color
                        radius: 5
                    }
                }
            }

        }

        Player_button {
            id : control_fullscreen
            width : Util.control_fullscreen_width
            anchors.left: control_volume.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: Util.control_fullscreen_margin
            anchors.rightMargin: Util.control_fullscreen_margin
            anchors.topMargin: Util.control_fullscreen_margin
            anchors.bottomMargin: Util.control_fullscreen_margin
            source: Util.control_fullscreen_source
            onPressed : {
                control_fullscreen.source = Util.control_fullscreen_pressed_source
            }
            onReleased: {
                control_fullscreen.source = Util.control_fullscreen_source
                Help.handle_control_fullscreen_button_released();
            }

        }
    }
}
