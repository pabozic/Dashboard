import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Window {
    id: window
    width: 1920
    height: 1480
    visible: true
    title: qsTr("Hello World")

    Flickable {
        anchors.fill: parent
        contentWidth: Math.max(pozadina.width, window.width)
        contentHeight: Math.max(pozadina.height, window.height)
        clip: true


        Izbornik {
            id: izbornik
        }

        Rectangle {
            z: -1
            id: pozadina // Pozadina
            color: "#152036"
            height: parent.height
            width: parent.width
        }

        Breadcrumb {
            z: -1
            id: breadcrumb // Dashboard One
            width: parent.width

            anchors {
                top: parent.top
                left: izbornik.right
                right: parent.right
                leftMargin: 25
                topMargin: 25
                rightMargin: 25
            }
        }


        DescModel {
            z: -1
            visible: tabBar.currentIndex === 1
            id: descModel
            anchors {
                top: breadcrumb.bottom
                topMargin: 25
                left: izbornik.right
                leftMargin: 25
                right: parent.right
                rightMargin: 25
            }
        }


        Rectangle {
            z: -1
            id: stackLayoutMain
            width: breadcrumb.width
            height: window.height
            color: "transparent"

            anchors {
                top: breadcrumb.bottom
                topMargin: 20
                left: izbornik.right
                leftMargin: 25
            }

            TabBar {
                visible: !(tabBar.currentIndex === 1)
                id: tabBar
                spacing: 20
                anchors {
                    left: parent.left
                    //leftMargin: 20
                    top: parent.top
                    topMargin: 20
                }

                background: Rectangle {
                    color: "transparent"
                }

                TabButton {
                text: "DASHBOARD TAB"
                background: Rectangle {
                    color: tabBar.currentIndex == 0 ? "#1880BB" : "#353636"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        tabBar.currentIndex = 0
                        breadcrumb.selectedRectIndex = 0
                    }
                }

                }


                TabButton {
                width: 140
                text: "CHILD DETAILS TAB"
                background: Rectangle {
                    color: tabBar.currentIndex == 1 ? "#1880BB" : "#353636"
                }

                MouseArea {
                    anchors.fill :parent
                    onClicked: {
                    tabBar.currentIndex = 1
                    breadcrumb.selectedRectIndex = 1
                    }
                }
                }

                TabButton {
                width: 140
                text: "SERVIS TAB"
                background: Rectangle {
                    color: tabBar.currentIndex == 2 ? "#1880BB" : "#353636"
                }

                MouseArea {
                    anchors.fill :parent
                    onClicked: {
                    tabBar.currentIndex = 2
                    breadcrumb.selectedRectIndex = 2
                    }
                }
                }


            }

            StackLayout {
                z: -1
                anchors.fill: parent
                currentIndex: tabBar.currentIndex

                Item {

                    Rectangle {
                        color: "transparent"
                        anchors.fill: parent

                DashboardProgress {
                    id: dash

                    anchors {
                        top: parent.top
                        topMargin: 85
                    }
                }

                GraphView {
                    id: graph
                    anchors {
                        top: dash.bottom
                        topMargin: 150
                        right: parent.right
                    }
                }

                Rectangle {
                    id: gridViewBG
                    width: graph.width * 3.127
                    height: 555
                    color: "#1B2A47"

                    anchors {
                        left: izbornik.right
                        leftMargin: 121
                        top: dash.bottom
                        topMargin: 150
                        right: parent.right
                        rightMargin: graph.width + 25
                        //bottom: graph.bottom
                    }

                    TabBar {
                        id: bar

                        anchors {
                            right: gridViewBG.right
                            top: gridViewBG.top
                            topMargin: 20
                            rightMargin: 20
                        }

                        background: Rectangle {
                            color: "#1B2A47"
                        }

                        TabButton {
                            visible: false
                            width: 30
                            height: 30
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
                            visible: false
                            width: 30
                            height: 30
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
                        anchors.fill: parent
                        currentIndex: bar.currentIndex

                    Item {
                        id: itemFirst

                    Rectangle {
                        id: itemA
                        width: gridViewBG.width
                        height: gridViewBG.height
                        color: "transparent"
                        anchors.fill: parent

                    GridViewModel {

                    anchors {
                        left: itemA.left
                        right: itemA.right
                        top: itemA.top
                        topMargin: 65
                        }
                    }
                }
            }

                    Item {
                        id: itemSecond

                    Rectangle {
                        id: itemB
                        width: gridViewBG.width
                        height: gridViewBG.height
                        color: "transparent"
                        anchors.fill: parent

                        TableQml {

                            anchors {
                                left: itemB.left
                                right: itemB.right
                                top: itemB.top
                                topMargin: 65
                                }
                            }
                        }
                    }




            }

                    Review {
                        anchors {
                            left: izbornik.right
                            leftMargin: 25  + 96
                            top: gridViewBG.bottom
                            topMargin: 25
                        }
                    }

        }
    }
                }

                Item {

                Rectangle {

                    TabBar {
                        spacing: 0
                        id: secondBar
                        anchors {
                            top: parent.top
                            topMargin: 100
                        }

                        TabButton {
                            width: 140
                            text:"Detalji"
                        }
                        TabButton {
                            width: 140
                            text:"Servis"
                        }
                        TabButton {
                            width: 140
                            text: "Parametri"
                        }

                    }

                    StackLayout {
                        anchors.fill: parent
                        currentIndex: secondBar.currentIndex

                        TimelineTab {
                            anchors {
                                top: parent.top
                                topMargin: 85 + 55
                            }




                    DetailsTab1 {
                        anchors {
                            top: parent.top
                            topMargin: 415
                        }

                        DetailsTab2 {
                            anchors {
                                top: parent.top
                                topMargin: 395
                            }
                        }

}
                    }


                    }
                }
            }

                Item {
                    TabBar {
                        spacing: 0
                        id: thirdBar
                        anchors {
                            top: parent.top
                            topMargin: 90
                        }

                        TabButton {
                            width: 140
                            text:"Dijagnostika"
                        }
                        TabButton {
                            width: 140
                            text:"Servis"
                        }
                        TabButton {
                            width: 140
                            text: "Parametri"
                        }

                    }

                    StackLayout {
                        anchors.fill: parent
                        currentIndex: thirdBar.currentIndex

                        Servis {
                        anchors {
                            top: parent.top
                            topMargin: 130
                        }
                        }

                    }


                }

}




                        }
                    }




            }







