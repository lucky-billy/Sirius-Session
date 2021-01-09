import QtQuick 2.0
import QtQuick.Dialogs 1.3
import QtMultimedia 5.12

Dialog {
    width: 1024; height: 768
    title: "抽奖"
    visible: false

    property int totalIndex: 0
    property bool cheat: false

    onVisibleChanged: {
        if ( luckDraw.playbackState == MediaPlayer.PlayingState ) {
            luckDraw.stop()
        }
    }

    contentItem: Rectangle {
        focus: true
        Keys.enabled: true
        Keys.onUpPressed: { if ( currentVolume < 1 ) { currentVolume += 0.05 } }
        Keys.onDownPressed: { if ( currentVolume > 0.1 ) { currentVolume -= 0.05 } }

        // 颁奖台
        Rectangle {
            width: 960; height: 200
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            // 一等奖
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: first_award.verticalCenter
                source: "qrc:/image/award-1.png"
            }

            Row {
                id: first_award
                width: 210; height: 50
                anchors.left: parent.left
                anchors.leftMargin: 435
                anchors.top: parent.top
                anchors.topMargin: 10
                spacing: 5

                property string name1: ""
                property string name2: ""

                Repeater {
                    model: 2

                    Rectangle {
                        width: 100; height: 50;
                        border.width: 1;
                        border.color: "#FFD700"

                        Text {
                            anchors.centerIn: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: "微软雅黑"
                            font.pixelSize: 18
                            text: {
                                switch ( index )
                                {
                                case 0: first_award.name1; break;
                                case 1: first_award.name2; break;
                                }
                            }
                        }
                    }
                }
            }

            // 二等奖
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: second_award.verticalCenter
                source: "qrc:/image/award-2.png"
            }

            Row {
                id: second_award
                width: 630; height: 50
                anchors.left: parent.left
                anchors.leftMargin: 225
                anchors.top: parent.top
                anchors.topMargin: 80
                spacing: 5

                property string name1: ""
                property string name2: ""
                property string name3: ""
                property string name4: ""
                property string name5: ""
                property string name6: ""

                Repeater {
                    model: 6

                    Rectangle {
                        width: 100; height: 50;
                        border.width: 1;
                        border.color: "#B0C4DE"

                        Text {
                            anchors.centerIn: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: "微软雅黑"
                            font.pixelSize: 18
                            text: {
                                switch ( index )
                                {
                                case 0: second_award.name1; break;
                                case 1: second_award.name2; break;
                                case 2: second_award.name3; break;
                                case 3: second_award.name4; break;
                                case 4: second_award.name5; break;
                                case 5: second_award.name6; break;
                                }
                            }
                        }
                    }
                }
            }

            // 三等奖
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: third_award.verticalCenter
                source: "qrc:/image/award-3.png"
            }

            Row {
                id: third_award
                width: 840; height: 50
                anchors.left: parent.left
                anchors.leftMargin: 120
                anchors.top: parent.top
                anchors.topMargin: 150
                spacing: 5

                property string name1: ""
                property string name2: ""
                property string name3: ""
                property string name4: ""
                property string name5: ""
                property string name6: ""
                property string name7: ""
                property string name8: ""

                Repeater {
                    model: 8

                    Rectangle {
                        width: 100; height: 50;
                        border.width: 1;
                        border.color: "#B87333"

                        Text {
                            anchors.centerIn: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: "微软雅黑"
                            font.pixelSize: 18
                            text: {
                                switch ( index )
                                {
                                case 0: third_award.name1; break;
                                case 1: third_award.name2; break;
                                case 2: third_award.name3; break;
                                case 3: third_award.name4; break;
                                case 4: third_award.name5; break;
                                case 5: third_award.name6; break;
                                case 6: third_award.name7; break;
                                case 7: third_award.name8; break;
                                }
                            }
                        }
                    }
                }
            }
        }

        // 人员列表
        GridView {
            id: view
            anchors.left: parent.left
            anchors.leftMargin: 42
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            width: 960; height: 480
            cellWidth: 120; cellHeight: 60
            focus: true
            enabled: false

            model: ListModel {
                ListElement { myState: false; myAnimation: false; myName: "沈心晨"; }
                ListElement { myState: false; myAnimation: false; myName: "李飞兵"; }
                ListElement { myState: false; myAnimation: false; myName: "聂大英"; }
                ListElement { myState: false; myAnimation: false; myName: "王起旋"; }
                ListElement { myState: false; myAnimation: false; myName: "徐塔妹"; }
                ListElement { myState: false; myAnimation: false; myName: "胡向玲"; }
                ListElement { myState: false; myAnimation: false; myName: "柳晓叶"; }
                ListElement { myState: false; myAnimation: false; myName: "王云"; }
                ListElement { myState: false; myAnimation: false; myName: "张国梁"; }
                ListElement { myState: false; myAnimation: false; myName: "吴昕"; }
                ListElement { myState: false; myAnimation: false; myName: "陈美红"; }
                ListElement { myState: false; myAnimation: false; myName: "檀芳霞"; }
                ListElement { myState: false; myAnimation: false; myName: "汤明智"; }
                ListElement { myState: false; myAnimation: false; myName: "肖源"; }
                ListElement { myState: false; myAnimation: false; myName: "李斌"; }
                ListElement { myState: false; myAnimation: false; myName: "刘丽国"; }
                ListElement { myState: false; myAnimation: false; myName: "蒋斌"; }
                ListElement { myState: false; myAnimation: false; myName: "刘万财"; }
                ListElement { myState: false; myAnimation: false; myName: "夏丽丽"; }
                ListElement { myState: false; myAnimation: false; myName: "丁莽"; }
                ListElement { myState: false; myAnimation: false; myName: "张海"; }
                ListElement { myState: false; myAnimation: false; myName: "陈浪"; }
                ListElement { myState: false; myAnimation: false; myName: "缪婷婷"; }
                ListElement { myState: false; myAnimation: false; myName: "李元"; }
                ListElement { myState: false; myAnimation: false; myName: "徐莲红"; }
                ListElement { myState: false; myAnimation: false; myName: "陈清珍"; }
                ListElement { myState: false; myAnimation: false; myName: "闫云芳"; }
                ListElement { myState: false; myAnimation: false; myName: "刁鸳鸳"; }
                ListElement { myState: false; myAnimation: false; myName: "田显丽"; }
                ListElement { myState: false; myAnimation: false; myName: "蒋杜明"; }
                ListElement { myState: false; myAnimation: false; myName: "杨丽萍"; }
                ListElement { myState: false; myAnimation: false; myName: "周石林"; }
                ListElement { myState: false; myAnimation: false; myName: "燕红"; }
                ListElement { myState: false; myAnimation: false; myName: "刘克臣"; }
                ListElement { myState: false; myAnimation: false; myName: "高雪飞"; }
                ListElement { myState: false; myAnimation: false; myName: "刘倩"; }
                ListElement { myState: false; myAnimation: false; myName: "刘红灵"; }
                ListElement { myState: false; myAnimation: false; myName: "王锐"; }
                ListElement { myState: false; myAnimation: false; myName: "邓德梅"; }
                ListElement { myState: false; myAnimation: false; myName: "王万"; }
                ListElement { myState: false; myAnimation: false; myName: "闵文定"; }
                ListElement { myState: false; myAnimation: false; myName: "邱广标"; }
                ListElement { myState: false; myAnimation: false; myName: "李秋兰"; }
                ListElement { myState: false; myAnimation: false; myName: "李治军"; }
                ListElement { myState: false; myAnimation: false; myName: "刚添瑞"; }
                ListElement { myState: false; myAnimation: false; myName: "朱涛"; }
                ListElement { myState: false; myAnimation: false; myName: "张浩"; }
                ListElement { myState: false; myAnimation: false; myName: "李琪利"; }
                ListElement { myState: false; myAnimation: false; myName: "徐珊珊"; }
                ListElement { myState: false; myAnimation: false; myName: "杨敏"; }
                ListElement { myState: false; myAnimation: false; myName: "曹佳佳"; }
                ListElement { myState: false; myAnimation: false; myName: "张英"; }
                ListElement { myState: false; myAnimation: false; myName: "郑甜甜"; }
                ListElement { myState: false; myAnimation: false; myName: "夏慧婷"; }
                ListElement { myState: false; myAnimation: false; myName: "王雪"; }
                ListElement { myState: false; myAnimation: false; myName: "翟天保"; }
                ListElement { myState: false; myAnimation: false; myName: "曾小梅"; }
                ListElement { myState: false; myAnimation: false; myName: "刘勤"; }
                ListElement { myState: false; myAnimation: false; myName: "郭可"; }
                ListElement { myState: false; myAnimation: false; myName: "罗金川"; }
                ListElement { myState: false; myAnimation: false; myName: "林丽珍"; }
            }

            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }

            delegate: Component {
                Rectangle {
                    id: wrapper
                    width: 110; height: 40
                    border.width: 4
                    border.color: myState ? "red" : "white"
                    radius: 5
                    z: myAnimation ? 10 : 1

                    SequentialAnimation {
                        running: myAnimation

                        PropertyAnimation {
                            target: wrapper_text;
                            property: "scale";
                            easing.type: Easing.InOutQuad
                            from: 1
                            to: 5;
                            duration: 1000
                        }
                        PropertyAnimation {
                            target: wrapper_text;
                            property: "scale";
                            easing.type: Easing.InExpo
                            from: 5
                            to: 1;
                            duration: 500
                        }
                    }

                    Image {
                        width: 32; height: 32
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: {
                            var num = (index + 1) % 6;
                            switch (num)
                            {
                            case 1: "qrc:/image/1.png"; break;
                            case 2: "qrc:/image/2.png"; break;
                            case 3: "qrc:/image/3.png"; break;
                            case 4: "qrc:/image/4.png"; break;
                            case 5: "qrc:/image/5.png"; break;
                            case 6: "qrc:/image/6.png"; break;
                            default: "qrc:/image/6.png"; break;
                            }
                        }
                    }

                    Text {
                        id: wrapper_text
                        width: 50; height: 36
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "微软雅黑"
                        font.pixelSize: 18
                        text: myName
                    }
                }
            }
        }

        // 抽奖按钮
        Rectangle {
            id: button
            width: 80; height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 2
            border.color: "black"
            radius: 10

            property bool condition: true

            Text {
                id: luckDrawText
                anchors.centerIn: parent
                font.pixelSize: 24
                text: button.condition ? "抽 奖" : "停 止"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if ( button.condition ) {
                        timer.start()
                        button.condition = !button.condition
                    } else {
                        timer.stop()
                        button.enabled = false

                        // 最后10人不能参与抽奖
                        if ( timer.index > view.model.count - 11 ) {
                            view.model.setProperty(timer.index, "myState", false)
                            timer.index = timer.getRandomNum(0, view.model.count - 10)
                            view.model.setProperty(timer.index, "myState", true)
                        }

                        // 作弊
                        if ( cheat ) {
                            if ( totalIndex === 7 ) {
                                view.model.setProperty(timer.index, "myState", false)
                                for ( var i = 0; i < view.model.count; ++i )
                                {
                                    if ( view.model.get(i).myName === "闵文定" ) {
                                        timer.index = i
                                        break
                                    }
                                }
                                view.model.setProperty(timer.index, "myState", true)
                            }
                            if ( totalIndex === 8 ) {
                                view.model.setProperty(timer.index, "myState", false)
                                for ( i = 0; i < view.model.count; ++i )
                                {
                                    if ( view.model.get(i).myName === "缪婷婷" ) {
                                        timer.index = i
                                        break
                                    }
                                }
                                view.model.setProperty(timer.index, "myState", true)
                            }
                            if ( totalIndex === 13 ) {
                                view.model.setProperty(timer.index, "myState", false)
                                for ( i = 0; i < view.model.count; ++i )
                                {
                                    if ( view.model.get(i).myName === "沈心晨" ) {
                                        timer.index = i
                                        break
                                    }
                                }
                                view.model.setProperty(timer.index, "myState", true)
                            }
                            if ( totalIndex === 14 ) {
                                view.model.setProperty(timer.index, "myState", false)
                                for ( i = 0; i < view.model.count; ++i )
                                {
                                    if ( view.model.get(i).myName === "曹佳佳" ) {
                                        timer.index = i
                                        break
                                    }
                                }
                                view.model.setProperty(timer.index, "myState", true)
                            }
                        }

                        // 开启文字特效
                        view.model.setProperty(timer.index, "myAnimation", true)

                        // 动画播放完成之后更新
                        update.start()
                    }
                }
            }
        }

        // 定时器生成随机数，刷新中奖人员
        Timer {
            id: timer
            interval: 20
            repeat: true
            triggeredOnStart: true

            property int index: 0

            onTriggered: {
                view.model.setProperty(index, "myState", false)
                index = getRandomNum(0, view.model.count - 1)
                view.model.setProperty(index, "myState", true)
            }

            function getRandomNum(Min, Max)
            {
                var Range = Max - Min;
                var Rand = Math.random();
                return(Min + Math.round(Rand * Range));
            }
        }

        // 抽奖完成，显示 + 更新
        Timer {
            id: update
            interval: 1800
            repeat: false
            onTriggered: {
                // 更新领奖台名字
                totalIndex++;
                switch ( totalIndex )
                {
                case 1: third_award.name1 = view.model.get(timer.index).myName; break;
                case 2: third_award.name2 = view.model.get(timer.index).myName; break;
                case 3: third_award.name3 = view.model.get(timer.index).myName; break;
                case 4: third_award.name4 = view.model.get(timer.index).myName; break;
                case 5: third_award.name5 = view.model.get(timer.index).myName; break;
                case 6: third_award.name6 = view.model.get(timer.index).myName; break;
                case 7: third_award.name7 = view.model.get(timer.index).myName; break;
                case 8: third_award.name8 = view.model.get(timer.index).myName; break;
                case 9: second_award.name1 = view.model.get(timer.index).myName; break;
                case 10: second_award.name2 = view.model.get(timer.index).myName; break;
                case 11: second_award.name3 = view.model.get(timer.index).myName; break;
                case 12: second_award.name4 = view.model.get(timer.index).myName; break;
                case 13: second_award.name5 = view.model.get(timer.index).myName; break;
                case 14: second_award.name6 = view.model.get(timer.index).myName; break;
                case 15: first_award.name1 = view.model.get(timer.index).myName; break;
                case 16: first_award.name2 = view.model.get(timer.index).myName; break;
                default: break;
                }

                // 动画
                flashDisplay.flashSource = ""
                if ( totalIndex < 9 ) {
                    flashDisplay.flashSource = "qrc:/flash/1.gif"
                } else if ( totalIndex < 15 ) {
                    flashDisplay.flashSource = "qrc:/flash/2.gif"
                } else {
                    flashDisplay.flashSource = "qrc:/flash/3.gif"
                }
                flashDisplay.visible = true

                // 文本
                textDisplay.myName = view.model.get(timer.index).myName
                if ( totalIndex < 9 ) {
                    textDisplay.myGrade = "三等奖"
                } else if ( totalIndex < 15 ) {
                    textDisplay.myGrade = "二等奖"
                } else if ( totalIndex === 15 ) {
                    textDisplay.myGrade = "一等奖"
                } else if ( totalIndex === 16 ) {
                    textDisplay.myGrade = "特等奖"
                } else {
                    textDisplay.myGrade = "无名奖"
                }
                textDisplay.visible = true

                // 从列表中移除
                view.model.setProperty(timer.index, "myState", false)
                view.model.remove(timer.index, 1)
                timer.index = 0

                // 继续抽奖
                button.condition = !button.condition
                button.enabled = true
            }
        }

        // 抽奖动画
        FlashDisplay { id: flashDisplay }

        // 抽奖文本
        TextDisplay { id: textDisplay }

        // 播放背景音乐
        Image {
            width: 32; height: 32
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            source: luckDraw.playbackState == MediaPlayer.PlayingState ? "qrc:/image/mute.png"
                                                                       : "qrc:/image/horn.png"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if ( luckDraw.playbackState == MediaPlayer.PlayingState ) {
                        luckDraw.stop()
                    } else {
                        luckDraw.play()
                    }
                }
            }
        }
    }
}
