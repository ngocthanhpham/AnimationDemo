import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow{
    visible: true
    id:window
    height: 800
    width: 800
    Item {
        id:root
        width: window.height
        height: window.width
        Rectangle{
            id:wrapperImg
            width: window.width
            height: window.height
            property int  duration: 3000
            property bool isVisible: false

            Image {
                width: window.width
                height: window.height
                id: background
                source: "/images/goal.jpg"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        ballAnimation.stop()
                        ball.y = window.width - 100
                        ball.x = window.height - 100
                        ball.scale = 1
                        ball.rotation = 0
                        wrapperImg.isVisible = false
                        console.log("call func restart...")
                    }
                }
            }

            Image {
                id: ball
                width: 80
                height: 80
                x: window.width - 100
                y: window.height - 100
                source: "/images/ball.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        ballAnimation.start()
                    }
                }
                SequentialAnimation{
                    id: ballAnimation
                    ParallelAnimation{
                        NumberAnimation{
                            target: ball
                            to: 220
                            properties: "x"
                            duration: wrapperImg.duration
                            easing.type: Easing.OutCirc
                        }
                        NumberAnimation{
                            target: ball
                            to: 300
                            properties: "y"
                            duration: wrapperImg.duration
                        }
                        RotationAnimation{
                            target: ball
                            properties: "rotation"
                            to: 720
                            duration: wrapperImg.duration
                        }
                        ScaleAnimator{
                            target: ball
                            from:1
                            to: 0.5
                            duration: wrapperImg.duration
                        }

                    }
                    ParallelAnimation{
                        NumberAnimation{
                            target: ball
                            properties: "x"
                            to: 500
                            duration: wrapperImg.duration * 0.4
                        }
                        NumberAnimation{
                            target: ball
                            properties: "y"
                            to: 350
                            duration: wrapperImg.duration * 0.4
                        }
                        ScaleAnimator{
                            target: ball
                            from:0.5
                            to: 0.3
                            duration: wrapperImg.duration * 0.4
                        }

                    }

                    NumberAnimation{
                        target: ball
                        properties: "y"
                        to: 440
                        duration: wrapperImg.duration * 0.4
                        easing.type: Easing.OutBounce
                    }

                    ScriptAction{
                        script: {
                            wrapperImg.isVisible = true
                            goaltxtAniation.start()
                        }
                        //scriptName: "enableGoalText"
                    }
                }

            }
            Image {
                id: goaltxt
                source: "/images/goaltxt.png"
                rotation: -20
                visible: wrapperImg.isVisible
                ParallelAnimation{
                    id: goaltxtAniation
                    ScaleAnimator{
                        target: goaltxt
                        from:0.2
                        to: 1
                        duration: wrapperImg.duration * 0.4
                    }
//                    NumberAnimation{
//                        target: goaltxt
//                        properties: "x"
//                        to: 90
//                        duration: 100
//                        onStopped: {
//                            if(to===90) { from=80; to=90; } else { from=90; to=80 }
//                            restart()
//                        }
//                    }
                }


            }
        }

    }
}

