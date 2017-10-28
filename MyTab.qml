import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow{
    visible: true
    id: root
    width: 700
    height: 700
    Item {
        id: rootItem
        width: parent.width
        height: parent.height
        Rectangle{
            id: rootRec
            width: parent.width
            height: parent.height
            border.color: "red"
            border.width: 5
            CusRectangle{
                id: tab1
                anchors.top: rootRec.top
                anchors.left: rootRec.left
                Text {
                    id: tab1txt
                    text: qsTr("Tab1")
                    anchors.centerIn: parent
                    font.pixelSize: 20
                }
            }
            CusRectangle{
                id: tab2
                anchors.left: tab1.right
                Text {
                    id: tab2txt
                    text: qsTr("Tab2")
                    anchors.centerIn: parent
                    font.pixelSize: 20
                }
            }
            CusRectangle{
                id: content
                width: parent.width
                height: parent.height - tab1.height
                anchors.left: parent.left
                anchors.top: tab1.bottom
            }
        }
    }
}

