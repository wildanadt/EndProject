import QtQuick 2.6
import QtQuick.Controls 2.0
import io.qt.examples.backend 1.0
import Serial 1.0

ApplicationWindow {
    id: root
    width: 300
    height: 480
    visible: true

    BackEnd {
        id: backend
    }

    TextField {
        text: backend.userName
        placeholderText: qsTr(Serial.data.toString())
        anchors.centerIn: parent


        onTextChanged: backend.userName = text
    }
}
