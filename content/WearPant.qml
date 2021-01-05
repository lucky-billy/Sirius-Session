import QtQuick 2.0
import QtQuick.Dialogs 1.3

Dialog {
    width: 1024; height: 768
    visible: false

    contentItem: Rectangle {
        // 标题
        Text {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "微软雅黑"
            font.pixelSize: 48
            font.bold: true
            color: "#FF7F50"
            text: "徒手穿裤子"
        }

        // 游戏规则
        Text {
            z: 1
            width: 800
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "微软雅黑"
            font.pixelSize: 32
            wrapMode: Text.WordWrap
            color: "black"
            text: "游戏规则：用除了手以外的其他身体部分帮助自己把裤子穿上，裤子要包住屁股才算挑战成功哦！" +
                  "在规定时间内优先完成者胜出。"
        }

        // 图片1
        Image {
            width: 500; height: 560
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            source: "qrc:/image/game1-1.jpg"
        }

        // 图片2
        Image {
            width: 500; height: 520
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            source: "qrc:/image/game1-2.jpg"
        }
    }
}
