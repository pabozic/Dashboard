import QtQuick 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: progress


    ListModel {
        id: textModel
        ListElement { textHeader : "Test."; date: "Feb 2015, 15:13"; endDate: "Feb 2022, 16:35" }
        ListElement { textHeader : "Test1." ; date: "Feb 2015, 15:14"; endDate: "Feb 2022, 16:35"}
        ListElement { textHeader : "Test2." ; date: "Feb 2015, 15:15"; endDate: "Feb 2022, 16:35"}
        ListElement { textHeader : "Test."; date: "Feb 2015, 15:13"; endDate: "Feb 2022, 16:35" }
        ListElement { textHeader : "Test1." ; date: "Feb 2015, 15:14"; endDate: "Feb 2022, 16:35"}
        ListElement { textHeader : "Test2." ; date: "Feb 2015, 15:15"; endDate: "Feb 2022, 16:35"}
    }

Row {
    id: row
    spacing: 5

        Rectangle {
            z: 1
            id: headerRectangle
            width: breadcrumb.width/2 - row.spacing
            height: 50
            color: "#054d66"
            border.color: "white"

            Text {
                text: "timeLine Modul"
                color: "white"
                font.bold: true
                font.pixelSize: 16
                anchors.centerIn: parent
            }

            Rectangle {
                width: parent.width
                height: 360
                color: "white"

                anchors {
                    top: parent.top
                    topMargin: parent.height
                }

                Rectangle {
                    id: borderRectangle
                    color: "transparent"
                    border.width: 2
                    border.color: "#e7e7e7"

                    anchors {
                        top: parent.top
                        left: parent.left
                        leftMargin: 20
                        right: parent.right
                        rightMargin: 20
                        bottom: parent.bottom
                        bottomMargin: 20
                    }


                    TabBar {
                        visible : !(index === 1)
                        id: bar

                        anchors {
                            right: parent.right
                            top: borderRectangle.top
                            topMargin: 20
                            rightMargin: 10
                        }

                        background: Rectangle {
                            color: "transparent"
                        }

                        TabButton {
                            width: 25
                            height: 25
                            background: Rectangle {
                                color: bar.currentIndex == 0 ? "#006b79" : "#353636"
                            }

                            Image {
                                source: "img/352204_list_view_icon.svg"
                                width: 20
                                height: 20
                                anchors.centerIn: parent
                            }
                        }

                        TabButton {
                            width: 25
                            height: 25
                            background: Rectangle {
                                color: bar.currentIndex == 1 ? "#006b79" : "#353636"
                            }

                            Image {
                                source: "img/3669149_module_ic_view_icon.svg"
                                width: 20
                                height: 20
                                anchors.centerIn: parent
                            }
                        }
                    }

                    StackLayout {
                        visible : !(index === 1)
                        anchors.fill: parent
                        currentIndex: bar.currentIndex

                        Item {
                            Rectangle {
                                id: verticalLine
                                height: 340
                                width: 1
                                color: "#dcdcdc"

                                anchors {
                                    left: parent.left
                                    top: parent.top
                                    leftMargin: 207.5
                                }
                            }


                    Item {
                        visible : !(index === 1)
                        id: grid
                        //rows: 3
                        //spacing: 80
                        anchors {
                            left: parent.left
                            leftMargin: 240
                            top: parent.top
                            topMargin: 28
                        }

                        ListView {
                            model: textModel.count
                            spacing: 80
                            id: listView
                            contentWidth: parent.width
                            contentHeight: parent.height
                            width: 200 * 6
                            height: 255
                            delegate:
                            Rectangle {
                                width: 200
                                height: 30
                                radius: 2
                                border.color: "#dcdcdc"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        field1.text = textModel.get(index).textHeader
                                        field2.text = textModel.get(index).date
                                        field3.text = textModel.get(index).endDate
                                    }
                                }
                                Image {
                                    source: "img/9041286_hexagon_fill_icon.svg"
                                    anchors {
                                        left: parent.left
                                        leftMargin: - 40
                                        top: parent.top
                                        topMargin: 6
                                    }
                                    }




                            Text {id: header;text: textModel.get(index).textHeader; anchors.centerIn: parent; font.bold: true

                            }

                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.left: parent.right
                                width: 140
                                height: 25
                                color: "#4acff5"



                                Text {id: dateAndTime; text:textModel.get(index).date; color:"white"; anchors.centerIn: parent }
                            }

                            Rectangle {
                                anchors {
                                    top: parent.bottom
                                    left: parent.left
                                }

                                    width: 340
                                    height: 50
                                    border.color: "#dcdcdc"
                                    color: "white"

                                }

                            Rectangle {
                                id: date2
                                anchors.bottom: parent.bottom
                                anchors.right: parent.left
                                anchors.rightMargin: 60
                                anchors.bottomMargin: 3
                                width: 140
                                height: 25
                                color: "#4acff5"

                                Text {id: dateAndTime2; text:textModel.get(index).date; color:"white"; anchors.centerIn: parent }


                            }

                            Rectangle {
                                z: -1
                                height: 1
                                width: 60
                                color: "#dcdcdc"

                                anchors {
                                    left: date2.right
                                    verticalCenter: date2.verticalCenter
                                }
                            }

                            }
                        }

                    }
                }

                    TableQml {
                        clip: true
                        anchors {
                            top: parent.top
                            topMargin: 50
                            left: parent.left
                            leftMargin: 10
                            right: parent.right
                            rightMargin: 10
                            bottom: parent.bottom
                            bottomMargin: 10
                        }


                    }
                    }

                        }


                    }
                }

        Rectangle {
            z: 1
            id: headerRectangle2
            width: breadcrumb.width/2 - row.spacing
            height: 50
            color: "#054d66"
            border.color: "white"

            Text {
                text: "timeLine Modul"
                color: "white"
                font.bold: true
                font.pixelSize: 16
                anchors.centerIn: parent
            }

            Rectangle {
                width: parent.width
                height: 360
                color: "white"

                anchors {
                    top: parent.top
                    topMargin: parent.height
                }

                Rectangle {
                    id: borderRectangle2
                    color: "transparent"
                    border.width: 2
                    border.color: "#e7e7e7"

                    anchors {
                        top: parent.top
                        left: parent.left
                        leftMargin: 20
                        right: parent.right
                        rightMargin: 20
                        bottom: parent.bottom
                        bottomMargin: 20
                    }

                    TableQml {
                                            clip: true
                                            anchors {
                                                top: parent.top
                                                topMargin: 90
                                                left: parent.left
                                                leftMargin: 10
                                                right: parent.right
                                                rightMargin: 10
                                                bottom: parent.bottom
                                                bottomMargin: 40
                                            }
                    }






                    Grid {
                        visible : !(index === 1)
                        id: mainLayout
                        rows: 1
                        spacing: 200
                        anchors {
                            top: parent.top;
                            topMargin: 20
                            left: parent.left
                            leftMargin: 60
                            right: parent.right
                        }


                        Label {id: label; text: "Naziv servisa: ";font.bold: false; font.pixelSize: 14

                        TextField { id: field1
                            height: parent.height*1.5
                            text:""
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.right
                            leftMargin: 4
                        }

                        background: Rectangle {
                            implicitWidth: 140
                            implicitHeight: parent.height
                            color: "#dcdcdc"
                            radius: 2
                        }
                        }
}

                        Label {
                            text: "Početak: ";font.bold: false; font.pixelSize: 14


                        TextField { id: field2
                            height: parent.height*1.5
                            text:""
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.right
                            leftMargin: 4
                        }

                        background: Rectangle {
                            implicitWidth: 140
                            implicitHeight: parent.height
                            color: "#dcdcdc"
                            radius: 2
                        }
                        }
}

                        Label { text: "Kraj: ";font.bold: false; font.pixelSize: 14
                        TextField { id: field3
                            height: parent.height*1.5
                            text: ""
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.right
                            leftMargin: 4
                        }

                        background: Rectangle {
                            implicitWidth: 140
                            implicitHeight: parent.height
                            color: "#dcdcdc"
                            radius: 2
                        }
                        }
}

                    }

                    Button {
                        height: 20
                        Text {
                            text:"Detalji servisa"
                            anchors.centerIn: parent
                        }

                        anchors {
                            right: borderRectangle2.right
                            bottom: borderRectangle2.bottom
                            rightMargin: 10
                            bottomMargin: 10
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                tabBar.currentIndex = 2
                                breadcrumb.selectedRectIndex = 2
                            }
                        }
                    }
                }
            }
        }
            }
        }




