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
    anchors.fill:parent
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

       ChartView {
           title: "Bar series"
           anchors.fill: parent
           legend.alignment: Qt.AlignBottom
           antialiasing: true

           BarSeries {
               id: mySeries
               axisX: BarCategoryAxis { categories: ["OP1", "OP2", "OP3", "OP4", "OP5", "OP6","OP7","OP8","OP9" ] }
               BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6, 2, 4, 9] }
           }
       }



  }

}

