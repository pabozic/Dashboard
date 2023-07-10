import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Rectangle {
    width: 640/2.045 //
    height: 400/2.045 //
    color: "transparent"

    ListModel {
        id: myModel
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "VALUE" }
        ListElement { name: "" }
        ListElement { name: "WEIGHT" }
        ListElement { name: "" }
        ListElement { name: "SCORE" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "Item 1" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "83.5" }
        ListElement { name: "0" }
        ListElement { name: "100" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "Item 2" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "83.5" }
        ListElement { name: "0" }
        ListElement { name: "100" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "Item 3" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "" }
        ListElement { name: "83.5" }
        ListElement { name: "0" }
        ListElement { name: "100" }
        ListElement { name: "" }
        ListElement { name: "" }
    }

    GridView {
        anchors {
            fill: parent
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            topMargin: 60
        }
        cellWidth: 70/2.045
        cellHeight: 50/2.045
        model: myModel
        delegate: Rectangle {
            color: "lightgray"
            border.color: "black"
            border.width: 1
            Text {
                text: name
                font.family: "Roboto"
                color: "darkgrey"
                anchors.centerIn: parent
            }
        }
    }
}

