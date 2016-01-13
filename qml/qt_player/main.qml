import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.0
Rectangle {
    id: main_view
    width: 500
    height: 200
    color: "#010414"
    radius: 20
    border.width: 5
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#010313"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    Label {
        id: label_music_name
        text: qsTr("music name:")
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        color: "#467fb4"
        font.pixelSize: 22
    }

    Slider {
        id: progress_bar
        y: 25
        height: 22
        stepSize: 1
        minimumValue: 0
        maximumValue: 100
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 164
    }

    MediaPlayer{
        id : media_palyer
        source: "The_Monster_Eminem.mp3"
        autoLoad: true
        autoPlay: false
    }

    Button {
        id: quit_button
        x: 391
        y: 147
        width: 75
        height: 23
        text: qsTr("quit")
        onClicked: Qt.quit()
    }

    Button {
        id: load_button
        x: 301
        y: 147
        text: qsTr("load")
    }

    Button {
        id: play_button
        x: 27
        y: 147
        text: qsTr("play")
        onClicked: {
            media_palyer.play()
        }
    }

    Button {
        id: pause_button
        x: 122
        y: 147
        text: qsTr("pause")
        onClicked: {
            media_palyer.pause()
        }
    }
}
