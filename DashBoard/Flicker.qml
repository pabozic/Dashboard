import QtQuick 2.4

Item {

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
                listView.contentItem.forceActiveFocus()
                listView.currentIndex = listView.model.count - 1
                listView.positionViewAtEnd()
                listView.contentX = 0
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
                listView.contentItem.forceActiveFocus()
                listView.currentIndex = listView.model.count - 1
                //listView.positionViewAtEnd()
                listView.contentX = listView.width * 1.019
            }
        }
    }
}

}
