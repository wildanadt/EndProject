import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Controls.Styles 1.4

//import QtQuick.Scene3D 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import QtQuick.Window 2.11

import Qt3D.Core 2.9
import Qt3D.Render 2.9
import Qt3D.Input 2.1
import Qt3D.Extras 2.9
import Scale 1.0


import UdpClient 1.0



ApplicationWindow {
    id: window
    visible: true
    // visibility: Window.FullScreen
    height: Scaling.screenHeight
    width: Scaling.screenWidth


    property alias window: window
    //property alias mainPage: mainPage
    property alias stackView: stackView
    // height: Screen.

    title: qsTr("Stack")

    //    footer: ToolBar {
    //        // contentHeight: toolButton.implicitHeight
    //        id: toolbar
    //        visible: false
    //        background:
    //            //            Rectangle{
    //            //            id: rectToolBar
    //            //            implicitHeight: parent
    //            //            implicitWidth: parent
    //            //            color: "white"
    //            RectangularGlow{
    //            anchors.fill: toolbar
    //            glowRadius: 4
    //            spread: 0.2
    //            //color: "#252C3F"
    //            color: Qt.rgba(0.1, 0.1, 0.18, 1)
    //        }


    //        ToolButton {
    //            id: toolButton
    //            text:  "\u2630"
    //            font.pixelSize: Qt.application.font.pixelSize * 1.5
    //            background: RectangularGlow{
    //                id: toolButtonEffect
    //                implicitHeight: Scaling.vscale(30)
    //                implicitWidth: Scaling.hscale(30)
    //                glowRadius: 1
    //                spread: 1
    //                cornerRadius: 3
    //                //color: "#1ABD9E"
    //                color: color()

    //                function color(){
    //                    if(area.containsMouse){
    //                        return "black"
    //                    }
    //                    else
    //                        return "#05AB97"
    //                }
    //            }

    //            MouseArea{
    //                id:area
    //                implicitHeight: parent.implicitHeight
    //                implicitWidth: parent.implicitWidth
    //                enabled: true
    //                hoverEnabled: true
    //                onClicked: drawer.open()


    //            }
    //        }


    //    }



    Drawer {
        id: drawer
        width: window.width * 0.2
        height: window.height
        opacity: 1

        Column {
            anchors.fill: parent

            Switch{
                text: "button"

            }

            ItemDelegate {
                text: qsTr("Quit")
                width: parent.width
                onClicked: {
                    stackView.pop(page1)
                    drawer.close()
                    console.log(stackView.depth)
                }
            }
            ItemDelegate {
                text: qsTr("Exit")
                width: parent.width
                onClicked: {
                    window.close()
                }
            }
        }
    }
    StackView {
        id: stackView
        anchors.fill: parent
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 500
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 500
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        initialItem:  Page {
            id: page1
            background: Image {
                id: menupict
                source: "qrc:/images/img/mainmenupict.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }
            Item {
                anchors.fill: parent
//                Rectangle{

//                    height: Scaling.vscale(30)
//                    width: Scaling.hscale(200)
//                    border.width: 1
//                    border.color: "gray"
//                    anchors.horizontalCenter: loginbutton.horizontalCenter
//                    anchors.bottom: loginbutton.top
//                    anchors.bottomMargin: Scaling.vscale(20)

                    QQC1.TextField{
                        id: passField
                        anchors.horizontalCenter: loginbutton.horizontalCenter
                        anchors.bottom: loginbutton.top
                        anchors.bottomMargin: Scaling.vscale(20)
                        placeholderText: qsTr("Masukkan ID robot!")
                       // placeholderTextColor: "gray"
                        echoMode: TextInput.Password
                       // anchors.fill: parent
                        style: TextFieldStyle{
                            textColor: "black"
                            background: Rectangle {
                                radius: 5
                                implicitWidth: 350
                                implicitHeight: 40
                                border.color: "#333"
                                border.width: 2
                            }
                        }

                    }
//                }
                Rectangle{
                    id:warningrect
                    anchors.horizontalCenter: loginbutton.horizontalCenter
                    anchors.top: loginbutton.bottom
                    anchors.topMargin: Scaling.vscale(20)
                    border.width: 1
                    border.color: "red"
                    radius: 5
                    width: Scaling.hscale(200)
                    height: Scaling.vscale(30)
                    Label{
                        id: warningText
                        text: qsTr("ID robot tidak sesuai")
                        font.bold: true
                        color: "red"
                        font.family: "Arial"
                        font.pointSize: Scaling.tscale(13)
                        visible: parent.visible
                        anchors.centerIn: parent
                    }
                    OpacityAnimator{
                        id: warningAnim
                        target: warningrect;
                        from: 1;
                        to: 0;
                        duration: 1500;
                        running: false
                    }
                    visible: false
                }


                QQC1.Button{
                    //text: "Masuk"

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    id: loginbutton


                    style: ButtonStyle{
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 35
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                        label: Text{
                            text: "Masuk"
                            color: "gray"
                            font.bold: true
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    onClicked: {
                        if(passField.text==="1"){
                            stackView.push("qrc:/qml/qml/mainGUI2.qml")
                            warningrect.visible = false
                            warningAnim.running = false

                        }
                        else{
                            warningrect.visible = true
                            warningAnim.running = true
                        }
                        console.log(passField.text)
                    }
                }
            }
        }

    }
    //    function toolbarEnable(){
    //        if(stackView.depth>1)
    //            return true;
    //        else
    //            return false;
    //    }

}

