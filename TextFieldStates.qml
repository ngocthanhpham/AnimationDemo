import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow{
    visible: true
    id: window
    height: 300
    width: 300
    Item {
        id: rootItem
        height: parent.height
        width: parent.width
        TextField{
            id:txtField
            text: "Enter text"
        }
        Button{
            id: btnClear
            text: "Clear"
            anchors.left: txtField.right
            onClicked: {
                txtField.text = ""
                console.log("btnClear pressed...")

            }
        }
        states: [
            State {
                name: "withtxt"
                when: txtField.text != ""
                PropertyChanges {
                    target: btnClear
                    opacity: 1.0
                }
            },
            State {
                name: "withoutxt"
                when: txtField.text == ""
                PropertyChanges {
                    target: btnClear
                    opacity: 0.5
                }
                PropertyChanges {
                    target: txtField
                    focus: true
                }
            }
        ]
    }

}
