import QtQuick 2.0
import "util.js" as Util

//import QtQml.Models 2.0

Rectangle {
    id : root
    width : 500
    height : 500
    property real block_width: root.width/4
    property real block_height: root.height/4
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#000000" }
        GradientStop { position: 1.0; color: "white" }
    }
    Text {
        id: test_text
        text: qsTr("test text")
        font.family: "Ubuntu"
        font.bold: true
        color : "#0000ff"
        font.pixelSize: 22
        anchors.right: test_grid.left
        anchors.top: root.top
        anchors.topMargin: 50
        anchors.rightMargin: 20
    }

    function handle_test_text_clicked(){
        if( test_text.color == "#0000ff")
        {
            test_text.color = "#00ffff"
        }
        else
        {
            test_text.color = "#0000ff"
        }
    }

    MouseArea{
        id : test_text_mousearea
        anchors.fill: test_text
        property int ccc: 0
        onClicked: {
            console.log("1---- " + ccc)
            handle_test_text_clicked()
            test_text.text = Util.util_model_list[ccc]
            ccc = (++ccc)%4
            console.log("2---- " + ccc)
        }
    }

    Item {
        id : test_image_item
        anchors.left: test_grid.right
        anchors.right: root.right
        anchors.top: root.top
        anchors.bottom: test_grid.top

        Image {
            id: test_image
            source: "qrc:///image/play.png"
            anchors.fill: test_image_item
            sourceSize.height: test_image_item.height
            sourceSize.width: test_image_item.width
            Behavior on rotation {
                NumberAnimation { duration: 1000 }
            }

        }

        MouseArea {
            id : test_image_mousearea
            anchors.fill: test_image
            onClicked: {
                test_image.rotation  += 100
            }
        }
    }

    WButton {
        id : test_willButton
        anchors.left: root.left
        anchors.topMargin: 45
        anchors.right: test_grid.left
        anchors.bottomMargin: 45
        anchors.top: test_grid.bottom
        anchors.bottom: root.bottom
        onClicked: console.log("ooo WButton clicked")
        onPressed: console.log("ooo WButton pressed")
        //        border.color: "yellow"
        border.width: 2
    }

    Rectangle {
        id : test_model_Rectangle
        anchors.left: test_grid.right
        anchors.right: root.right
        anchors.top: test_grid.bottom
        anchors.bottom: root.bottom
        color : "#40537c"
        gradient: Gradient {
            GradientStop {
                position: 0.57;
                color: "#40537c";
            }
            GradientStop {
                position: 1.00;
                color: "#ffffff";
            }
        }

        Repeater{
            model: ListModel {
                ListElement { aaa: "Mercury"; surfaceColor: "gray" }
                ListElement { aaa: "Venus"; surfaceColor: "yellow" }
                ListElement { aaa: "Earth"; surfaceColor: "blue" }
                ListElement { aaa: "Mars"; surfaceColor: "orange" }
                ListElement { aaa: "Jupiter"; surfaceColor: "orange" }
                ListElement { aaa: "Saturn"; surfaceColor: "yellow" }
                ListElement { aaa: "Uranus"; surfaceColor: "lightBlue" }
                ListElement { aaa: "Neptune"; surfaceColor: "lightBlue" }
            }
            //            model : 10
            id : test_repeater
            TextInput {
                color: "#e81f1f"
                text : surfaceColor
                //                text : index
                font.bold: true
                font.pointSize: 10
                anchors.topMargin: 15* index
                anchors.top: parent.top
            }
        }
        //        ListView{
        //            id : test_listview
        //            model : test_repeater.model
        //            anchors.fill: parent

        //        }

    }

    Grid {
        anchors.centerIn: root
        columns: 2
        id : test_grid
        Rectangle {
            id: topLeft
            width: root.block_width;
            height: root.block_width
            color: focus ? "red" : "lightgray"
            focus: true
            border.color: "black"

            KeyNavigation.right: topRight
            KeyNavigation.down: bottomLeft
        }

        Rectangle {
            id: topRight
            width: root.block_width;
            height: root.block_width
            color: focus ? "red" : "lightgray"

            KeyNavigation.left: topLeft
            KeyNavigation.down: bottomRight
        }

        Rectangle {
            id: bottomLeft
            width: root.block_width;
            height: root.block_width
            color: focus ? "red" : "lightgray"

            KeyNavigation.right: bottomRight
            KeyNavigation.up: topLeft
        }

        //        Rectangle {
        //            id: bottomRight
        //            width: root.block_width;
        //            height: root.block_width
        //            color: focus ? "red" : "lightgray"

        //            KeyNavigation.left: bottomLeft
        //            KeyNavigation.up: topRight
        //        }
        ListView {
            id: bottomRight
            width: root.block_width;
            height: root.block_width
            //            color: focus ? "red" : "lightgray"

            KeyNavigation.left: bottomLeft
            KeyNavigation.up: topRight
            model: ListModel{
                id : list_model
                ListElement { ch : "qml"}
                ListElement { ch : "qt"}
                ListElement { ch : "qt quick"}
                ListElement { ch : "qt quick control"}
            }
            delegate: Text {
                text:  'Char['+ index +']: ' + model.ch
                color: "red"
                font.pixelSize:  20
            }
        }

    }
}
