import QtQuick 2.0
import QtQuick.Controls 2.2
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
        QtObject{
            id: stateAtt
            property int  state_clicked: 0
            property int  state_release: 1
            property int  state_holdpress: 2
            property int  state_hover: 3
            property int  state_enable: 4
            property int  state_disable: 5
        }

        property int  stateBtn: 1

        Rectangle{
            id: mybtn
            width: 88
            height: 22
            //anchors.centerIn: parent
            x: parent.width / 2
            y: parent.height / 2
            color: "red"
            radius: 20
            Text {
                id: txt
                text: qsTr("MyButton")
                anchors.centerIn: parent
            }
            Drag.active: areaMouse.drag.active
            Drag.hotSpot.x: parent.width / 2
            Drag.hotSpot.y: parent.height / 2

            MouseArea{
                id: areaMouse
                hoverEnabled: true
                anchors.fill: parent
                drag.target: parent
                onClicked: {
                    rootItem.stateBtn =  0//rootItem.stateBtn.STATE_CLIKED
                    console.log("Dont click me..." + rootItem.stateBtn)
                }
                onReleased: {
                    rootItem.stateBtn = 1
                    console.log("Please click me..." + rootItem.stateBtn)
                }
                onPressAndHold: {
                    rootItem.stateBtn = 2
                    console.log("Please let me down..." + rootItem.stateBtn)
                }
                onEntered: {
                    if(rootItem.stateBtn !== 0){
                        rootItem.stateBtn = 3
                    }
                    console.log("Dont focus me..." + rootItem.stateBtn)
                }
                onExited: {
                    if(rootItem.stateBtn !== 0){
                        rootItem.stateBtn = 1
                    }
                    console.log("OK I'm fine..." + rootItem.stateBtn)
                }
           }
            state: "release"
            states: [
                State {
                    name: "clicked"
                    when: rootItem.stateBtn === 0
                    PropertyChanges {
                        target: mybtn
                        color: "blue"
                    }
                    PropertyChanges {
                        target: txt
                        text: "Clicked"
                    }
                },
                State {
                    name: "release"
                    when: rootItem.stateBtn === 1
                    PropertyChanges {
                        target: mybtn
                        color: "red"
                    }
                    PropertyChanges {
                        target: txt
                        text: "Released"
                    }
                },
                State {
                    name: "hover"
                    when: rootItem.stateBtn === 3
                    PropertyChanges {
                        target: mybtn
                        color: "black"
                    }
                    PropertyChanges {
                        target: txt
                        text: "Hovered"
                    }
                },
                State {
                    name: "holdpress"
                    when: rootItem.stateBtn === 2
                    PropertyChanges {
                        target: mybtn
                        color: "yellow"
                    }
                    PropertyChanges {
                        target: txt
                        text: "PressedHold"
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "*"
                    ColorAnimation{
                        target: mybtn
                        properties: "color"
                        duration: 2000
                    }
                    ColorAnimation{
                        target: txt
                        properties: "color"
                        to: "white"
                        duration: 2000
                    }


                }
            ]
        }
    }

}

