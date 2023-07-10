import QtQuick 2.12
import QtQuick.Shapes 1.0

Rectangle {
    id: breadcrumb
    color: "#1B2A47"
    height: 70

    ListModel {
        id: listModel
        ListElement{ color: "#2DB4EE"; width: 30; source: "img/Bookmark.svg"; radius: "0"; margin: "-29"; imageSource: "img/353416_home_icon.svg"; backgroundColor: "#152036" }
        ListElement{ color: "#1880BB"; width: 80; source: "img/Bookmark - Copy.svg"; radius: "0"; margin: "-26"; hiddenImage: "img/Bookmark - Copy - Copy.svg"; backgroundColor: "transparent"  }
        ListElement{ color: "#2DB4EE"; width: 80; source: "img/Bookmark.svg"; radius: "0"; margin: "-26"; hiddenImage: "img/Bookmark - Copy - Copy.svg"; backgroundColor: "transparent"  }
        ListElement{ color: "#1880BB"; width: 80; source: "img/Bookmark - Copy.svg"; radius: "0"; margin: "-26"; hiddenImage: "img/Bookmark - Copy - Copy.svg"; backgroundColor: "transparent"  }
        ListElement{ color: "#2DB4EE"; width: 80; source: ""; radius: "4"; margin: "-26"; hiddenImage: "img/Bookmark - Copy - Copy.svg"; backgroundColor: "transparent"  }
    }

    property int selectedRectIndex: -1

    Row {
        spacing: 20

        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }

        Repeater {
            model: listModel.count

            Rectangle {
                id: mainRectangle
                width: listModel.get(index).width
                height: 30
                color: listModel.get(index).color
                radius: listModel.get(index).radius

                Image {
                    source: listModel.get(index).imageSource
                    width: 25
                    height: 25

                    anchors {
                        left: parent.left
                        leftMargin: 4
                        top: parent.top
                        topMargin: 2.6
                    }

                    Rectangle {
                        z: -1
                        anchors.fill: parent
                        color: listModel.get(index).backgroundColor
                    }
                }



                states: [

                    State {
                        name: "unselected"
                        PropertyChanges { target: mainRectangle; color: "#2DB4EE" }
                        PropertyChanges { target: trianglePath; fillColor: "#24CAA1" }
                    },

                    State {
                        name: "selected"
                        when: selectedRectIndex === index
                        PropertyChanges { target: mainRectangle; color: "#24CAA1" }
                        PropertyChanges { target: trianglePath; fillColor: "#24CAA1" }
                        PropertyChanges { target: hiddenImage; visible: true }
                    },

                    State {
                        name: "active"
                        PropertyChanges { target: mainRectangle; color: "#24CAA1" }
                        PropertyChanges { target: trianglePath; fillColor: "#24CAA1" }
                        PropertyChanges { target: hiddenImage; visible: true; }
                    }
                ]

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        if (!selected){
                            mainRectangle.state = "active";
                        }
                    }

                    onExited: {
                        if (!selected) {
                            mainRectangle.state = listModel.get(index).color;
                            trianglePath.fillColor = listModel.get(index).color;
                        }

                    }

                    onClicked: {
                        for (var i = 0; i < listModel.count; i++) {
                            var item = listModel.get(i);
                            if (item.selected && item !== listModel.get(index)) {
                                item.selected = false;
                                item.mainRectangle.state = "unselected";
                                item.trianglePath.fillColor = item.color;
                            }
                        }
                        selected = true;
                        mainRectangle.state = "selected";
                        trianglePath.fillColor = "#24CAA1";
                        breadcrumb.selectedRectIndex = index;
                    }
                }



                property bool selected: false


                Shape {
                        id: shapeTriangle
                        rotation: 135
                        scale: 0.44
                        width: 60
                        height: 60
                        visible: index < (listModel.count - 1)

                        anchors {
                            left: parent.right
                            leftMargin: -26
                            top: parent.top
                            bottom: parent.bottom
                            topMargin: 14
                        }

                        ShapePath {
                            id: trianglePath
                            strokeColor: "transparent"
                            fillColor: listModel.get(index).color

                            PathLine { x: 0; y: 100 }
                            PathLine { x: 0; y: 50 }
                            PathLine { x: 50; y: 0 }

                        }
                    }

                Image {
                    id: mainImage
                    y: -282.5
                    source: listModel.get(index).source
                    scale: 0.312
                    anchors.left: parent.right
                    anchors.leftMargin: -402 // -406
                }

                Image {
                    visible: false
                    id:hiddenImage
                    y: -282.5
                    source: listModel.get(index).hiddenImage
                    scale: 0.312
                    anchors.left: parent.right
                    anchors.leftMargin: -502
                }
            }
        }
    }

}
