import QtQuick 2.4
import QtCharts 2.3

Item {

    ListModel {
        id: textModel
        ListElement { color: "#285d71"; text: "High Severity"; textPermission: "Install th..."; textDevices: "55 lot devices"; textDesc: "1 Hubs"; textNumb: "55"; progress: 0.8; colorProgress: "#24CAA1"; image: "img/20601504151557740339.svg"; textHeader : "Device Recommendation"}
        ListElement { color: "#5fccf4"; text: "Medium Severity"; textPermission: "Permission"; textDevices: "1 lot devices";textDesc: "612 Device"; textNumb: "2"; progress: 0.6; colorProgress: "#E74A4A"; image: "img/20601504151557740339_1.svg"; textHeader : "Health Monitoring" }
        ListElement { color: "#69bc4d"; text: "Low Severity"; textPermission: "Permission"; textDevices: "1 lot devices";textDesc: "17 Repours"; textNumb: "0"; progress: 0.3; colorProgress: "#2DB4EE"; image: "img/20601504151557740339_2.svg"; textHeader : "Most Prevalent Device Recommendation" }
    }

    Row {
        id: row
        spacing: 5

        Repeater {
            model: 3
            Rectangle {
                z: 1
                id: headerRectangle
                width: breadcrumb.width/3 - row.spacing
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
                    //border.color: "white"
                    //border.width: 2

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

                        Text {
                            visible: index === 0
                            text: "Unhealty devices"

                            anchors {
                                verticalCenter: slider.verticalCenter
                                right: parent.right
                                rightMargin: 58
                            }

                            Text {
                                text: "56"
                                font.bold: true
                                anchors {
                                    horizontalCenter: parent.horizontalCenter
                                    bottom: parent.top
                                    bottomMargin: 5
                                }
                            }


                        }

                        Slider {
                        id: slider
                        visible: (index === 0)
                        progressWidth: 22
                        strokeBgWidth: 22
                        implicitWidth: 150
                        implicitHeight: 150
                        textValue: ""
                        textSize: 24
                        progressColor: "#285d71"
                        roundCap: false

                            anchors {
                            left: parent.left
                            top: parent.top
                            leftMargin: 60
                            topMargin: 40
                                }

                            }

                        Row {
                            visible: (index === 0)
                            spacing: 30

                            anchors {
                                left: parent.left
                                bottom: parent.bottom
                                right: parent.right
                                rightMargin: 40
                                leftMargin: 40
                                bottomMargin: 80
                            }

                            Repeater {
                                model: 3

                                Rectangle {
                                    width: borderRectangle.width / 3 - 50
                                    height: 5
                                    color: textModel.get(index).color

                                    Text {
                                        text: textModel.get(index).text

                                        anchors {
                                            horizontalCenter: parent.horizontalCenter
                                            top: parent.bottom
                                            topMargin: 5
                                        }

                                        Text {
                                            text: textModel.get(index).textNumb
                                            font.bold: true
                                            anchors {
                                                horizontalCenter: parent.horizontalCenter
                                                top: parent.bottom
                                                topMargin: 5
                                            }
                                        }
                                    }
                                }


                                }
                            }



                        ChartView {
                            width: 260
                            height: 260
                            visible: (index === 1)
                            id: chart
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                            }

                            legend.alignment: Qt.AlignBottom
                            antialiasing: true

                            PieSeries {
                                id: pieSeries
                                PieSlice { value: 13.5 }
                                PieSlice { value: 10.9 }
                                PieSlice { value: 8.6 }
                                PieSlice { value: 8.2 }
                                PieSlice { value: 6.8 }
                            }
                        }

                        Row {
                            visible: (index === 1)
                            spacing: 30

                            anchors {
                                left: parent.left
                                bottom: parent.bottom
                                right: parent.right
                                rightMargin: 40
                                leftMargin: 40
                                bottomMargin: 80
                            }

                            Repeater {
                                model: 3

                                Rectangle {
                                    width: borderRectangle.width / 3 - 50
                                    height: 5
                                    color: textModel.get(index).color

                                    Text {
                                        text: textModel.get(index).text

                                        anchors {
                                            horizontalCenter: parent.horizontalCenter
                                            top: parent.bottom
                                            topMargin: 5
                                        }

                                        Text {
                                            text: textModel.get(index).textNumb
                                            font.bold: true
                                            anchors {
                                                horizontalCenter: parent.horizontalCenter
                                                top: parent.bottom
                                                topMargin: 5
                                            }
                                        }
                                    }
                                }


                                }
                            }



                            Column {
                                spacing: 90
                                visible: index === 2

                                anchors {
                                    left: parent.left
                                    right: parent.right
                                    top: parent.top
                                    topMargin: 50
                                    leftMargin: 40
                                    rightMargin: 40
                                }

                                Repeater {
                                    model: 3

                                    Text {
                                        font.bold: true
                                        text: textModel.get(index).textPermission
                                        anchors {
                                            horizontalCenter: parent.horizontalCenter
                                            left: parent.left
                                            leftMargin: 140
                                        }

                                        Text {
                                            font.bold: true
                                            text: textModel.get(index).textDevices
                                            anchors {
                                                left: parent.right
                                                leftMargin: 30
                                            }
                                        }

                                        Image {
                                            source: textModel.get(index).image
                                            scale: 1.5

                                            anchors {
                                                left: parent.left
                                                leftMargin: -130

                                            }
                                        }


                                        }

                                    }

                                }
                            }
                        }


                        }
                    }
                }
            }


