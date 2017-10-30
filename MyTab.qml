import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow{
    visible: true
    id: root
    width: 500
    height: 500
    Item {
        id: rootItem
        width: parent.width
        height: parent.height
        property int isTab: 1
        Rectangle{
            id: rootRec
            width: parent.width
            height: parent.height
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        rootItem.isTab = 1
                        console.log("tab1 clicked...")
                    }
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        rootItem.isTab = 2
                        console.log("tab2 clicked...")
                    }
                }

            }
            CusRectangle{
                id: content
                width: parent.width
                height: parent.height - tab1.height
                anchors.left: parent.left
                anchors.top: tab1.bottom
                Loader{
                    width: parent.width - 50
                    height: parent.height - 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    id: loadContent
                    source: "/Content1.qml"
                }
            }

            states: [
                State {
                    name: "ontab1"
                    when: rootItem.isTab === 1
                    PropertyChanges {
                        target: tab1
                        color: "red"
                    }
                    PropertyChanges {
                        target: tab1txt
                        color: "white"
                    }
                    PropertyChanges {
                        target: loadContent
                        source: "/Content1.qml"
                    }
                    PropertyChanges {
                        target: tab2
                        border.color: "white"
                    }
//                    AnchorChanges{
//                        target: tab1
//                        anchors.top: undefined
//                    }

                },
                State {
                    name: "obtab2"
                    when: rootItem.isTab === 2
                    PropertyChanges {
                        target: tab2
                        color: "red"
                    }
                    PropertyChanges {
                        target: tab2txt
                        color: "white"
                    }
                    PropertyChanges {
                        target: loadContent
                        source: "/Content2.qml"
                    }
                    PropertyChanges {
                        target: tab1
                        border.color: "white"
                    }
                }
            ]
        }
    }
}

