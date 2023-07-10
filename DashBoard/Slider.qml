import QtQuick 2.14
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Item {
    id: progress
    implicitWidth: 200/2.045
    implicitHeight: 200/2.045

    property bool roundCap: true
    property int startAngle: -90
    property color bgColor: "transparent"
    property real maxValue: 100
    property real value: 0
    property color bgStrokeColor: "#7e7e7e"
    property int strokeBgWidth: 8
    property color progressColor: "#D21F3C"
    property int progressWidth: 8
    property int samples : 12
    property string textValue: "MJERNA VELIČINA"
    property bool textShowValue: true
    property int textSize: 12
    property string textFontFamily: "Roboto"
    property color textColor: "#000000"


    Shape {
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progress.samples // --> smooth

        ShapePath {
            id:pathBG
            strokeColor: progress.bgStrokeColor // --> #7e7e7e
            fillColor: progress.bgColor // --> transparent
            strokeWidth: progress.strokeBgWidth // --> 16
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle:  360
            }

    }

        ShapePath {
            id:path
            strokeColor: progress.progressColor
            fillColor: "transparent"
            strokeWidth: progress.progressWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                id: pathAngleArc
                radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle:  0
                Behavior on sweepAngle { NumberAnimation { duration: 500 } }
            }


        }

        Text {
            text: progress.value
            id: textProgress
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: progress.textColor
            font.pointSize: progress.textSize
            font.family: progress.textFontFamily

            Text {
                text: progress.textValue
                anchors.top: parent.top
                anchors.topMargin: 25
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 4
                font.family: progress.textFontFamily
                color: "black"

        }


}


        Timer {
            id:timer
            interval: 3000; running: true; repeat: true;
            onTriggered: {
                value = Math.floor(Math.random() * 101);

                if (value>=maxValue+1) {
                    value = 0
                    timer.restart()
                }

                pathAngleArc.sweepAngle = 360 / maxValue * value;
            }
        }

    }
}

