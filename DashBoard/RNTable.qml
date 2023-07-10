import QtQuick 2.12
import QtQuick.LocalStorage 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtMultimedia 5.9
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {

    // Open local database
    property var db: LocalStorage.openDatabaseSync("myDb", "1.0", "Local database", 1000000)

    Component.onCompleted: {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS deviceDeffects (UID, Type, Desc, ParentID, DiagRN, DateTime, Status, InputType);");
            tx.executeSql("CREATE TABLE IF NOT EXISTS RNTable (UID, Name, Desc, ParentID, DateTime, Status, Type, CodeName, StartDate, EndDate, OPER_ID);");
        });
    }

    ListModel {
        id: rnTableModel

        // Retrieve data from database for deviceDefects table
        Component.onCompleted: {
            db.readTransaction(function(tx) {
                var rs = tx.executeSql("SELECT * FROM RNTable")
                for (var i = 0; i < rs.rows.length; i++) {
                    var row = rs.rows.item(i)
                    append({
                        "UID": row.UID,
                        "Name": row.Name,
                        "Desc": row.Desc,
                        "ParentID": row.ParentID,
                        "DateTime": row.DateTime,
                        "Status": row.Status,
                        "Type": row.Type,
                        "CodeName": row.CodeName,
                        "StartDate": row.StartDate,
                        "EndDate": row.EndDate,
                        "OPER_ID": row.OPER_ID,
                    })
                }
            })
        }
    }

    ListView {
        id: tableDiagView
        width: 850
        height: 320

        // Set list model for deviceDefects table as table model
        model: rnTableModel

        // Define table columns for deviceDefects table

        delegate: RowLayout {


            Text {text: model.UID; font.pixelSize: 14}
            Text {text: model.Name; font.pixelSize: 14}
            Text {text: model.Desc; font.pixelSize: 14}
            Text {text: model.ParentID; font.pixelSize: 14}
            Text {text: model.DateTime; font.pixelSize: 14}
            Text {text: model.Status; font.pixelSize: 14}
            Text {text: model.Type; font.pixelSize: 14}
            Text {text: model.CodeName; font.pixelSize: 14}
            Text {text: model.StartDate; font.pixelSize: 14}
            Text {text: model.EndDate; font.pixelSize: 14}
            Text {text: model.OPER_ID; font.pixelSize: 14}
        }
    }

    ListView {
        id: tableServisView
        width: 850
        height: 320

        anchors {
            top: parent.top
            topMargin: 100
        }

        // Set list model for deviceDefects table as table model
        model: rnTableModel

        // Define table columns for deviceDefects table

        delegate: RowLayout {


            Text {text: model.UID; font.pixelSize: 14}
            Text {text: model.Name; font.pixelSize: 14}
            Text {text: model.Desc; font.pixelSize: 14}
            Text {text: model.ParentID; font.pixelSize: 14}
            Text {text: model.DateTime; font.pixelSize: 14}
            Text {text: model.Status; font.pixelSize: 14}
            Text {text: model.Type; font.pixelSize: 14}
            Text {text: model.CodeName; font.pixelSize: 14}
            Text {text: model.StartDate; font.pixelSize: 14}
            Text {text: model.EndDate; font.pixelSize: 14}
            Text {text: model.OPER_ID; font.pixelSize: 14}

        }
    }

    Button {
        height: 20
        z: 1
        text: "Unesi"
         // keep track of the number of times the button is clicked

        MouseArea {
            anchors.fill: parent
            z: 1

            onClicked: {
                var UID = Math.floor(Math.random() * 10);
                var Name = "Device Defects"
                var Desc = "Captured image"
                var ParentID = "ParentID"
                var DateTime = new Date().toISOString()
                var Status = "Active"
                var Type = Math.random() < 0.5 ? "DiagRN" : "ServisRN";
                var CodeName = "CodeName"
                var StartDate = "2023-05-04"
                var EndDate = "2023-05-05"
                var OPER_ID = "OPER_ID"
                var DiagRN = UID
                var InputType = "img"

                db.transaction(function(tx) {
                    tx.executeSql('INSERT INTO deviceDeffects VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
                    [UID, Type, Desc, ParentID, DiagRN, DateTime, Status, InputType])
                    tx.executeSql('INSERT INTO RNTable VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                    [UID, Name, Desc, ParentID, DateTime, Status, Type, CodeName,StartDate, EndDate, OPER_ID]);
                })


                updateTableViews();
            }

    }
        anchors {
            right: tableDiagView.right
            top: tableDiagView.bottom
            rightMargin: 10
        }
}


    function updateTableViews() {
        rnTableModel.clear();

        db.readTransaction(function(tx) {
            var rs = tx.executeSql("SELECT * FROM RNTable")
            for (var i = 0; i < rs.rows.length; i++) {
                var row = rs.rows.item(i)
                rnTableModel.append({
                                        "UID": row.UID,
                                        "Name": row.Name,
                                        "Desc": row.Desc,
                                        "ParentID": row.ParentID,
                                        "DateTime": row.DateTime,
                                        "Status": row.Status,
                                        "Type": row.Type,
                                        "CodeName": row.CodeName,
                                        "StartDate": row.StartDate,
                                        "EndDate": row.EndDate,
                                        "OPER_ID": row.OPER_ID,
                })
            }
        });
    }


    Component.onDestruction: {
        clearTables();
    }

    function clearTables() {
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM RNTable");
            tx.executeSql("DELETE FROM deviceDeffects");
        });
    }

}
