import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

import UdpClient 1.0
import Scale 1.0


    Rectangle {
         id: rectRhinoInfo
        // width: Scaling.hscale(512)
        // height: Scaling.vscale(240)

//         height: 240
//         width: 512
        color: Qt.rgba(0.12, 0.11, 0.21, 1)
        radius: 5
        layer.enabled: true
        border.width: 0
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
//            anchors.rightMargin: Scaling.hscale(10)
//            anchors.leftMargin: Scaling.hscale(10)
//            anchors.bottomMargin: Scaling.vscale(10)
//            anchors.topMargin: Scaling.vscale(10)
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
                        width: parent.width<parent.height?parent.width:parent.height * 0.5
                        height: width
                        color: "#66cccc"
                        radius: width*0.5
                        anchors.left: parent.left
                        anchors.leftMargin: Scaling.hscale(30)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label2
                        color: "#ffffff"
                        text: qsTr("Turntable")
                        font.family: "Courier"
                        font.pointSize: Scaling.tscale(14)
                        anchors.left: cir1.right
                        horizontalAlignment: Text.AlignLeft
                        anchors.leftMargin: Scaling.hscale(30)
                        font.bold: true
                        anchors.rightMargin: Scaling.hscale(20)
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
                        color: "#11112e"
                        radius: 5
                        anchors.topMargin: Scaling.vscale(5)
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        anchors.bottomMargin: Scaling.vscale(5)
                        anchors.rightMargin: Scaling.hscale(10)
                        Text {
                            id: element1
                            color: "#ffffff"
                            text: String(UdpClient.dataTurntable) + "<b>°<b>"
                            anchors.fill: parent
                            font.pointSize: Scaling.tscale(16)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

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
                        width: parent.width<parent.height?parent.width:parent.height * 0.5
                        height: width
                        color: "#cc0033"
                        radius: width*0.5
                        anchors.left: parent.left
                        anchors.leftMargin: Scaling.hscale(30)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label3
                        color: "#ffffff"
                        text: qsTr("Sholder")
                        font.family: "Courier"
                        font.pointSize: Scaling.tscale(14)
                        anchors.left: cir2.right
                        horizontalAlignment: Text.AlignLeft
                        anchors.leftMargin: Scaling.hscale(30)
                        font.bold: true
                        anchors.rightMargin: Scaling.hscale(20)
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
                        anchors.topMargin: Scaling.vscale(5)
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        anchors.bottomMargin: Scaling.vscale(5)
                        anchors.rightMargin: Scaling.hscale(10)
                        Text {
                            id: element2
                            color: "#ffffff"
                            text: String(UdpClient.dataSholder) + "<b>°<b>"
                            anchors.fill: parent
                            font.pointSize: Scaling.tscale(16)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

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
                        width: parent.width<parent.height?parent.width:parent.height * 0.5
                        height: width
                        color: "#99ff00"
                        radius: width*0.5
                        anchors.left: parent.left
                        anchors.leftMargin: Scaling.hscale(30)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label4
                        color: "#ffffff"
                        text: qsTr("Elbow")
                        font.family: "Courier"
                        font.pointSize: Scaling.tscale(14)
                        anchors.left: cir3.right
                        horizontalAlignment: Text.AlignLeft
                        anchors.leftMargin: Scaling.hscale(30)
                        font.bold: true
                        anchors.rightMargin: Scaling.hscale(20)
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
                        color: "#11112e"
                        radius: 5
                        anchors.topMargin: Scaling.vscale(5)
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        anchors.bottomMargin: Scaling.vscale(5)
                        anchors.rightMargin: Scaling.hscale(10)
                        Text {
                            id: element3
                            color: "#ffffff"
                            text: String(UdpClient.dataElbow) + "<b>°<b>"
                            anchors.fill: parent
                            font.pointSize: Scaling.tscale(16)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

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
                        width: parent.width<parent.height?parent.width:parent.height * 0.5
                        height: width
                        color: "#cc6600"
                        radius: width*0.5
                        anchors.left: parent.left
                        anchors.leftMargin: Scaling.hscale(30)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label5
                        color: "#ffffff"
                        text: qsTr("Wrist")
                        font.family: "Courier"
                        font.pointSize: Scaling.tscale(14)
                        anchors.left: cir4.right
                        horizontalAlignment: Text.AlignLeft
                        anchors.leftMargin: Scaling.hscale(30)
                        font.bold: true
                        anchors.rightMargin: Scaling.hscale(20)
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
                        anchors.topMargin: Scaling.vscale(5)
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        anchors.bottomMargin: Scaling.vscale(5)
                        anchors.rightMargin: Scaling.hscale(10)
                        Text {
                            id: element4
                            color: "#ffffff"
                            text: String(UdpClient.dataWrist) + "<b>°<b>"
                            anchors.fill: parent
                            font.pointSize: Scaling.tscale(16)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

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
                        width: parent.width<parent.height?parent.width:parent.height * 0.5
                        height: width
                        color: "#66ff66"
                        radius: width*0.5
                        anchors.left: parent.left
                        anchors.leftMargin: Scaling.hscale(30)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label6
                        color: "#ffffff"
                        text: qsTr("Flipper")
                        font.family: "Courier"
                        font.pointSize: Scaling.tscale(14)
                        anchors.left: cir5.right
                        horizontalAlignment: Text.AlignLeft
                        anchors.leftMargin: Scaling.hscale(30)
                        font.bold: true
                        anchors.rightMargin: Scaling.hscale(20)
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
                        color: "#11112e"
                        radius: 5
                        anchors.topMargin: Scaling.vscale(5)
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        anchors.bottomMargin: Scaling.vscale(5)
                        anchors.rightMargin: Scaling.hscale(10)
                        Text {
                            id: element5
                            color: "#ffffff"
                            text: String(UdpClient.dataFlipper) + "<b>°<b>"
                            anchors.fill: parent
                            font.pointSize: Scaling.tscale(16)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                    }
                }
            }
        }

    }

