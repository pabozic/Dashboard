import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.5

import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

import Qt.labs.qmlmodels 1.0
import QtCharts 2.15


Item {
    id: root

    width:parent.width
    height:parent.height
    objectName:""

    property var toolbarMap: 0
    property var gridTitle: 0
    property var toolbarHeight: 40
    property var parentContext:0

    property var mainForm:0
    property var commonMethodsObj: 0
    property var componentName:"HodoSmartRackEditorModule"
    property var componentFBulder:0

    property var parentObjUIDVarName:0
    property var parentObjDataVarName:0
    property var initParams:0

    /* ************************ */

    property var showTitle:true
    property var moduleTitle:""


    /*  __refreshWidget  */
    function refreshWidget(toolbarParams)
    {
        console.log("HodoSmartRackEditorModule.qml > init ");
    }

    /* ***************************************************************** */
    /* ***************************************************************** */


    /* *****  __init() ***** */
    function init(initparams)
    {
        console.log("HodoSmartRackEditorModule::init START");
        console.log("HodoSmartRackEditorModule::init START > commonMethodsObj: "+commonMethodsObj);

        initParams = initparams;
        initParams = commonMethodsObj.isVarUndefinedZeroEmptyNull(initParams,0);

        console.log("HodoSmartRackEditorModule::init START > registerAppModule: ");

        if(initParams!=0)
        {
            objectName = commonMethodsObj.isParamUndefinedZeroEmptyNull(initParams,"objRefVarName",objectName);
            hodoSmartRackParamsUIDVarName = commonMethodsObj.isParamUndefinedZeroEmptyNull(initParams,"hodoSmartRackParamsUIDVarName",hodoSmartRackParamsUIDVarName);
            hodogramUIDVarName = commonMethodsObj.isParamUndefinedZeroEmptyNull(initParams,"hodogramUIDVarName",hodogramUIDVarName);
            hodoSmartRackDataVarName = commonMethodsObj.isParamUndefinedZeroEmptyNull(initParams,"hodoSmartRackDataVarName",hodoSmartRackDataVarName);


            console.log("HodoSmartRackEditorModule::init START > hodoSmartRackParamsUIDVarName: "+hodoSmartRackParamsUIDVarName);
            console.log("HodoSmartRackEditorModule::init START > hodoSmartRackDataVarName: "+hodoSmartRackDataVarName);

            console.log("HodoSmartRackEditorModule::init START > hodogramUIDVarName: "+hodogramUIDVarName);

        }

        /* ************************************ */
        /* START - init
        /* ************** */

        var dataSource = {};
        componentFBulder = commonMethodsObj.createFormBuilderInstance("HodoSmartRackEditorFBulder","NdjsFormBuilder");
        componentFBulder.formDest = mainColumn;
        componentFBulder.setAction("createNew");
        componentFBulder.objectType = "paramSet";
        componentFBulder.clearForm();
        componentFBulder.setDataSource(dataSource);





        /* ************** */
        /* FINISH - init
        /* ************************************ */

    }

    Rectangle{
       id:mainColumn
       width:root.width
       height:root.height
       anchors.left: parent.left
       anchors.top:parent.top
       anchors.topMargin: 0
       anchors.right:parent.right
       color:"white"
/*
       NdTitleBlock{
         id:artImgPreviewTitle
         height:30
         width:parent.width
         titleBlockHeight:30
         titleBlockBg:'gray'
         titleText:moduleTitle
         titleTextFontSize:12
         titleTextColor:"#ffffff"
         anchors.top: parent.top
         visible:showTitle

       }
*/
       Rectangle{
           id:artImgBodyBlock
           objectName:"artImgBodyBlock"
           anchors.left:parent.left
           anchors.right:parent.right
           anchors.top:artImgPreviewTitle.bottom
           height:parent.height
           anchors.bottom:parent.bottom
           anchors.topMargin: 0
           color:"white"
           anchors.leftMargin: 0

           border.color: "gray"
           border.width: 1

           ChartView {
               id: chart
               title: "Top-5 car brand shares in Finland"
               anchors.fill: parent
               legend.alignment: Qt.AlignBottom
               legend.visible: false
               antialiasing: true

               PieSeries {
                   id: pieSeries
                   //PieSlice { label: "SmartRackInitJob"; value: 13.5 }
                   //PieSlice { label: "SmartRackPAPJob"; value: 10.9 }
                   PieSlice { label: "60"; value: 28.6; labelPosition: PieSlice.LabelInsideHorizontal;color:"red";labelVisible: true; labelColor:"white" }
               }
           }
       }

       Component.onCompleted: {
           // You can also manipulate slices dynamically, like append a slice or set a slice exploded
           console.log("NdChartViewPieModule onCompleted 1")
           var othersSlice = pieSeries.append("Others", 52.0);
           pieSeries.find("Others").exploded = true;
           pieSeries.find("Others").color = "green";

           console.log("NdChartViewPieModule onCompleted 2")

           othersSlice = pieSeries.append("Others2", 33.0);
           //pieSeries.find("SmartRackInitJob").exploded = true;

       }

  }

}

