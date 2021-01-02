import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: view
    width: 1024; height: 100;
    x: (Screen.desktopAvailableWidth - 1024) / 2
    y: (Screen.desktopAvailableHeight - 768) / 2 + 10
    flags: Qt.WindowStaysOnTopHint | Qt.window | Qt.FramelessWindowHint
    color: "transparent"
    visible: false

    property string myName: ""
    property string myGrade: ""

    Timer {
        interval: 2000;
        running: view.visible;
        onTriggered: {
            view.visible = false
        }
    }

    Rectangle {
        id: showText;
        width: parent.width;
        height: parent.height;
        radius: 30;
        color: "black";
        opacity: 0.7
    }

    Row {
        z: 2
        anchors.centerIn: showText
        spacing: 15

        Text {
            font.pixelSize: 45
            font.family: "微软雅黑"
            font.bold: true
            renderType: Text.NativeRendering
            horizontalAlignment: Text.AlignVCenter
            color: "white"
            text: "恭喜 "
        }

        Text {
            font.pixelSize: 45
            font.family: "微软雅黑"
            font.bold: true
            renderType: Text.NativeRendering
            horizontalAlignment: Text.AlignVCenter
            color: "yellow"
            text: view.myName
        }

        Text {
            font.pixelSize: 45
            font.family: "微软雅黑"
            font.bold: true
            renderType: Text.NativeRendering
            horizontalAlignment: Text.AlignVCenter
            color: "white"
            text: " 荣获 "
        }

        Text {
            font.pixelSize: 45
            font.family: "微软雅黑"
            font.bold: true
            renderType: Text.NativeRendering
            horizontalAlignment: Text.AlignVCenter
            color: "yellow"
            text: view.myGrade
        }
    }
}
