import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: root
    width: breadcrumb.width

    anchors {
        top: breadcrumb.bottom
        topMargin: 25
        left: breadcrumb.left
    }

    ListModel {
        id: textModel
        ListElement { text: "Orders"; value: "10,000"; color: "#1B2A47"; progress: 0.8; colorProgress: "#24CAA1" }
        ListElement { text: "Tax Deduction"; value: "5,000"; color: "#1B2A47"; progress: 0.6; colorProgress: "#E74A4A" }
        ListElement { text: "Revenue"; value: "$70,000"; color: "#1B2A47"; progress: 0.3; colorProgress: "#2DB4EE" }
        ListElement { text: "Yearly Sales"; value: "$100,000"; color: "#1B2A47"; progress: 0.8; colorProgress: "#7E59BA" }
        ListElement { text: "Orders"; value: "10,000"; color: "#1B2A47"; progress: 0.2; colorProgress: "#24CAA1" }
        ListElement { text: "Tax Deduction"; value: "5,000"; color: "#1B2A47"; progress: 0.3; colorProgress: "#E74A4A" }
        ListElement { text: "Revenue"; value: "$70,000"; color: "#1B2A47"; progress: 0.4; colorProgress: "#2DB4EE" }
        ListElement { text: "Yearly Sales"; value: "$100,000"; color: "#1B2A47"; progress: 0.5; colorProgress: "#7E59BA" }
    }

    Row {
        id: rowContainer
        spacing: 30

        Rectangle {
            id: leftArrow
            height: 120
            width: 80
            color: "#1B2A47"
            border.color: "black"
            border.width: 2

            anchors {
                top: root.top
                left: breadcrumb.left
            }

            Image {
                id: leftArrowPic
                source: "img/left-arrow.png"
                width: 40
                height: 40

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (listView.contentX > 0) {
                        listView.contentItem.forceActiveFocus()
                        listView.currentIndex = listView.model.count - 1
                        listView.positionViewAtEnd()
                        listView.contentX = 0
}
                    }
                }
            }
        }


        ListView {
            spacing: 25
            id: listView
            model: textModel.count
            orientation: ListView.Horizontal
            //snapMode: listView.SnapOneItem
            clip: true

            height: 120*4
            width: 1570
            contentHeight: 120*4
            contentWidth: breadcrumb.width
            // Behavior for the contentX property
            Behavior on contentX {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }


            delegate: Rectangle {
                height: 120
                width: breadcrumb.width / 4.82
                color: textModel.get(index).color

                anchors {
                    top: breadcrumb.bottom
                    topMargin: 25
                    left: izbornik.right
                    leftMargin: 25
                }

                Text {
                    text: textModel.get(index).text
                    font.bold: true
                    font.pointSize: 12
                    color: "white"
                    anchors {
                        top: parent.top
                        topMargin: 25
                        left: parent.left
                        leftMargin: 20
                    }
                }

                Text {
                    id: textNumber
                    text: textModel.get(index).value
                    font.bold: true
                    font.pointSize: 12
                    color: "white"
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 25
                        right: parent.right
                        rightMargin: 20
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 8

                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 10
                        left: parent.left
                        leftMargin: 20
                        right: parent.right
                        rightMargin: 20
                    }

                    Rectangle {
                        width: parent.width * textModel.get(index).progress
                        height: parent.height
                        color: textModel.get(index).colorProgress
                    }

                    Rectangle {
                        x: parent.width * textModel.get(index).progress
                        width: parent.width * (1 - textModel.get(index).progress)
                        height: parent.height
                        color: "gray"
                    }
                }
            }
        }

        Rectangle {
            id: rightArrow
            height: 120
            width: 80
            color: "#1B2A47"
            border.color: "black"
            border.width: 2

            anchors {
                top: root.top
                right: breadcrumb.right
            }


            Image {
                id: rightArrowPic
                source: "img/right-arrow.png"
                width: 40
                height: 40

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listView.contentItem.forceActiveFocus()
                        listView.currentIndex = listView.model.count - 1
                        //listView.positionViewAtEnd()
                        listView.contentX = listView.width * 1.008
                    }
                }
            }
        }
    }
}






