import QtQuick 2.12
import QtQuick.Layouts 1.3


Rectangle {
    id: sidebar
    width: 80
    height: 1480
    color: "#1B2A47"


    ListModel {
        id: imageModel
        ListElement { source:"img/353416_home_icon.svg"; }
        ListElement { source:"img/3844432_magnifier_search_zoom_icon.svg"; }
        ListElement { source:"img/2203540_bar_chart_stat_statistic_icon.svg"; }
        ListElement { source:"img/1916081_brand_brands_docs_google_logo_icon"; }
    }



    Rectangle {
        z:1
        //opacity: 0
        visible: false
        id: extendedSidebar
        color: "white"
        border.width: 2
        border.color: "#1B2A47"

        height: parent.height
        width: 108

        anchors {
            left: parent.right
        }

        StackLayout {

            Rectangle {
                id: sidebarExtension
                width: 108
                height: 1480
                color: "white"
                border.width: 5
                border.color: "#1B2A47"

                StackLayout {
                    ColumnLayout {
                        id: accordionTab
                        width: 96
                        height: 32

                        anchors {
                            left: parent.left
                            top: parent.top
                            topMargin: 10
                            leftMargin: 30
                        }

                        property int activeHeaderIndex: -1

                        property variant model: [
                            {
                                'label': 'Header 1',
                                'children': [
                                    {
                                        'label': 'item 1',
                                        'href': 'ABCD_01'
                                    },
                                    {
                                        'label': 'item 2',
                                        'href': 'ABCD_02'
                                    },
                                ]
                            },
                            {
                                'label': 'Header 2',
                                'children': [
                                    {
                                        'label': 'item 3',
                                        'href': 'ABCD_01'
                                    },
                                    {
                                        'label': 'item 4',
                                        'href': 'ABCD_02'
                                    }
                                ]
                            }
                        ]

                        Repeater {
                            id: columnRepeater
                            anchors.fill: parent
                            delegate: accordion
                            model: parent.model
                        }

                        Component {
                            id: accordion

                            ColumnLayout {
                                Layout.fillWidth: true

                                RowLayout {
                                    Layout.fillWidth: true

                                    Rectangle {
                                        id: content
                                        height: 40
                                        width: 96
                                        color: "#04395e"
                                        radius: 6

                                        anchors {
                                            right: parent.right
                                            rightMargin: 24
                                        }

                                        Text {
                                            color: 'white'
                                            text: modelData.label
                                            Layout.fillWidth: true
                                            font.family: "Roboto"
                                            font.bold: true
                                            font.pixelSize: 20

                                            anchors.centerIn: parent

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    if (accordionTab.activeHeaderIndex === index) {
                                                        accordionTab.activeHeaderIndex = -1;
                                                    } else {
                                                        accordionTab.activeHeaderIndex = index;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    id: tabs
                                    height: childrenRect.height

                                    states: [
                                        State {
                                            name: "expanded"
                                            when: accordionTab.activeHeaderIndex === index
                                            PropertyChanges {
                                                target: tabs
                                                visible: true
                                            }
                                        },
                                        State {
                                            name: "collapsed"
                                            when: accordionTab.activeHeaderIndex !== index
                                            PropertyChanges {
                                                target: tabs
                                                visible: false
                                            }
                                        }
                                    ]

                                    ColumnLayout {
                                        width: parent.width

                                        Repeater {
                                            delegate:
                                                ColumnLayout {
                                                    Layout.fillWidth: true
                                                    RowLayout {
                                                        Layout.fillWidth: true

                                                        Rectangle {
                                                            id : rectangle
                                                            height: 20
                                                            width: 84
                                                            color: "white"

                                                            anchors {
                                                                right: parent.right
                                                                rightMargin: 20
                                                            }

                                                            Text {
                                                                color: '#04395e'
                                                                text: modelData.label
                                                                Layout.fillWidth: true
                                                                        font.family: "Roboto"
                                                                        font.pixelSize: 16
                                                                        anchors.centerIn: parent
                                                                    }
                                                                }
                                                            }
                                                        }

                                                     model: modelData.children ? modelData.children : []
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


    Column {
        spacing: 35
        anchors.top: parent.top
        anchors.topMargin: 80

    Repeater {
        model: imageModel

        Image {
            source: imageModel.get(index).source
            width: 45
            height: 45

            anchors {
                left: parent.left
                leftMargin: 10
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked : {
                    //extendedSidebar.visible = !extendedSidebar.visible
                }

                onEntered: {
                    hoverRectangle.opacity = 0.4
                }

                onExited : {
                    hoverRectangle.opacity = 0
                }

                //visible: (index === 1) // Only show MouseArea for index 1
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    extendedSidebar.visible = !extendedSidebar.visible
                }

                visible: (index === 1) // Only show MouseArea for index 1
            }

            Rectangle {
                id: hoverRectangle
                width: 55
                height: 55
                opacity: 0
                color: "lightgrey"
                radius: 4

                anchors.centerIn: parent
            }
        }
    }

    }

}













