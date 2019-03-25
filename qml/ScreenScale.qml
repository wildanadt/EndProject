pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Window 2.11

QtObject {
        id:root
    readonly property real refScreenWidth: 1920
    readonly property real refScreenHeight: 1080

    readonly property real screenWidth: Screen.width
    readonly property real screenHeight: Screen.height

    function hscale(size) {
        //console.log(refScreenWidth)
        //console.log(screenWidth)
        return Math.round(size * (screenWidth / refScreenWidth))
    }

    function vscale(size) {
        return Math.round(size * (screenHeight / refScreenHeight))
    }

    function tscale(size) {
        return Math.round((hscale(size) + vscale(size)) / 2)
    }

    //readonly property real rectLeftMargin: hscale(30)
}
