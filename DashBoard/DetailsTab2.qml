import QtQuick 2.3
import QtCharts 2.15


Item {

    ListModel {
        id: textModel
        ListElement { textHeader : "Threat Detection"; }
        ListElement { textHeader : "Resource Security Alerts" ;}
    }

    ListModel {
        id: servesModel
        ListElement { textHeader : "High Serves"; }
        ListElement { textHeader : "Medium Serves" ;}
        ListElement { textHeader : "Low Serves" ;}
    }

Row {
    id: row
    spacing: 5

    Repeater {
        model: 2
        Rectangle {
            z: 1
            id: headerRectangle
            width: breadcrumb.width/2 - row.spacing
            height: 50
            color: "#054d66"
            border.color: "white"

            Text {
                text: textModel.get(index).textHeader
                color: "white"
                font.bold: true
                font.pixelSize: 16
                anchors.centerIn: parent
            }

            Rectangle {
                width: parent.width
                height: 340
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

                    ChartView {
                        width: 600
                        height: 350
                        title: "Stacked Bar series"
                        legend.alignment: Qt.AlignBottom
                        antialiasing: true

                        anchors.fill: parent

                        StackedBarSeries {
                            id: mySeries
                            axisX: BarCategoryAxis { categories: ["24Sun", "25Sun", "26Sun", "27Sun", "10Sun", "11Sun" ] }
                            BarSet { values: [200, 200, 300, 400, 500, 600]; color: "#93de7a" }
                            BarSet { values: [500, 100, 200, 400, 100, 600]; color:"#50b931" }
                            BarSet { values: [300, 500, 600, 600, 500, 600]; color: "#285d71" }
                        }
                    }




            }
        }
    }
}
}
}
