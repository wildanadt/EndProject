import QtQuick 2.10
import Qt3D.Core 2.9
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0
import Qt3D.Animation 2.9
import QtQuick.Scene2D 2.9
import QtQuick.Scene3D 2.0

import io.qt.transform.trans 1.0 as QQ


Entity {
    id: root

    property real x: 0.0
    property real y: 0.0
    property real z: 0.0
    property real scale: 1.0
    property real theta: 0.0
    property real phi: 0.0
    property Material material

    //components: [ transform, mesh, root.material ]
    components: [transform, mesh, root.material]

    QQ.Trans {
        id: transform
        translation: Qt.vector3d(root.x, root.y, root.z)
        rotation: fromEulerAngles(theta, phi, 0)
        scale: root.scale

    }

    Mesh {
        id: mesh
        source: "qrc:/obj/obj/base.obj"
    }

    Flipper{
        id: flipper
        material: wireframeMaterial
    }

    Turntable {
        id: turntable
        material: wireframeMaterial
    }

    Roda {
        id: roda
        material: wireframeMaterial
    }


}
