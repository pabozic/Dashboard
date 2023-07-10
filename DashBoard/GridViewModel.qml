import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Rectangle {
    width: 640
    height: 480
    color: "transparent"

    GridView {
        id: gridView
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        cellWidth: 640/2.045; cellHeight: 480/2.045
        focus: true
        model: 8
        boundsBehavior: Flickable.StopAtBounds

        delegate: Item {
            width: gridView.cellWidth; height: gridView.cellHeight

            Rectangle {
                color: "white"
                border.color: "black"
                width: gridView.cellWidth; height: gridView.cellHeight
                border.width: 2
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    rightMargin: 10
                    topMargin: 10
                    leftMargin: 22
                    //bottomMargin: 10
                }

                SveZajedno {
                    id: sveZajedno
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                }
            }
        }
    }
}
