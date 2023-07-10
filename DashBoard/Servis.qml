import QtQuick 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

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
        Rectangle {
            z: 1
            id: headerRectangle
            width: breadcrumb.width/2 - row.spacing
            height: 50
            color: "#054d66"
            border.color: "white"

            Text {
                text: "Defekti"
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

                    RNTable {
                        anchors {
                            left: parent.left
                            top: parent.top
                        }
                    }

                }
            }
        }

        Rectangle {
            z: 1
            id: header1Rectangle
            width: breadcrumb.width/2 - row.spacing
            height: 50
            color: "#054d66"
            border.color: "white"

            Text {
                text: "Defekti"
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
                    id: border1Rectangle
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
                        id: tabBar
                        TabButton {
                            text: "style1"
                        }
                        TabButton {
                            text:"style2"
                        }
                        TabButton {
                            text:"style3"
                        }
                        TabButton {
                            text:"style4"
                        }
                    }

                    StackLayout {
                        currentIndex: tabBar.currentIndex
                        anchors.fill: parent

                        Item {
                            SwipeView{
                               id:slider
                               anchors.top: parent.top
                               anchors.topMargin: 50
                               //anchors.topMargin:verticalMargin
                               height: parent.height/1.7
                               width: height
                               x:(parent.width-width)/2
                               property var model :ListModel{}
                               clip:true
                               Repeater {
                                   model:slider.model
                                   Image{
                                      width: slider.width
                                      height: slider.height
                                      source:imagePath
                                      fillMode: Image.Stretch
                                      visible: visibleImage
                                   }
                               }
                            }
                            Image {
                                source: "img/left-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    left: slider.left
                                    leftMargin: 0
                                    top: slider.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider.currentIndex > 0) {
                                            slider.currentIndex = slider.currentIndex - 1;
                                        }
                                    }

                                }
                            }

                            Image {
                                source: "img/right-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    right: slider.right
                                    top: slider.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider.currentIndex < slider.count - 1) {
                                            slider.currentIndex = slider.currentIndex + 1;
                                        }
                                    }

                                }
                            }

                            PageIndicator {
                               id: pageIndicator
                               anchors.top: slider.bottom
                               anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider.currentIndex
                               count: slider.count
        /*
                               delegate: Image {
                                                   width: 70
                                                   height: 70

                                                   source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                                               }
                                               */
                            }


                         Component.onCompleted: {
                          slider.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          }
                        }

                        Item {
                            SwipeView{
                               id:slider1
                               anchors.top: parent.top
                               anchors.topMargin: 50
                               //anchors.topMargin:verticalMargin
                               height: parent.height/1.7
                               width: height
                               x:(parent.width-width)/2
                               property var model :ListModel{}
                               clip:true
                               Repeater {
                                   model:slider1.model
                                   Image{
                                      width: slider1.width
                                      height: slider1.height
                                      source:imagePath
                                      fillMode: Image.Stretch
                                      visible: visibleImage
                                   }
                               }
                            }
                            Image {
                                source: "img/left-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    left: slider1.left
                                    leftMargin: 0
                                    top: slider1.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider1.currentIndex > 0) {
                                            slider1.currentIndex = slider1.currentIndex - 1;
                                        }
                                    }

                                }
                            }

                            Image {
                                source: "img/right-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    right: slider1.right
                                    top: slider1.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider1.currentIndex < slider1.count - 1) {
                                            slider1.currentIndex = slider1.currentIndex + 1;
                                        }
                                    }

                                }
                            }

                            PageIndicator {
                               id: pageIndicator1
                               anchors.top: slider1.bottom
                               anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider1.currentIndex
                               count: slider1.count

                               delegate: Image {
                                                   width: 20
                                                   height: 20

                                                   source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider1.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                                               }

                            }


                         Component.onCompleted: {
                          slider1.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider1.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider1.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider1.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider1.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          }
                        }

                        Item {
                            SwipeView{
                               id:slider2
                               anchors.top: parent.top
                               anchors.topMargin: 50
                               //anchors.topMargin:verticalMargin
                               height: parent.height/1.7
                               width: height
                               x:(parent.width-width)/2
                               property var model :ListModel{}
                               clip:true
                               Repeater {
                                   model:slider2.model
                                   Image{
                                      width: slider2.width
                                      height: slider2.height
                                      source:imagePath
                                      fillMode: Image.Stretch
                                      visible: visibleImage
                                   }
                               }
                            }
                            Image {
                                id: leftArrow
                                source: "img/left-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    left: slider2.left
                                    leftMargin: 0
                                    top: slider2.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider2.currentIndex > 0) {
                                            slider2.currentIndex = slider2.currentIndex - 1;
                                        }
                                    }

                                }
                            }

                            Image {
                                id: rightArrow
                                source: "img/right-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    right: slider2.right
                                    top: slider2.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider2.currentIndex < slider2.count - 1) {
                                            slider2.currentIndex = slider2.currentIndex + 1;
                                        }
                                    }

                                }
                            }

                            PageIndicator {
                               id: pageIndicator2
                               anchors.top: slider2.bottom
                               anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider2.currentIndex
                               count: slider2.count
        /*
                               delegate: Image {
                                                   width: 70
                                                   height: 70

                                                   source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                                               }
                                               */
                            }

                            PageIndicator {
                               rotation: 90
                               id: pageIndicator3
                               anchors.top: slider2.top
                               anchors.topMargin: 100
                               anchors.left: parent.left
                               anchors.leftMargin: 180
                               //anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider2.currentIndex
                               count: slider2.count

                               delegate: Image {
                                                   width: 20
                                                   height: 20

                                                   source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider2.currentIndex ? 0.95 : pressed ? 0.7 : 0.45


                                               }

                            }

                            Image {
                                source: "img/left-arrow.png"
                                rotation: -90
                                width: 20; height: 20
                                anchors {
                                    horizontalCenter: pageIndicator3.horizontalCenter
                                    verticalCenter: leftArrow.verticalCenter
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider2.currentIndex < slider2.count - 1) {
                                            slider2.currentIndex = slider2.currentIndex + 1;
                                        }
                                    }
                                }
                            }

                            Image {
                                rotation: -90
                                source: "img/right-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    horizontalCenter: pageIndicator3.horizontalCenter
                                    top: parent.top
                                    topMargin: 70
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider2.currentIndex > 0) {
                                            slider2.currentIndex = slider2.currentIndex - 1;
                                        }
                                    }


                                }
                            }


                         Component.onCompleted: {
                          slider2.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider2.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider2.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider2.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider2.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          }
                        }

                        Item {
                            SwipeView{
                               id:slider4
                               anchors.top: parent.top
                               anchors.topMargin: 50
                               //anchors.topMargin:verticalMargin
                               height: parent.height/1.7
                               width: height
                               x:(parent.width-width)/2
                               property var model :ListModel{}
                               clip:true
                               Repeater {
                                   model:slider4.model
                                   Image{
                                      width: slider4.width
                                      height: slider4.height
                                      source:imagePath
                                      fillMode: Image.Stretch
                                      visible: visibleImage
                                   }
                               }
                            }
                            Image {
                                source: "img/left-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    left: slider4.left
                                    leftMargin: 0
                                    top: slider4.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider4.currentIndex > 0) {
                                            slider4.currentIndex = slider4.currentIndex - 1;
                                        }
                                    }

                                }
                            }

                            Image {
                                source: "img/right-arrow.png"
                                width: 20; height: 20
                                anchors {
                                    right: slider4.right
                                    top: slider4.bottom
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (slider4.currentIndex < slider4.count - 1) {
                                            slider4.currentIndex = slider4.currentIndex + 1;
                                        }
                                    }

                                }
                            }

                            PageIndicator {
                               id: pageIndicator4
                               anchors.top: slider4.bottom
                               anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider4.currentIndex
                               count: slider4.count
        /*
                               delegate: Image {
                                                   width: 70
                                                   height: 70

                                                   source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                                               }
                                               */
                            }

                            PageIndicator {
                               rotation: 90
                               id: pageIndicator5
                               anchors.top: slider4.top
                               anchors.topMargin: 80
                               anchors.left: parent.left
                               anchors.leftMargin: 160
                               //anchors.topMargin: verticalMargin
                               x:(parent.width-width)/2
                               currentIndex: slider4.currentIndex
                               count: slider4.count

                               delegate: Rectangle {
                                                   width: 20
                                                   height: 100
                                                   color: "darkgrey"

                                                   //source: "img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp"
                                                   opacity: index === slider4.currentIndex ? 0.95 : pressed ? 0.7 : 0.45


                                               }

                            }


                         Component.onCompleted: {
                          slider4.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider4.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider4.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider4.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          slider4.model.append({imagePath:"img/defect-rubber-stamp-grunge-seal-260nw-1944697186.webp", visibleImage: true })
                          }
                        }


                        }
                    }




                }
            }
        }

    }


