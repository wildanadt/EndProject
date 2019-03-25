import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.5
import QtQuick.Scene3D 2.12
import QtGraphicalEffects 1.0
import QtGraphicalEffects 1.0 as QQ
import QtQuick.Window 2.12

import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12

import UdpClient 1.0
import CustomControls 1.0


Page{
    id: mainPage
    property bool flag: false
    property alias element: element
    //property alias pointerCompassTransformOrigin: pointerCompass.transformOrigin
    property alias rectangle1Visible: rectRhinoInfo.visible
    //property alias layar: Screen
    height: 1080
    property alias rectCamera: rectCamera
    width: 1920
    //onVisibleChildrenChanged: console.log(Screen.desktopAvaibleHeight)
    background: Rectangle{
        anchors.fill: parent
        RadialGradient {
            horizontalOffset: 800
            verticalOffset: -500
            // horizontalRadius: 300
            //verticalRadius: 300
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#52219A" }
                GradientStop { position: 0.5; color: "#0F115A" }
            }
        }
//        RadialGradient {
//            horizontalOffset: -800
//            verticalOffset: 500
//            // horizontalRadius: 300
//            //verticalRadius: 300
//            anchors.fill: parent
//            gradient: Gradient {
//                GradientStop { position: 0.0; color: "#52219A" }
//                GradientStop { position: 0.5; color: "#0F115A" }
//            }
//        }
    }

    FontLoader{
        id:myfont
        source: "qrc:/font/Font Awesome 5 Free-Solid-900.otf"
    }

    Component{
        id:label

        Rectangle{
            radius: 5
            color: Qt.rgba(0.12, 0.11, 0.21, 1)
            antialiasing: true

        }
    }
    function flags(){
        if(flag){
            flag=false;
            return flag;
        }
        else{
            flag=true;
            return flag;
        }
    }


    Item {
        id: element
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        Component{
            id:glow
            Glow {

                samples: 5
                color: Qt.rgba(0.13, 0.04, 0.22, 1)
                transparentBorder: true

            }
        }

        Rectangle {
            id: rectLeft
            width: parent.width *2/5

            color: "#00000000"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            Rectangle {
                id: rect
                height: parent.height/2 +100
                radius: 5
                border.width: 2
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.top: parent.top
                anchors.topMargin: 30

                color: "white"
                border.color: Qt.rgba(0.15, 0.12, 0.22, 1)
                layer.effect: DropShadow {
                    color: "#000000"
                    radius: 20
                    samples: 25
                    verticalOffset: 5
                    transparentBorder: true
                    horizontalOffset: -5
                }
                visible: true
                antialiasing: true
                layer.enabled: true

                Loader {
                    id: rhinoLabel
                    anchors.top: parent.top
                    anchors.leftMargin: -1
                    anchors.bottomMargin: 5
                    sourceComponent: label
                    anchors.right: parent.right
                    anchors.bottom: scene3d.top
                    anchors.rightMargin: -1
                    antialiasing: true
                    anchors.left: parent.left
                    active: true
                }

                Text {
                    id: rhinotext
                    color: "#ffffff"
                    text: "PERGERAKAN ROBOT"
                    anchors.fill: rhinoLabel
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 83
                    horizontalAlignment: Text.AlignLeft
                    anchors.rightMargin: -2
                    font.family: "Courier"
                    font.pointSize: 18
                    font.bold: true
                }

                Scene3D {
                    id: scene3d
                    aspects: ["input", "logic"]
                    Entity {
                        components: [
                            RenderSettings {
                                renderPolicy: RenderSettings.OnDemand
                                ForwardRenderer {
                                    camera: camera
                                }
                            },
                            InputSettings {
                            }]
                        Camera {
                            id: camera
                            position: Qt.vector3d( 20.0, 10.0, -20.0 )
                            projectionType: CameraLens.PerspectiveProjection
                            nearPlane: 0.1
                            farPlane: 1000
                            upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
                            viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
                            fieldOfView: 22.5
                        }

                        FirstPersonCameraController {
                            camera: camera
                        }

                        ObjectRhino {
                        }
                    }
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 55
                    anchors.rightMargin: 10
                    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
                    antialiasing: true
                }

                Button {
                    id: button
                    width: 32
                    height: 32
                    text: "!"
                    anchors.top: scene3d.top
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                    anchors.left: scene3d.left
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    onClicked: flags()
                }

                Text {
                    id: rhinoicon
                    color: "#ffffff"
                    text: "\uf544"
                    verticalAlignment: Text.AlignVCenter
                    anchors.top: rhinotext.top
                    anchors.leftMargin: -1
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    horizontalAlignment: Text.AlignHCenter
                    anchors.bottom: rhinotext.bottom
                    anchors.right: rhinotext.left
                    anchors.rightMargin: 0
                    font.family: myfont.name
                    anchors.left: parent.left
                    font.pixelSize: 20
                }
            }

            Rectangle {
                id: rectRhinoInfo

                width: 285
                height: 319
                color: Qt.rgba(0.15, 0.12, 0.22, 1)
                radius: 5
                anchors.right: parent.right
                anchors.rightMargin: 30
                visible: flag
                anchors.top: rect.bottom
                anchors.topMargin: 35
                layer.effect: DropShadow {
                    color: "#000000"
                    radius: 20
                    transparentBorder: true
                    horizontalOffset: -5
                    samples: 25
                    verticalOffset: 5
                }
                Column {
                    id: column
                    x: 0
                    y: 0
                    anchors.fill: rectRhinoInfo
                    spacing: 0
                    Row {
                        id: row
                        width: parent.width
                        height: parent.height/5
                        anchors.left: parent.left
                        spacing: 0
                        Rectangle {
                            id: rectangle3
                            width: parent.width *2/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: cir1
                                x: 10
                                y: 16
                                width: parent.width<parent.height?parent.width:parent.height * 0.5
                                height: width
                                color: "#66cccc"
                                radius: width*0.5
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: label2
                                color: "#ffffff"
                                text: qsTr("Turntable")
                                font.pointSize: 11
                                anchors.left: cir1.right
                                horizontalAlignment: Text.AlignHCenter
                                anchors.leftMargin: 20
                                font.bold: true
                                anchors.rightMargin: 20
                                verticalAlignment: Text.AlignVCenter
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle5
                            width: parent.width/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: rectangle4
                                color: Qt.rgba(0.1, 0.1, 0.18, 1)
                                radius: 5
                                anchors.topMargin: 10
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                Text {
                                    id: element1
                                    color: "#ffffff"
                                    text: String(UdpClient.dataTurntable) + "<b>°<b>"
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                anchors.bottomMargin: 10
                                anchors.rightMargin: 10
                            }
                        }
                    }

                    Row {
                        id: row1
                        width: parent.width
                        height: parent.height/5
                        anchors.left: parent.left
                        spacing: 0
                        Rectangle {
                            id: rectangle6
                            width: parent.width *2/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: cir2
                                x: 10
                                y: 16
                                width: parent.width<parent.height?parent.width:parent.height * 0.5
                                height: width
                                color: "#cc0033"
                                radius: width*0.5
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: label3
                                color: "#ffffff"
                                text: qsTr("Sholder")
                                font.pointSize: 11
                                anchors.left: cir2.right
                                horizontalAlignment: Text.AlignHCenter
                                anchors.leftMargin: 20
                                font.bold: true
                                anchors.rightMargin: 20
                                verticalAlignment: Text.AlignVCenter
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle8
                            width: parent.width/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: rectangle7
                                color: Qt.rgba(0.1, 0.1, 0.18, 1)
                                radius: 5
                                anchors.topMargin: 10
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                Text {
                                    id: element2
                                    color: "#ffffff"
                                    text: String(UdpClient.dataSholder) + "<b>°<b>"
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                anchors.bottomMargin: 10
                                anchors.rightMargin: 10
                            }
                        }
                    }

                    Row {
                        id: row2
                        width: parent.width
                        height: parent.height/5
                        anchors.left: parent.left
                        spacing: 0
                        Rectangle {
                            id: rectangle9
                            width: parent.width *2/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: cir3
                                x: 10
                                y: 16
                                width: parent.width<parent.height?parent.width:parent.height * 0.5
                                height: width
                                color: "#99ff00"
                                radius: width*0.5
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: label4
                                color: "#ffffff"
                                text: qsTr("Elbow")
                                font.pointSize: 11
                                anchors.left: cir3.right
                                horizontalAlignment: Text.AlignHCenter
                                anchors.leftMargin: 20
                                font.bold: true
                                anchors.rightMargin: 20
                                verticalAlignment: Text.AlignVCenter
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle11
                            width: parent.width/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: rectangle10
                                color: Qt.rgba(0.1, 0.1, 0.18, 1)
                                radius: 5
                                anchors.topMargin: 10
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                Text {
                                    id: element3
                                    color: "#ffffff"
                                    text: String(UdpClient.dataElbow) + "<b>°<b>"
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                anchors.bottomMargin: 10
                                anchors.rightMargin: 10
                            }
                        }
                    }

                    Row {
                        id: row3
                        width: parent.width
                        height: parent.height/5
                        anchors.left: parent.left
                        spacing: 0
                        Rectangle {
                            id: rectangle12
                            width: parent.width *2/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: cir4
                                x: 10
                                y: 16
                                width: parent.width<parent.height?parent.width:parent.height * 0.5
                                height: width
                                color: "#cc6600"
                                radius: width*0.5
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: label5
                                color: "#ffffff"
                                text: qsTr("Wrist")
                                font.pointSize: 11
                                anchors.left: cir4.right
                                horizontalAlignment: Text.AlignHCenter
                                anchors.leftMargin: 20
                                font.bold: true
                                anchors.rightMargin: 20
                                verticalAlignment: Text.AlignVCenter
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle14
                            width: parent.width/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: rectangle13
                                color: Qt.rgba(0.1, 0.1, 0.18, 1)
                                radius: 5
                                anchors.topMargin: 10
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                Text {
                                    id: element4
                                    color: "#ffffff"
                                    text: String(UdpClient.dataWrist) + "<b>°<b>"
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                anchors.bottomMargin: 10
                                anchors.rightMargin: 10
                            }
                        }
                    }

                    Row {
                        id: row4
                        width: parent.width
                        height: parent.height/5
                        anchors.left: parent.left
                        spacing: 0
                        Rectangle {
                            id: rectangle15
                            width: parent.width *2/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: cir5
                                x: 10
                                y: 16
                                width: parent.width<parent.height?parent.width:parent.height * 0.5
                                height: width
                                color: "#66ff66"
                                radius: width*0.5
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: label6
                                color: "#ffffff"
                                text: qsTr("Flipper")
                                font.pointSize: 11
                                anchors.left: cir5.right
                                horizontalAlignment: Text.AlignHCenter
                                anchors.leftMargin: 20
                                font.bold: true
                                anchors.rightMargin: 20
                                verticalAlignment: Text.AlignVCenter
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle17
                            width: parent.width/3
                            height: parent.height
                            color: "#00000000"
                            Rectangle {
                                id: rectangle16
                                color: Qt.rgba(0.1, 0.1, 0.18, 1)
                                radius: 5
                                anchors.topMargin: 10
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                Text {
                                    id: element5
                                    color: "#ffffff"
                                    text: String(UdpClient.dataFlipper) + "<b>°<b>"
                                    anchors.fill: parent
                                    font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                anchors.bottomMargin: 10
                                anchors.rightMargin: 10
                            }
                        }
                    }
                }
                layer.enabled: true
                border.width: 0
            }
        }

        Rectangle {
            id: rectCenter
            width: parent.width * 1/5
            color: "#00000000"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: rectLeft.right
            anchors.leftMargin: 0
            Rectangle{
                id:rectCompass
                height: 300
                color: Qt.rgba(0.15, 0.12, 0.22, 1)
                anchors.rightMargin: 40
                anchors.leftMargin: 40
                anchors.topMargin: 380
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.top
                radius:5
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "#000000"
                    radius: 20
                    transparentBorder: true
                    horizontalOffset: -5
                    samples: 25
                    verticalOffset: 5
                }

                Loader {
                    id: compassLabel
                    height: 50
                    visible: true
                    anchors.top: parent.top
                    sourceComponent: label
                    anchors.left: parent.left
                    asynchronous: false
                    anchors.bottomMargin: 15
                    anchors.right: parent.right
                }
                Text {
                    id: compicon
                    width: 40
                    color: "#ffffff"
                    text: "\uf14e"
                    anchors.topMargin: 0
                    anchors.right: compassText.left
                    anchors.top: compassLabel.top
                    transformOrigin: Item.Center
                    anchors.rightMargin: 0
                    anchors.bottom: compassLabel.bottom
                    anchors.bottomMargin: 0
                    font.pointSize: 18
                    anchors.left: compassLabel.left
                    horizontalAlignment: Text.AlignHCenter
                    anchors.leftMargin: 0
                    font.family: myfont.name
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    id: compassText
                    color: "#ffffff"
                    text: "KOMPAS"
                    anchors.topMargin: 0
                    anchors.top: compassLabel.top
                    font.pixelSize: 18
                    anchors.bottom: compassLabel.bottom
                    anchors.left: compassLabel.left
                    horizontalAlignment: Text.AlignLeft
                    anchors.leftMargin: 60
                    font.family: "Courier"
                    anchors.bottomMargin: 0
                    font.bold: true
                    anchors.rightMargin: 0
                    verticalAlignment: Text.AlignVCenter
                    anchors.right: compassLabel.right
                }

                Image {
                    id: overlayCompass
                    height: 0
                    anchors.bottomMargin: 15
                    anchors.top: compassLabel.bottom
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.topMargin: 20
                    visible: true
                    rotation: UdpClient.dataCompass
                    source: "qrc:/img/img/overlayCompass.png"
                    fillMode: Image.PreserveAspectFit
                    layer.effect: Glow {
                        color: "#52219a"
                        radius: 10
                        transparentBorder: true
                        spread: 0.2
                        samples: 10
                    }
                    layer.enabled: true
                    antialiasing: true
                    //transformOrigin: pointerCompassTransformOrigin
                }
                Image {
                    id: pointerCompass
                    anchors.fill: overlayCompass
                    source: "qrc:/img/img/pointerCompass.png"
                    fillMode: Image.PreserveAspectFit
                    scale: 0.35
                    antialiasing: true
                    transformOrigin: Item.Center
                }

            }

            Rectangle {
            id: rectBatt
            color: Qt.rgba(0.15, 0.12, 0.22, 1)
            radius: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 60
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            anchors.top: rectCompass.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 40
            layer.effect: DropShadow {
                color: "#000000"
                radius: 20
                transparentBorder: true
                horizontalOffset: -5
                samples: 25
                verticalOffset: 5
            }
            antialiasing: true
            layer.enabled: true
            border.width: 0

            Loader {
                height: 40
                anchors.right: parent.right
                sourceComponent: label
                anchors.left: parent.left
                anchors.top: parent.top
            }

            RadialBar {
                width: 150
                height: 150
                antialiasing: true
                minValue: 0
                anchors.verticalCenterOffset: 20
                maxValue: 100
                startAngle: 180
                penStyle: Qt.RoundCap
                textFont.pointSize: 16
                anchors.centerIn: parent
                dialType: RadialBar.FullDial
                foregroundColor: "#191a2f"
                value: UdpClient.dataBattery
                anchors.top: parent.top
                progressColor: Qt.rgba(0.02, 0.67, 0.59, 1)
                textFont.family: "Consolas"
                dialWidth: 5
                textFont.italic: false
                suffixText: "%"
                spanAngle: 180
                textColor: Qt.rgba(0.13, 0.71, 0.46, 1)
            }

            Text {
                id: battext
                height: 40
                color: "#ffffff"
                text: "BATERAI"
                anchors.right: parent.right
                anchors.topMargin: 0
                antialiasing: true
                anchors.leftMargin: 60
                font.family: "Courier"
                anchors.left: parent.left
                font.bold: true
                anchors.rightMargin: 0
                anchors.top: parent.top
                font.pointSize: 15
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Text {
                id: baticon
                height: 40
                color: "#ffffff"
                text: "\uf5df"
                anchors.right: battext.left
                anchors.topMargin: 0
                anchors.leftMargin: 0
                font.family: myfont.name
                font.pixelSize: 18
                anchors.left: parent.left
                anchors.rightMargin: 0
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            }

        }

        Rectangle {
            id: rectRight
            color: "#00000000"
            clip: false
            anchors.left: rectCenter.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0


            Rectangle {
                id: rectCamera
                height: parent.height/2 +100
                color: Qt.rgba(0.12, 0.11, 0.21, 1)
                radius: 5
                anchors.bottomMargin: 60
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                layer.effect: DropShadow {
                    color: "#000000"
                    radius: 20
                    transparentBorder: true
                    horizontalOffset: -5
                    verticalOffset: 5
                    samples: 25
                }
                border.width: 0
                layer.enabled: true

                CameraStream {
                    id: stream
                    radius: 5
                    anchors.fill: parent
                    anchors.rightMargin: 5
                    anchors.topMargin: 15
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                }

                Rectangle {
                    id: rectangle
                    height: 50
                    color: "#00000000"
                    radius: 2
                    anchors.left: parent.left
                    anchors.rightMargin: 0
                    Loader {
                        height: 50
                        anchors.fill: parent
                        visible: true
                        antialiasing: true
                        sourceComponent: label
                    }

                    Text {
                        width: 300
                        height: 50
                        color: "#ffffff"
                        text: "KAMERA"
                        font.bold: true
                        anchors.fill: rectangle
                        font.pointSize: 18
                        antialiasing: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Courier"
                    }
                    anchors.topMargin: 0
                    antialiasing: true
                    anchors.top: parent.top
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                }
            }

        }

    }
}



































































/*##^## Designer {
    D{i:19;anchors_width:768}D{i:13;anchors_width:768}D{i:27;anchors_width:285;anchors_x:"-9";anchors_y:"-8"}
D{i:74;anchors_height:300;anchors_width:200}D{i:65;anchors_height:200}D{i:81;anchors_height:0;anchors_width:307.2}
D{i:80;anchors_height:200;anchors_width:200}
}
 ##^##*/
