import QtQuick 2.0
import QtQml 2.3
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Scene3D 2.0
import QtGraphicalEffects 1.0
import QtGraphicalEffects 1.0 as QQ
import QtQuick.Window 2.11
import QtQuick.Window 2.2
import QtQuick.Controls.Universal 2.2
import QtQuick.Controls.Styles 1.4

import Qt3D.Core 2.9
import Qt3D.Render 2.9
import Qt3D.Input 2.1
import Qt3D.Extras 2.9

import UdpClient 1.0
import CustomControls 1.0
import Scale 1.0




Page{
    id: mainPage
    property bool flag: false
    property alias rectCameraBottom: rectCamera.bottom

    height: Scaling.screenHeight
    property alias rectRight: rectRight
    width: Scaling.screenWidth
    //        height: 1080
    //        width: 1920
//    Timer {
//        interval: 2000
//        repeat: true
//        running: true
//        triggeredOnStart: true
//        onTriggered: {
//            //console.log(Scaling.rectLeftMargin)
//            //console.log(Scaling.vscale(321))
//            console.log(mainPage.width)
//            console.log(Screen.devicePixelRatio)
//            console.log(Screen.height)
//            //console.log(Scaling.hscale(60))
//            // console.log(rect.anchors.topMargin)
//            //            console.log(rect.anchors.leftMargin)


//        }
//    }

    background: Rectangle{
        anchors.fill: parent
        RadialGradient {
            horizontalOffset: Scaling.hscale(900)
            verticalOffset: Scaling.vscale(-500)
            // horizontalRadius: 300
            //verticalRadius: 300
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 1.0; color: "#240336" }
                GradientStop { position: 0.3; color: "#5C0136" }
                GradientStop { position: 0.0; color: "#840848" }
            }
        }
    }


    FontLoader{
        id:myfont
        source: "qrc:/font/font/Font Awesome 5 Free-Solid-900.otf"
    }
    //    FontLoader{
    //        id:myfontRegular
    //        source: "qrc:/font/font/Font Awesome 5 Free-Regular-400.otf"
    //    }

    Component{
        id:label

        Rectangle{
            radius: Scaling.tscale(5)
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
        anchors.fill: parent

        Component{
            id:glow
            Glow {
                samples: 5
                color: Qt.rgba(0.13, 0.04, 0.22, 1)
                transparentBorder: true
            }
        }

        Component{
            id:shadow
            DropShadow {

                color: "#000000"
                radius: 20
                transparentBorder: true
                horizontalOffset: -5
                samples: 25
                verticalOffset: 5
            }
        }

        Rectangle {
            id: rectLeft

            color: "#00000000"
            width: mainPage.width *3/5
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Loader{
                id: loadRhinoInfo
                source: "qrc:/qml/qml/rhinoInfo.qml"
                width: rect.width * 1/2
                //height: Scaling.vscale(240)
                anchors.left: rect.left
                anchors.leftMargin: 0
                visible: flag
                anchors.top: rect.bottom
                anchors.topMargin: Scaling.vscale(25)
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Scaling.vscale(40)
            }

            Rectangle {
                id: rect
                height: parent.height/2 + Scaling.vscale(100)
                width: parent.width * 7.6/12
                radius: 5
                border.width: 2
                //anchors.right: parent.right
                //anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: Scaling.hscale(30)
                anchors.top: parent.top
                anchors.topMargin: Scaling.vscale(30)
                color: "white"
                border.color: Qt.rgba(0.15, 0.12, 0.22, 1)
                layer.effect: shadow
                visible: true
                // antialiasing: true
                layer.enabled: true

                Loader {
                    id: rhinoLabel
                    anchors.top: parent.top
                    height: Scaling.vscale(40)
                    anchors.leftMargin: Scaling.hscale(-1)
                    sourceComponent: label
                    anchors.right: parent.right
                    anchors.rightMargin: Scaling.hscale(-1)
                    // antialiasing: true
                    anchors.left: parent.left
                }
                Text {
                    id: rhinoicon
                    color: "#ffffff"
                    text: "\uf544"
                    width: Scaling.hscale(60)
                    verticalAlignment: Text.AlignVCenter
                    anchors.top: rhinoLabel.top
                    anchors.leftMargin: Scaling.hscale(-1)
                    horizontalAlignment: Text.AlignHCenter
                    anchors.bottom: rhinoLabel.bottom
                    font.family: myfont.name
                    anchors.left: rhinoLabel.left
                    font.pointSize: Scaling.tscale(18)
                    fontSizeMode: Text.Fit
                }

                Text {
                    id: rhinotext
                    color: "#ffffff"
                    text: "PERGERAKAN ROBOT"
                    anchors.left: rhinoicon.right
                    anchors.top: rhinoLabel.top
                    anchors.bottom: rhinoLabel.bottom
                    anchors.right: rhinoLabel.right
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.family: "Courier"
                    font.pointSize: Scaling.tscale(18)
                    font.bold: true
                    fontSizeMode: Text.Fit

                }

                Scene3D {
                    id: scene3d
                    aspects: ["input", "logic"]
                    anchors.top: rhinoLabel.bottom
                    anchors.left: rect.left
                    anchors.right: rect.right
                    anchors.bottom: rect.bottom
                    anchors.leftMargin: Scaling.hscale(10)
                    anchors.bottomMargin: Scaling.vscale(10)
                    anchors.topMargin: Scaling.vscale(10)
                    anchors.rightMargin: Scaling.hscale(10)
                    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
                    // antialiasing: true

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


                    //                        Entity {
                    //                            components: [
                    //                                PointLight {
                    //                                    enabled: parent.enabled
                    //                                    color: "black"
                    //                                    intensity: 0
                    //                                },
                    //                                EnvironmentLight {
                    //                                    enabled: parent.enabled

                    //                                    irradiance: TextureLoader {
                    //                                        source: "qrc:/cubemaps/cubemaps/default_irradiance.dds"
                    //                                        wrapMode {
                    //                                            x: WrapMode.ClampToEdge
                    //                                            y: WrapMode.ClampToEdge
                    //                                        }
                    //                                        generateMipMaps: false
                    //                                    }
                    //                                    specular: TextureLoader {
                    //                                        source: "qrc:/cubemaps/cubemaps/default_specular.dds"
                    //                                        wrapMode {
                    //                                            x: WrapMode.ClampToEdge
                    //                                            y: WrapMode.ClampToEdge
                    //                                        }
                    //                                        generateMipMaps: false
                    //                                    }
                    //                                }
                    //                            ]
                    //                        }

                    //                        Entity {
                    //                            id: floor

                    //                            components: [
                    //                                Mesh {
                    //                                    source: "qrc:/obj/obj/plane-10x10.obj"
                    //                                },
                    //                                TexturedMetalRoughMaterial {
                    //                                    baseColor: TextureLoader {
                    //                                        source: "qrc:/img/img/ceramic_small_diamond_roughness.png"
                    //                                        format: Texture.SRGB8_Alpha8
                    //                                        generateMipMaps: true
                    //                                    }
                    //                                     metalness: TextureLoader { source: "qrc:/img/img/ceramic_small_diamond_metallic.png"; generateMipMaps: true }
                    //                                     roughness: TextureLoader { source: "qrc:/img/img/ceramic_small_diamond_roughness.png"; generateMipMaps: true }
                    //                                    normal: TextureLoader { source: "qrc:/img/img/ceramic_small_diamond_normal.png"; generateMipMaps: true }
                    //                                     ambientOcclusion: TextureLoader { source: "qrc:/img/img/ceramic_small_diamond_ambient_occlusion.png" }
                    //                                }
                    //                            ]
                    //                        }



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
                    highlighted: true
                    Universal.accent: Universal.Olive
                    Universal.foreground: Universal.Crimson
                    onClicked: flags()
                }
            }

            Rectangle {
                id: rectCompass
                color: Qt.rgba(0.15, 0.12, 0.22, 0.8)
                radius: 5
                anchors.left: rectBatt.right
                layer.effect: shadow
                //                layer.effect: DropShadow {
                //                    color: "#000000"
                //                    radius: 20
                //                    transparentBorder: true
                //                    horizontalOffset: -5
                //                    samples: 25
                //                    verticalOffset: 5
                //                }
                anchors.top: rectBatt.top
                anchors.topMargin: 0
                // height: Scaling.vscale(300)
                anchors.rightMargin: Scaling.hscale(20)
                anchors.bottom: rectBatt.bottom
                anchors.right: rectLeft.right
                anchors.leftMargin: Scaling.hscale(20)
                layer.enabled: true
                Loader {
                    id: compassLabel
                    height: Scaling.vscale(50)
                    anchors.left: rectCompass.left
                    anchors.top: rectCompass.top
                    sourceComponent: label
                    asynchronous: false
                    visible: true
                    anchors.right: rectCompass.right
                }

                Text {
                    id: compicon
                    width: Scaling.hscale(60)
                    color: "#ffffff"
                    text: "\uf14e"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: Scaling.tscale(18)
                    anchors.left: compassLabel.left
                    anchors.top: compassLabel.top
                    font.family: myfont.name
                    transformOrigin: Item.Center
                    horizontalAlignment: Text.AlignHCenter
                    anchors.bottom: compassLabel.bottom
                    font.bold: true
                    fontSizeMode: Text.Fit
                }

                Text {
                    id: compassText
                    color: "#ffffff"
                    text: "KOMPAS"
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: compicon.right
                    anchors.top: compassLabel.top
                    font.family: "Courier"
                    font.pointSize: Scaling.tscale(18)
                    horizontalAlignment: Text.AlignLeft
                    anchors.bottom: compassLabel.bottom
                    font.bold: true
                    anchors.right: compassLabel.right
                    fontSizeMode: Text.Fit
                }

                Image {
                    id: overlayCompass
                    smooth: false
                    anchors.left: parent.left
                    layer.effect: Glow {
                        color: "#52219a"
                        radius: 10
                        transparentBorder: true
                        spread: 0.2
                        samples: 10
                    }
                    //sourceSize.height: 1000
                    //sourceSize.width: 1000
                    anchors.top: compassLabel.bottom
                    anchors.right: rectCompass.right
                    anchors.bottom: rectCompass.bottom
                    anchors.leftMargin: Scaling.hscale(30)
                    anchors.topMargin: Scaling.vscale(25)
                    anchors.rightMargin: Scaling.hscale(30)
                    anchors.bottomMargin: Scaling.vscale(30)
                    source: "qrc:/images/img/overlayCompass.png"
                    antialiasing: true
                    visible: true
                    layer.enabled: true
                    fillMode: Image.PreserveAspectFit
                    rotation: UdpClient.dataCompass

                }

                Image {
                    id: pointerCompass
                    smooth: false
                    source: "qrc:/images/img/pointerCompass.png"
                    transformOrigin: Item.Center
                    antialiasing: true
                    scale: 0.35
                    anchors.fill: overlayCompass
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: compValue
//                    width: Scaling.hscale(75)
//                    height: Scaling.vscale(15)
                    color: "#ffffff"
                    text: String(UdpClient.dataCompass) + "°"
                    verticalAlignment: Text.AlignVCenter
                    anchors.right: rectCompass.right
                    anchors.bottom: rectCompass.bottom
                    anchors.rightMargin: Scaling.hscale(10)
                    anchors.bottomMargin: Scaling.vscale(15)
                    font.family: "Courier"
                    font.pointSize: Scaling.tscale(20)
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    fontSizeMode: Text.Fit

                }

            }

            Rectangle {
                id: rectBatt
                //x: 40
                color: Qt.rgba(0.15, 0.12, 0.22, 0.8)
                radius: 5
                border.width: 0
                anchors.right: rect.right
                // height: Scaling.vscale(rectCompass.height)
                anchors.top: rect.bottom
                anchors.topMargin: Scaling.vscale(25)
                //anchors.leftMargin: Scaling.hscale(40)
                //anchors.left: rectCompass.left
                //anchors.rightMargin: Scaling.hscale(40)
                layer.enabled: true
                anchors.bottomMargin: Scaling.vscale(40)
                anchors.left: loadRhinoInfo.right
                anchors.leftMargin: Scaling.hscale(20);
                anchors.bottom:rectLeft.bottom
                antialiasing: true
                layer.effect: shadow
                //                layer.effect: DropShadow {
                //                    color: "#000000"
                //                    radius: 20
                //                    horizontalOffset: -5
                //                    verticalOffset: 5
                //                    transparentBorder: true
                //                    samples: 25
                //                }
                Loader {
                    id:battLabel
                    height: Scaling.vscale(50)
                    anchors.right: parent.right
                    anchors.left: parent.left
                    sourceComponent: label
                    anchors.top: parent.top
                }

                RadialBar {
                    width: rectBatt.width/2
                    height: width
                    value: UdpClient.dataBattery
                    dialType: RadialBar.FullDial
                    anchors.top: parent.top
                    textFont.family: "Consolas"
                    spanAngle: 180
                    startAngle: 180
                    suffixText: "%"
                    maxValue: 100
                    foregroundColor: "#240336"
                    penStyle: Qt.RoundCap
                    textColor: Qt.rgba(0.13, 0.71, 0.46, 1)
                    minValue: 0
                    dialWidth: 5
                    antialiasing: true
                    textFont.pointSize: Scaling.tscale(16)
                    anchors.centerIn: rectBatt
                    progressColor: Qt.rgba(0.02, 0.67, 0.59, 1)
                    anchors.verticalCenterOffset: Scaling.vscale(20)
                    textFont.italic: false
                }

                Text {
                    id: baticon
                    color: "#ffffff"
                    text: "\uf5df"
                    width: Scaling.hscale(60)
                    anchors.top: battLabel.top
                    anchors.left: battLabel.left
                    anchors.bottom: battLabel.bottom
                    font.family: myfont.name
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: Scaling.tscale(18)
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit

                }

                Text {
                    id: battext
                    color: "#ffffff"
                    text: "BATERAI"
                    font.family: "Courier"
                    anchors.left: baticon.right
                    anchors.right: battLabel.right
                    anchors.top: battLabel.top
                    anchors.bottom: battLabel.bottom
                    font.bold: true
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    antialiasing: true
                    font.pointSize: Scaling.tscale(18)
                    fontSizeMode: Text.Fit
                }
            }
        }

        Rectangle {
            id: rectRight
            color: "#00000000"
            anchors.left: rectLeft.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0


            Rectangle {
                id: rectCamera
                height: parent.height/2 + Scaling.vscale(100)
                width: parent.width - Scaling.hscale(20)
                color: Qt.rgba(0.12, 0.11, 0.21, 1)
                radius: 5
                anchors.right: parent.right
                anchors.rightMargin: Scaling.hscale(30)
                antialiasing: true
                anchors.top: parent.top
                anchors.topMargin: Scaling.vscale(30)
                layer.effect: shadow
                //                layer.effect: DropShadow {
                //                    color: "#000000"
                //                    radius: 20
                //                    transparentBorder: true
                //                    horizontalOffset: -5
                //                    verticalOffset: 5
                //                    samples: 25
                //                }
                layer.enabled: true

                CameraStream {
                    id: stream
                    radius: 5
                    anchors.fill: parent
                    anchors.rightMargin: Scaling.hscale(5)
                    anchors.topMargin: Scaling.vscale(15)
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.leftMargin: Scaling.hscale(5)
                    anchors.bottomMargin: Scaling.hscale(5)
                    //mediaplayer1Source: "sdd"
                }

                //                Rectangle {
                //                    id: rectangle
                //                    height: 50
                //                    color: "#00000000"
                //                    radius: 2
                //                    anchors.left: parent.left
                //                    anchors.rightMargin: 0

                Loader {
                    id:kameralabel
                    anchors.top: parent.top
                    height: Scaling.vscale(40)
                    anchors.leftMargin: Scaling.hscale(-1)
                    sourceComponent: label
                    anchors.right: parent.right
                    anchors.rightMargin: Scaling.hscale(-1)
                    // antialiasing: true
                    anchors.left: parent.left
                    active: true
                }
                Text {
                    id: kameraicon
                    width: Scaling.hscale(60)
                    color: "#ffffff"
                    text: qsTr("\uf083")
                    font.family: myfont.name
                    anchors.bottom: kameralabel.bottom
                    anchors.left: kameralabel.left
                    anchors.top: kameralabel.top
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: Scaling.tscale(18)
                    fontSizeMode: Text.Fit
                }

                Text {
                    id:kameratext
                    color: "#ffffff"
                    text: "KAMERA"
                    anchors.left: kameraicon.right
                    anchors.right: kameralabel.right
                    anchors.bottom: kameralabel.bottom
                    anchors.top: kameralabel.top
                    font.bold: true
                    font.pointSize: Scaling.tscale(18)
                    antialiasing: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.family: "Courier"
                    fontSizeMode: Text.Fit
                }


                //}
            }

            QQC1.TextField{
                id: cameraUrl
                anchors.top: rectCamera.bottom
                anchors.topMargin: Scaling.vscale(15);
                anchors.right: rectCamera.right
                placeholderText: "Masukkan URL kamera!"
                style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 5
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: "#333"
                        border.width: 1
                    }
                }
            }

            Button{
                id: updateUrl
                text: "Update"
                anchors.right: cameraUrl.left
                anchors.top: cameraUrl.top
                anchors.rightMargin: Scaling.hscale(30)
                focus: true

                contentItem: Text {
                    text: updateUrl.text
                    styleColor: "#18013e"
                    // font: "Arial"
                    opacity: enabled ? 1.0 : 0.3
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                //                background: Rectangle {
                //                    implicitWidth: cameraUrl.width
                //                    implicitHeight: cameraUrl.height
                //                    opacity: enabled ? 1 : 0.3
                //                    border.color: "#333"
                //                    border.width: 1
                //                    radius: 3
                //                }
                onClicked: {
                    stream.mediaplayer1Source = cameraUrl.text
                    console.log(stream.mediaplayer1Source)
                }
            }

            Rectangle {
                id: rectDateTime
                color: Qt.rgba(0.15, 0.12, 0.22, 0.8)
                radius: 5
                anchors.top: rectCamera.bottom
                anchors.topMargin: Scaling.vscale(90)
                anchors.left: parent.left
                anchors.leftMargin: Scaling.hscale(150)
                anchors.right: parent.right
                anchors.rightMargin: Scaling.hscale(40)
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Scaling.vscale(40)
                layer.enabled: true
                layer.effect: shadow
                //                layer.effect: DropShadow {
                //                    color: "#000000"
                //                    radius: 20
                //                    transparentBorder: true
                //                    horizontalOffset: -5
                //                    samples: 25
                //                    verticalOffset: 5
                //                }

                Text {
                    id: time
                    color: "#ffffff"
                    //text: new Date().toLocaleTimeString()
                    font.family: "Courier"
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: parent.left
                    anchors.leftMargin: Scaling.hscale(300)
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: Scaling.vscale(100)
                    anchors.top: parent.top
                    anchors.topMargin: Scaling.vscale(70)
                    anchors.right: parent.right
                    anchors.rightMargin: Scaling.hscale(50)
                    font.pointSize: Scaling.tscale(60)
                    fontSizeMode: Text.Fit
                    //text: "13:34"
                    function updateTime(){
                        time.text = Qt.formatDateTime(new Date(),"hh:mm")

                    }
                }
                Text {
                    id: date
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignRight
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: Scaling.hscale(100)
                    anchors.right: parent.right
                    anchors.rightMargin: Scaling.hscale(50)
                    anchors.top: time.bottom
                    anchors.topMargin: 0
                    font.pointSize: Scaling.tscale(20)
                    fontSizeMode: Text.Fit
                    //text: "Senin, 31 Agustus 2019"
                    font.family: "Courier"
                    function updateDate(){
                        date.text = Qt.formatDateTime(new Date(),"dddd, dd MMMM yyyy")
                    }
                }

                Timer {
                    id: textTimer
                    interval: 60000
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    onTriggered: {
                        date.updateDate()
                        time.updateTime()
                    }
                }

            }

        }


    }
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
