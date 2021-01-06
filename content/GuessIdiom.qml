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
            text: "看图猜成语"
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
            text: "游戏规则：三人一组，一人负责指挥、一人负责喂食、一人负责吃。喂食者和吃东西者需要佩戴眼罩。" +
                  "首先喂食者需在原地转三圈，然后在指挥员的命令下，走到吃东西的人的面前并将食物喂给队友吃，" +
                  "哪队最先吃完，哪队获胜。吃的时候如果食物掉落是要扣分的哦。"
        }
    }
}
