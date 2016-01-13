// Player_button.qml

import QtQuick 2.0

Image {
    id: image
    // export button properties
    source :"qrc:///image/star-icon.png"

    signal clicked
    signal pressed
    signal released

    MouseArea {
        anchors.fill: parent
        onClicked: {
            image.clicked()
        }

        onPressed: {
            image.pressed()
        }

        onReleased: {
            image.released()
        }

    }
}
