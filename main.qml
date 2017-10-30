import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

//    Rectangle{
//        width: parent.width
//        height: parent.height
//        color: "red"
//        id:root
//        property bool running: false
////        anchors.centerIn: parent
//        Rectangle{
//            id: child1
//            width: 20
//            height: 20
//            color: "black"
//            y: parent.height - height
//            x:30

//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    root.running = true
//                    square.start()
//                    console.log(root.running)

//                }

//            }
//        }
//        SequentialAnimation{
//            id: square
//            NumberAnimation{
//                target: child1
//                id: movey
//                to: 0
//                duration: 5000
//                properties: "y"
////                running: true
//            }
//            NumberAnimation{
//                target: child1
//                id: movex
//                to : 260//-(root.width - width)
//                duration: 2000
//                properties: "x"
////                running: root.running
//            }
//        }
//    }

    Rectangle
    {
        width:  500
        height: 500
        color: "grey"

        Rectangle
        {
            anchors.centerIn: parent
            width : 300
            height: 300
            color: "pink"

            CusBorder
            {
                commonBorderWidth: 3
                borderColor: "red"
            }
        }


        Rectangle
        {
            anchors.centerIn: parent
            width : 200
            height: 200
            color: "green"

            CusBorder
            {
                commonBorder: false
                lBorderwidth: 10
                rBorderwidth: 0
                tBorderwidth: 0
                bBorderwidth: 0
                borderColor: "red"
            }
        }


        Rectangle
        {
            anchors.centerIn: parent
            width : 100
            height: 100
            color: "yellow"

            CusBorder
            {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 0
                tBorderwidth: 10
                bBorderwidth: 10
                borderColor: "blue"
            }
        }

    }
}


