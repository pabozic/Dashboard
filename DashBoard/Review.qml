import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Rectangle {
    width: breadcrumb.width

    anchors {
        top: breadcrumb.bottom
        topMargin: 25
        left: breadcrumb.left
    }

    Row {
        spacing: 30

        Rectangle {
            id: leftArrow
            height: 370
            width: 80
            color: "#1B2A47"
            border.color: "black"
            border.width: 2

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
                        listView.contentX -= listView.width / 2.95
                        }
                    }
                }
            }
        }
        ListView {
            id: listView
            model: textModel.count
            spacing: 25
            clip: true
            height: 370 * 3
            width: 1570
            contentHeight: 370 * 3
            contentWidth: breadcrumb.width
            orientation: ListView.Horizontal

            // Behavior for the contentX property
            Behavior on contentX {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }

            ListModel {
                id: textModel
                ListElement { text: "Jon Royita"; position: "Founder of Uttara It Park"; color: "#1B2A47"; progress: 0.8; colorProgress: "#24CAA1"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
                ListElement { text: "Fire Foxy"; position: "Founder of Uttara It House"; color: "#1B2A47"; progress: 0.6; colorProgress: "#152036"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
                ListElement { text: "Jon Royita"; position: "Founder of Uttara It Park"; color: "#1B2A47"; progress: 0.3; colorProgress: "#2DB4EE"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
                ListElement { text: "Jon Royita"; position: "Founder of Uttara It Park"; color: "#1B2A47"; progress: 0.8; colorProgress: "#24CAA1"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
                ListElement { text: "Fire Foxy"; position: "Founder of Uttara It House"; color: "#1B2A47"; progress: 0.6; colorProgress: "#152036"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
                ListElement { text: "Jon Royita"; position: "Founder of Uttara It Park"; color: "#1B2A47"; progress: 0.3; colorProgress: "#2DB4EE"; socialMedia: "100 Tweets | 350 Following | 610 Followers"; quote: "To all the athaists attacking me right now, I can't make you believe in \nGod, you have to have faith." }
            }



            delegate: Rectangle {
                id: mainRectangle
                height: 370
                width: breadcrumb.width / 3.09 / 1.142
                color: textModel.get(index).color

                anchors {
                    top: breadcrumb.bottom
                    topMargin: 30
                    left: izbornik.right
                    leftMargin: 30
                }

                Rectangle {
                    id: reserveRectangle
                    color: textModel.get(index).colorProgress
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        left: parent.left
                        right: parent.right

                        topMargin: 20
                        leftMargin: 20
                        rightMargin: 20
                        bottomMargin: 100
                    }

                    width: breadcrumb.width / 4.09
                    height: 180

                Text {
                    text: textModel.get(index).text
                    font.bold: true
                    font.pointSize: 12
                    color: "white"
                    anchors {
                        top: parent.top
                        topMargin: 25
                        //left: parent.left
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Text {
                    text: textModel.get(index).position
                    font.pointSize: 10
                    color: "white"

                    anchors {
                        top: parent.top
                        topMargin: 55
                        //left: parent.left
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    width: 90
                    height: 90
                    radius: 45
                    color: "transparent"
                    border.color: "black"
                    border.width: 1
                    clip: true

                    anchors {
                        top: parent.top
                        topMargin: 90

                        //verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    Image {
                        source: "img/5.webp"
                        anchors.fill :parent
                    }

                }

                Text {
                    text: textModel.get(index).socialMedia
                    font.pointSize: 10
                    color: "white"

                    anchors {
                        top: parent.top
                        topMargin: 200
                        //left: parent.left
                        horizontalCenter: parent.horizontalCenter
                    }
                }
              }

                Text {
                    text: textModel.get(index).text
                    font.bold: true
                    font.pointSize: 12
                    color: "white"
                    anchors {
                    top: reserveRectangle.bottom
                    left: parent.left
                    leftMargin: 20
                    topMargin :20
                    }

                    Text {
                        text: textModel.get(index).quote
                        font.pointSize: 8
                        color: "white"
                        lineHeight: 1.1

                        anchors {
                            top: parent.top
                            topMargin: 32
                            //left: parent.left

                        }
                    }

                }

            }
            }

        Rectangle {
            id: rightArrow
            height: 370
            width: 80
            color: "#1B2A47"
            border.color: "black"
            border.width: 2


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
                        if (listView.contentX < listView.contentWidth - listView.width) {
                            listView.contentX += listView.width * 0.34
                        }
                        }
                }
            }
        }
        }
    }

