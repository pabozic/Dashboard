import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15
import QtQuick 2.0

Item{
  anchors.fill: parent
  property alias gridView:gridView
  property int myIconHeight: gridView.cellHeight
  property var info: ["10h0m20s","18","47m49s","10000"]
  property var naslov:["Time Frame","Total packs", "Total loss","Total items"]


  GridView {
    id:gridView
    anchors.fill: parent
    cellWidth: 72; cellHeight: 40
    focus: true
    model: 3
    boundsBehavior:Flickable.StopAtBounds
    interactive:false

    delegate: Item {
      width: gridView.cellWidth; height: gridView.cellHeight


      Rectangle {
        id: myIcon
        width: parent.width
        height: myIconHeight//parent.height
        color: mainColor
        radius: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter


        Rectangle {
          id: stojeto
          height: 20
          color: mainColor
          anchors.left: myIcon.left
          anchors.right: myIcon.right
          anchors.top: myIcon.top
          radius:2

        }
      }
      Text {
        id:titleText
        anchors { top: myIcon.top; horizontalCenter: parent.horizontalCenter }
        text: naslov[index]
        color:"black"
      }
      Text {
        id:anser
        anchors.centerIn: parent
        width:200
        height:100
        font.pixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: info[index]
        color:"black"
      }
    }
  }
}
