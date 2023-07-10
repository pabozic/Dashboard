import QtQuick 2.0
import QtQml 2.2
import QtCharts 2.4
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

Rectangle{ // --> Background
  id: item1
  height:400/2
  width: 400/2
  property color mainColor:"transparent"
  property var progressBarBroj:[100,1,45] // --> Početna vrijednost ProgressBara
  property int progressKrugBroj:45 // --> Početna vrijednost u PieChartu
  property var arr:[];
  property var vrijemeArrMin:[]
  property var vrijemeArrHour:[]
  property var vrijemeArr:[]
  property bool stopIt:false
  property var progressText:["Availability","Quality","Performance"]
  color:mainColor


  function postotci(){
    while(arr.length < 3){
      var r = Math.floor(Math.random() * 100) + 1;
      if(arr.indexOf(r) === -1) arr.push(r);
    }

  }

  function vrijeme(){
    while(vrijemeArrMin.length < 3){
      var r = Math.floor(Math.random() * 60) + 1;
      if(vrijemeArrMin.indexOf(r) === -1) vrijemeArrMin.push(r);
    }

    while(vrijemeArrHour.length < 3){
      var i = Math.floor(Math.random() * 11) + 1;
      if(vrijemeArrHour.indexOf(i) === -1) vrijemeArrHour.push(i);
    }
  }



  Item { // --> Progressbar
    id: progressbar
    width: 230
    anchors.bottom: gridWiewContainer.top
    anchors.left: parent.left
    anchors.top: textContainerTop.bottom

    Column {
      spacing: 40/1.8 //
      Repeater{
        model: progressBarBroj.length
        Progress { // --> Progressbar
          width: 230/2.045 // širina Progressbara //
          broj:progressBarBroj[index]
          tekst.text: progressText[index]
          height: 20/1.6 //
          anchors.left: parent.left
          anchors.topMargin: 10
          anchors.leftMargin: 5
          onBrojChanged: {
            gogo.visible=false
            ddd.stop()
            ddd.start()
            gogo.visible=false
          }
        }
      }
    }
  }

  Item {
    id: textContainerRight
    height: 100
    anchors.left: progressbar.right
    anchors.right: parent.right
    anchors.top: textContainerTop.bottom
    anchors.topMargin: 0
    anchors.rightMargin: 0
    anchors.leftMargin: 5


    Timer {
      id:ddd
      interval:5000//60000;
      running:true; repeat: true
      onTriggered:{
        postotci()
        progressBarBroj=arr
        progressKrugBroj=arr[0]
        arr=[]
        vrijemeArrMin=[]
        vrijemeArrHour=[]
        vrijemeArr=[]
        vrijemeGrid.info=[]
        vrijeme()
        for (let i = 0; i < vrijemeArrHour.length; i++) {
          vrijemeArr+=[vrijemeArrHour[i]+"h"+vrijemeArrMin[i]+"m"]+",";
        }
        vrijemeArr=vrijemeArr.slice(0, -1)
        vrijemeArr=vrijemeArr.split(",", vrijemeArr.length)
        vrijemeGrid.info=vrijemeArr
      }
    }
  }

  Item {
    id: textContainerTop
    height: 20
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.rightMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
  }

  Item {
    id: gridWiewContainer
    y: 280
    height: 180
    anchors.left: parent.left
    // anchors.right: roundLoadContainer.right
    width: parent.width/2+60
    anchors.bottom: parent.bottom
    //anchors.rightMargin: 80
    anchors.leftMargin: 0
    anchors.bottomMargin: 0

  }

  Rectangle {
    id: roundLoadContainer
    anchors.left: gridWiewContainer.right
    // width: parent.width/3
    anchors.right: parent.right
    //anchors.rightMargin: 20
    anchors.top: textContainerRight.bottom
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors.leftMargin: -50
    color:"transparent"

 }

  Button {
    width: 15
    height: 15

    background: Rectangle {
        implicitWidth: 15
        implicitHeight: 15
        color: "#006B79"  // I update background color by this
    }

    anchors {
        left: parent.left
        leftMargin: -50
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
             tabBar.currentIndex = 2
             breadcrumb.selectedRectIndex = 1

        }
    }

  }
}

