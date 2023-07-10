import QtQuick 2.4

Rectangle {
    width: Breadcrumb.width
    height: 60
    color: "white"

    ListModel {
        id: textModel
        ListElement { text: "Total Users"; textNumb: "2500"; color: "#869fb7" }
        ListElement { text: "Average Time"; textNumb: "123.50"; color: "#869fb7" }
        ListElement { text: "Total Males"; textNumb: "2,500"; color: "#2ebc88" }
        ListElement { text: "Total Females"; textNumb: "4,567"; color: "#869fb7" }
        ListElement { text: "Total Collections"; textNumb: "2,315"; color: "#869fb7" }
        ListElement { text: "Total Connections"; textNumb: "7,325"; color: "#869fb7" }
    }

    Row {
        spacing: 60

        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 25
            topMargin: 6
        }

        Repeater {
            model: textModel.count

            Rectangle {
                color: "transparent"
                height: 60
                width: breadcrumb.width / 27

                Image {
                    id: image
                    source:"img/285645_user_icon.svg"
                    scale: 0.5

                    anchors {
                        left: parent.left
                        leftMargin: -20
                        top:parent.top
                        topMargin: -5
                    }
                     }


                Text {
                    text: textModel.get(index).text
                    color: "#869fb7"
                    font.pixelSize: 12
                    }

                    Text {
                        text: textModel.get(index).textNumb
                        color: textModel.get(index).color
                        font.bold: true
                        font.pixelSize: 24

                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 10
                            left: image.left
                            leftMargin: 6
                        }
                    }

                Rectangle {
                    visible: !(index === 5)
                    width: 2
                    height: 44
                    color: "#869fb7"

                    anchors {
                        left: parent.left
                        leftMargin: 100
                        top: parent.top
                        topMargin: 2
                    }
                }
        }
    }
}
}
