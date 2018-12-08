import QtQuick 2.9
import QtQuick.Scene3D 2.0

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import UdpClient 1.0

import io.qt.transform 1.0 as QQ
import QtQuick 2.0 as QQ2


Item {
    property bool bat1: false
    property bool bat2: false
    property bool bat3: false
    property bool bat4: false
    function battery1(){
            if(UdpClient.dataBattery <= 25)
                bat1 = true
            else
                bat1 = false
            return bat1
    }
    function battery2(){
            if(UdpClient.dataBattery > 25&& UdpClient.dataBattery <=50)
                bat2 = true
            else
                bat2 = false
            return bat2
    }
    function battery3(){
            if(UdpClient.dataBattery > 50&& UdpClient.dataBattery <=75)
                bat3 = true
            else
                bat3 = false
            return bat3
    }
    function battery4(){
            if(UdpClient.dataBattery > 75)
                bat4 = true
            else
                bat4 = false
            return bat4
    }

    Rectangle {
        id: root
        anchors.fill: parent
        border.width: 2
        border.color: "orange"
        Rectangle {
            id: compasslay
            width: root.width * 1/4
            height: root.height/2
            anchors.left: scene.right
            //anchors.fill:root
            border.width: 3
            border.color: "black"
            //anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: compassbackground
                width: compasslay.width/2
                height: compasslay.height/2
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: compasslay
                scale: 1.9
                source: "qrc:/image/img/kompas_background.png"
            }
            Image {
                id: compaspointer
                width: compasslay.width/2
                height: compasslay.height/2
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: compassbackground
                scale: 0.9
                // transform: Translate{ y:compasbackground.y ; x:compasbackground.x}
                transform: Rotation{ origin.x:compassbackground.x; origin.y:compassbackground.y;
                    axis { x: 0; y: 0; z: 1 } angle: UdpClient.dataCompass}
                source: "qrc:/image/img/kompas_pointer.png"
            }


        }
        Rectangle {
            id: battlay
            width: root.width * 1/4
            anchors.fill: ba
            height: root.height/2
            anchors.left: scene.right
            anchors.top: compasslay.bottom
            //anchors.fill:root
            border.width: 3
            border.color: "black"
            //anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: batt1
                scale: 0.5
                visible: battery1()
                source: "qrc:/image/battery/batt1.png"
            }
            Image {
                id: batt2
                scale: 0.5
                visible: battery2()
                source: "qrc:/image/battery/batt2.png"
            }
            Image {
                id: batt3
                scale: 0.5
                visible: battery3()
                source: "qrc:/image/battery/batt3.png"
            }
            Image {
                id: batt4
                scale: 0.5
                visible: battery4()
                source: "qrc:/image/battery/batt4.png"
            }


        }

        Rectangle {
            id: scene
            //anchors.fill: root
            width: root.width * 3/4
            height: root.height
            anchors.margins: 50
            border.width: 3
            border.color: "darkblue"

            Scene3D {
                id: scene3d
                anchors.fill: parent
                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

                Entity {

                    Camera {
                        id: camera
                        projectionType: CameraLens.PerspectiveProjection
                        fieldOfView: 22.5
                        nearPlane : 0.1
                        farPlane : 1000.0
                        position: Qt.vector3d( 20.0, 10.0, -20.0 )
                        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
                        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
                    }

                    FirstPersonCameraController { camera: camera }

                    components: [
                        RenderSettings {
                            activeFrameGraph: ForwardRenderer {
                                camera: camera
                                clearColor: "transparent"
                            }
                        },
                        InputSettings { }
                    ]

                    ObjectRhino { }

                }


            }
        }
    }
}
