import QtQuick 2.0
import QtQuick.Controls 2.0

import QtQuick.Layouts 1.0
import QtMultimedia 5.8
import Scale 1.0


Rectangle {
    id: camerastream
    border.width: 0
    //border.color: "black"
    radius: 20
    property alias mediaplayer1Source: mediaplayer1.source
    MediaPlayer {
        id: mediaplayer1

        source: "rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov"
        autoPlay: true
        //source: "rtsp://192.168.4.3:8080/h264"
        onError: {
            msgPage1.visible = true
        }
    }

    VideoOutput {

        anchors.fill: camerastream
//        height: camerastream.height
//        width: camerastream.width
        source: mediaplayer1
        fillMode:VideoOutput.PreserveAspectCrop

    }

    Text {
        id: msgPage1
        anchors.centerIn: parent
        font.pointSize: Scaling.tscale(20)
        fontSizeMode: Text.Fit
        text: mediaplayer1.errorString
        font.bold: true
        visible: false
    }

//    MouseArea {
//        id: playArea
//        anchors.fill: parent
//        height: camerastream.height
//        width: camerastream.width
//        onClicked: {
//            if (msgPage1.visible)
//            {
//                // print("Iniciando streaming - 1")
//                msgPage1.visible = false
//                mediaplayer1.play()
//            }
//            else {
//                //  print("Parando streaming - 1")
//                mediaplayer1.stop()
//                msgPage1.visible = true
//            }
//        }
//    }
}

