import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    id: mainItem
    width: breadcrumb.width / 4.19

    ListModel {
        id: textModel
        ListElement { text: "Total Visit"; value: "8659"; color: "#1B2A47"; } // value = 0
        ListElement { text: "Total Page Views"; value: "7469"; color: "#1B2A47"; }
        ListElement { text: "Unique Visitor"; value: "6011"; color: "#1B2A47"; }
        ListElement { text: "Bounce Rate"; value: "18%"; color: "#1B2A47"; }
        ListElement { text: "Total Visit"; value: "8659"; color: "#1B2A47"; } // value = 0
        ListElement { text: "Total Page Views"; value: "7469"; color: "#1B2A47"; }
        ListElement { text: "Unique Visitor"; value: "6011"; color: "#1B2A47"; }
        ListElement { text: "Bounce Rate"; value: "18%"; color: "#1B2A47"; }
    }

    ListModel {
        id: graphModel
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
        ListElement {graphColor: "#24CAA1"}
    }


    property color graphColor: ["#24CAA1","#24CAA1","#24CAA1","#24CAA1","#24CAA1","#24CAA1","#24CAA1","#24CAA1"]

    property var heights: [20, 10, 40, 20, 35, 30, 20, 10]
    property int colorIndex: 0

    Column {
        id: column
        spacing: 15

        Rectangle {
            height: 50
            width: breadcrumb.width / 4.19
            color: textModel.get(0).color
            border.color: "black"
            border.width: 2

            Image {
                source: "img/left-arrow.png"
                rotation: 90
                width: 40
                height: 40

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (listView.contentY > 0) {
                        listView.contentY -= listView.height / 3.8
                        }
                    }
                }
            }
        }

        ListView {
            id: listView
            spacing: 15
            model: textModel.count
            clip: true
            height: 95*4 + 45
            width: breadcrumb.width / 4.82 * 4.215
            contentHeight: 95*4 + 45 + 95
            contentWidth: breadcrumb.width / 4.82 * 4.215
            orientation: ListView.Vertical

            Behavior on contentY {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }

            delegate: Rectangle {
                id: textContainer
                height: 95
                width: breadcrumb.width / 4.19
                color: textModel.get(index).color

                Text {
                    id: textMain
                    text: textModel.get(index).text
                    font.bold: true
                    font.pointSize: 12
                    color: "white"

                    anchors {
                        left: parent.left
                        leftMargin: 20
                        top: parent.top
                        topMargin: 8
                    }
                }

                Text {
                    text: textModel.get(index).value
                    color: "white"
                    font.bold: true
                    font.pointSize: 12

                    anchors {
                        right: parent.right
                        rightMargin: 20
                        verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                        leftMargin: 20
                        bottomMargin: 8
                    }
                    rotation: 180
                    id: row
                    spacing: 5
                    //property int colorIndex: 0

                    Repeater {
                        id: repeater
                        model: heights.length

                        Rectangle {
                            id: rectangleGraph
                            width: 5
                            height: heights[index]
                            color: graphModel.get(index).graphColor

                            ToolTip {
                                    id: tooltip
                                    text: rectangleGraph.height.toString()*100
                                }

                                MouseArea {
                                    hoverEnabled: true
                                    onEntered: tooltip.open()
                                    onExited: tooltip.close()
                                    anchors.fill: parent
                                }
                        }
                    }
                }
            }
        }

        Rectangle {
            height: 50
            width: breadcrumb.width / 4.19
            color: textModel.get(0).color
            border.color: "black"
            border.width: 2

            Image {
                source: "img/right-arrow.png"
                rotation: 90
                width: 40
                height: 40


                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (listView.contentY < listView.contentHeight - listView.height) {
                            listView.contentY += listView.height / 3.8

                        }
                    }
                }
            }
        }
    }
}








