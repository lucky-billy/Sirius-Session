import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: view
    width: 1024; height: 768
    flags: Qt.WindowStaysOnTopHint | Qt.window | Qt.FramelessWindowHint
    color: "transparent"
    visible: false

    property string flashSource: ""

    Timer {
        interval: 0;
        running: view.visible;
        onTriggered: {
            animated.currentFrame = 0;
            stop.restart()
        }
    }

    Timer {
        id: stop;
        interval: 2000;
        onTriggered: {
            view.visible = false
        }
    }

    AnimatedImage {
        id: animated;
        anchors.centerIn: parent;
        playing: view.visible;
        source: view.flashSource
    }

    onFlashSourceChanged: {
        animated.currentFrame = 0;
        stop.restart()
    }
}
