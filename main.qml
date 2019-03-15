import QtQuick 2.9
import QtQuick.Controls 2.5

import QtQuick.Scene3D 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12

import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12

import UdpClient 1.0



ApplicationWindow {
    id: window
    visible: true
    visibility: Window.FullScreen
    width: 1920


    height: 1080
    property alias window: window
    //property alias mainPage: mainPage
    property alias stackView: stackView
   // height: Screen.

    title: qsTr("Stack")

    footer: ToolBar {
        // contentHeight: toolButton.implicitHeight
        id: toolbar
        visible: toolbarEnable()
        background:
            //            Rectangle{
            //            id: rectToolBar
            //            implicitHeight: parent
            //            implicitWidth: parent
            //            color: "white"
            RectangularGlow{
            anchors.fill: toolbar
            glowRadius: 4
            spread: 0.2
            //color: "#252C3F"
            color: Qt.rgba(0.1, 0.1, 0.18, 1)
        }


        ToolButton {
            id: toolButton
            text:  "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            background: RectangularGlow{
                id: toolButtonEffect
                implicitHeight: 30
                implicitWidth: 30
                glowRadius: 1
                spread: 1
                cornerRadius: 3
                //color: "#1ABD9E"
                color: color()

                function color(){
                    if(area.containsMouse){
                        return "black"
                    }
                    else
                        return "#05AB97"
                }
            }

            MouseArea{
                id:area
                implicitHeight: parent.implicitHeight
                implicitWidth: parent.implicitWidth
                enabled: true
                hoverEnabled: true
                onClicked: drawer.open()


            }
        }


    }



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
        initialItem:// "HomeForm.qml"

        Page {
            id: page1
            Item {
                anchors.fill: parent
                Button{
                    text: "Ini Tombol Masuk"

                    anchors.centerIn: parent
                    onClicked: {stackView.push("mainGUI2.qml")
                        console.log(stackView.depth)
                    }
                }
            }
        }

    }
    function toolbarEnable(){
        if(stackView.depth>1)
            return true;
        else
            return false;
    }

}

