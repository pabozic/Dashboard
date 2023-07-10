import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item {
    width: 640
    height: 480

    TabBar {
        id: tabView
        width: parent.width
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: 2
            rightMargin: 2
            bottomMargin: 2
        }

        TabButton {
            text: "Progress"
        }

        TabButton {
            text: "Slider"
        }

        TabButton {
            text: "gridView"
        }

        TabButton {
            text: "Final"
        }
    }

    StackLayout {
        anchors.fill: parent
        currentIndex: tabView.currentIndex

        Item {
            id: progressTab

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 2
                anchors.topMargin: 2
                anchors.rightMargin: 2
                width: 620
                height: 50
                color: "#006B79"

                Text {
                    anchors.centerIn: parent
                    text: "Text"
                    font.bold: true
                    color: "white"
                }
            }

            ProgressSlider {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    //fill: parent
                    leftMargin: 80
                    topMargin: 58
                }
            }
        }


        Item {
            id: sliderTab

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 2
                anchors.topMargin: 2
                anchors.rightMargin: 2
                width: 620
                height: 50
                color: "#366AAB"

                Text {
                    anchors.centerIn: parent
                    text: "Text"
                    font.bold: true
                    color: "white"
                }
            }

            Slider {
                anchors.centerIn: parent
            }
        }

        Item {
            id: gridTab

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 2
                anchors.topMargin: 2
                anchors.rightMargin: 2
                width: 620
                height: 50
                color: "#E25F59"

                Text {
                    anchors.centerIn: parent
                    text: "Text"
                    font.bold: true
                    color: "white"
                }
            }

            GridViewTab {
                anchors.centerIn: parent
            }
        }

        Item {
            id: finalTab

            Text {
                text: "TOTAL REVENUE"
                color: "darkgrey"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 10
                font.bold: true
            }

            Slider {
                anchors {
                    left: parent.left
                    top: parent.top
                    leftMargin: 100
                    topMargin: 35
                }
            }

            TextGrid {
                anchors {
                    bottom: parent.bottom
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    leftMargin: 50
                    topMargin: 142
                }
            }
        }
    }
}

