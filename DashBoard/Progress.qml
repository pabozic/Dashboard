import QtQuick 2.0
import QtQuick.Controls 2.15

ProgressBar {
    id: control
    property int broj: 0
    property alias ddd: ddd
    property alias gogo: gogo
    property alias tekst: tekst
    value: broj / 100
    padding: 2

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        color: "black"
        radius: 50

        Text {
            id: tekst
            anchors.bottom: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            text: "Progress"
            color: "black"
        }
    }

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 4

        Rectangle {
            id: trueBar
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 50
            color: {
                if (broj < 40)
                    "red"
                else
                    "blue"
            }

            Behavior on width {
                NumberAnimation {
                    duration: 500
                }
            }
        }
    }

    Rectangle {
        id: gogo
        x: parent.x
        radius: 50
        height: parent.height
        color: trueBar.color
        opacity: 0.5
        width: {
            if (broj <= 20)
                trueBar.width / 3
            else
                40
        }
    }

    PropertyAnimation {
        id: one
        target: gogo
        property: "x"
        from: gogo.x
        to: trueBar.width - gogo.width
        duration: 500
    }

    Timer {
        id: ddd
        interval: 800; running: true; repeat: true
        onTriggered: {
            gogo.x = parent.x
            one.start()
            gogo.visible = true
        }
    }

    Text {
        id: postotak
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        x: {
            if (broj >= 15)
                trueBar.width - 30
            else
                trueBar.width + 5
        }
        color: "white"
        font.pixelSize: 12
        text: broj + "%"
        z: 856412
    }
}


