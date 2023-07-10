import QtQuick 2.4
import QtQuick.Layouts 1.2

ColumnLayout {
    id: accordionTab
    width: 100
    height: 62

    property variant model: [
      {
          'label': 'Cash',
          'value':'$4418.28',
          'children': [
              {
                  'label': 'Float',
                  'value': '$338.72'
              },
              {
                  'label': 'Cash Sales',
                  'value': '$4059.56'
              },
              {
                  'label': 'In/Out',
                  'value': '-$50.00',
                  'children': [
                      {
                          'label': 'coffee/creamer',
                          'value': '-$40.00'
                      },
                      {
                          'label': 'staples & paper',
                          'value': '-$10.00'
                      }

                  ]
              }

          ]
      },
      {
          'label': 'Card',
          'value': '$3314.14',
          'children': [
              {
                  'label': 'Debit',
                  'value': '$1204.04'
              },
              {
                  'label': 'Credit',
                  'value': '$2110.10'
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
                Text {
                    color: 'white'
                    text: modelData.label
                    Layout.fillWidth: true
                }
                Text {
                    Layout.alignment: Qt.AlignRight
                    color: 'white'
                    text: modelData.value
                }
            }
            Rectangle {
                color: 'black'
                Layout.fillWidth: true
                height: childrenRect.height

                ColumnLayout {
                    x: 20
                    width: parent.width - x
                    Repeater {
                        delegate: accordion
                        model: modelData.children ? modelData.children : []
                    }
                }
            }
        }
    }
}

