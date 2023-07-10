import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item {
    id: item
    width: gridViewBG.width
    height: gridViewBG.height

    ListModel {
        id: listModel
        ListElement { text: "Add" }
        ListElement { text: "Update" }
        ListElement { text: "Delete" }
        ListElement { text: "refreshGrid" }
        ListElement { text: "smartRack details module" }
    }

    ListModel {
        id: tabText
        ListElement { text: "Code" }
        ListElement { text: "Name" }
        ListElement { text: "Opis" }
        ListElement { text: "Atributi" }
        ListElement { text: "Tip" }
        ListElement { text: "ClassType" }
        ListElement { text: "ID_OP" }
        ListElement { text: "Status" }
        ListElement { text: "Memo" }
        ListElement { text: "DateTime" }
    }

    Rectangle {
        id: mainRectangle
        width: parent.width
        height: 50
        color: "#808080"

        Text {
            text: "smartRackModel"
            color: "white"
            anchors.centerIn: parent
        }
    }

    Rectangle {
        id: textRectangle
        width: parent.width
        height: 50
        color: "#f0f0f0"

        anchors {
            top: mainRectangle.bottom
        }

        Row {
            spacing: 12

            anchors {
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 10
            }

            Repeater {
                model: listModel.count

                Text {
                    text: listModel.get(index).text
                    }
            }
        }
    }

    Rectangle {
        z: -1
        color: "white"
        width: gridViewBG.width
        height: gridViewBG.height - 100
        anchors {
            top: textRectangle.top
        }
    }

    Column {

        anchors {
            top: textRectangle.bottom
        }

    Row {
        anchors {
            top: textRectangle.bottom
        }

        spacing: 1
        Repeater {
            model: tabText.count

            Rectangle {
                height: textRectangle.height
                width: breadcrumb.width/13.49
                color: "#2e2e2e"

                Text {
                    color: "white"
                    text : tabText.get(index).text
                    anchors {
                        left: parent.left
                        top: parent.top
                        leftMargin: 10
                        topMargin: 15
                    }
                }
            }
        }
    }

    Row {
        anchors {
            top: textRectangle.bottom
        }

        spacing: 1
        Repeater {
            model: tabText.count

            Rectangle {
                height: textRectangle.height
                width: breadcrumb.width/13.49
                color: "#acacac"

                Text {
                    color: "black"
                    text : tabText.get(index).text
                    anchors {
                        left: parent.left
                        top: parent.top
                        leftMargin: 10
                        topMargin: 15
                    }
                }
            }
        }
    }

    Row {
        anchors {
            top: textRectangle.bottom
        }

        spacing: 1
        Repeater {
            model: tabText.count

            Rectangle {
                height: textRectangle.height
                width: breadcrumb.width/13.49
                color: "white"

                Text {
                    color: "black"
                    text : tabText.get(index).text
                    anchors {
                        left: parent.left
                        top: parent.top
                        leftMargin: 10
                        topMargin: 15
                    }
                }
            }
        }
    }
}
}
