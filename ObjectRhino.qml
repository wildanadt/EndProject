import QtQuick 2.12
import QtQuick.Scene3D 2.0

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import UdpClient 1.0

Entity {
    id: fullbase
    property alias fullbase: fullbase

    PhongMaterial {
        id: material
    }

    Mesh {
        id: meshbase
        source: "qrc:/obj/obj/base.obj"
    }

    Transform {
        id: transfullbase
        translation: Qt.vector3d(0, 0, 0)
        rotation: fromEulerAngles(0, 0, 0)
        //scale: root.scale

    }

    components: [transfullbase, meshbase, material]
    //flipper
    Entity {
        id: flipper
        enabled: true
        Mesh {
            id: meshflipper
            source: "qrc:/obj/obj/flipper.obj"
        }

        Transform {
            id: transflipper
            translation: Qt.vector3d(1.0, -1.56, 0.0)
            rotation: fromEulerAngles(0, 0, 180 + UdpClient.dataFlipper)
            //scale: root.scale

        }

        components: [meshflipper, transflipper, material]

    }
    //wheel
    Entity {
        id: wheel
        Mesh {
            id: meshwheel
            source: "qrc:/obj/obj/roda.obj"
        }

        Transform {
            id: transwheel
            translation: Qt.vector3d(-4.08458, -1.58, 0.0)
            rotation: fromEulerAngles(0, 0, 0)
            //scale: root.scale

        }

        components: [meshwheel, transwheel, material]

    }
    //turntable
    Entity {
        id: turntable
        Mesh {
            id: meshturntable
            source: "qrc:/obj/obj/turntable.obj"
        }

        Transform {
            id: transturntable
            translation: Qt.vector3d(0.0, 0.0, 0.0)
            rotation: fromEulerAngles(0, UdpClient.dataTurntable, 0)
            //scale: root.scale

        }

        components: [meshturntable, transturntable, material]
        //sholder
        Entity {
            id: sholder
            Mesh {
                id: meshsholder
                source: "qrc:/obj/obj/sholder.obj"
            }

            Transform {
                id: transsholder
                translation: Qt.vector3d(0.0, 0.55, 0.55)
                rotation: fromEulerAngles(0, 0, -UdpClient.dataSholder)
                //scale: root.scale

            }

            components: [meshsholder, transsholder, material]
            //elbow
            Entity {
                id: elbow
                Mesh {
                    id: meshelbow
                    source: "qrc:/obj/obj/elbow.obj"
                }

                Transform {
                    id: transelbow
                    translation: Qt.vector3d(-6.0, 0.0, 0.75)
                    rotation: fromEulerAngles(0, 0, 13 + UdpClient.dataElbow)
                    //scale: root.scale

                }

                components: [meshelbow, transelbow, material]
                //wrist
                Entity {
                    id: wrist
                    Mesh {
                        id: meshwrist
                        source: "qrc:/obj/obj/wrist.obj"
                    }

                    Transform {
                        id: transwrist
                        translation: Qt.vector3d(6.5, 0.0, -0.85)
                        rotation: fromEulerAngles(0, 0, -13 + UdpClient.dataWrist)
                        //scale: root.scale

                    }

                    components: [meshwrist, transwrist, material]

                }

            }

        }

    }


}

