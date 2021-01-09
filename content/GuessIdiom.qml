import QtQuick 2.0
import QtQuick.Dialogs 1.3
import QtMultimedia 5.12

Dialog {
    id: dialog
    width: 1024; height: 768
    title: "看图猜成语"
    visible: false

    property int currentIndex: 0

    onVisibleChanged: {
        if ( game.playbackState == MediaPlayer.PlayingState ) {
            game.stop()
        }

        introduce.visible = true
        playGame.visible = false
    }

    contentItem: Rectangle {
        focus: true
        Keys.enabled: true
        Keys.onUpPressed: { if ( currentVolume < 1 ) { currentVolume += 0.05 } }
        Keys.onDownPressed: { if ( currentVolume > 0.1 ) { currentVolume -= 0.05 } }
        Keys.onLeftPressed: {
            if ( currentIndex > 0 ) { currentIndex-- }
            pathModel.setProperty(currentIndex, "myState", false)
        }
        Keys.onRightPressed: {
            if ( !pathModel.get(currentIndex).myState ) {
                pathModel.setProperty(currentIndex, "myState", true)
            } else {
                if ( currentIndex < pathModel.count - 1 ) { currentIndex++ }
            }
        }

        // 游戏介绍
        Rectangle {
            id: introduce
            anchors.fill: parent
            visible: true

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
                anchors.topMargin: 120
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "微软雅黑"
                font.pixelSize: 32
                wrapMode: Text.WordWrap
                color: "black"
                text: "游戏规则：每一桌为一组，看图片猜成语，每组有3次跳过的机会，" +
                      "每一张图片猜错3次即为错误自动进入下一题，在指定时间内猜对最多的组获胜。"
            }

            // 示例图片1
            Image {
                id: example1
                width: 250; height: 250
                anchors.left: parent.left
                anchors.leftMargin: 150
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 260
                source: "qrc:/image/guessIdiom/example-1.png"
            }

            Text {
                anchors.top: example1.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: example1.horizontalCenter
                font.family: "微软雅黑"
                font.pixelSize: 42
                font.bold: true
                color: "#CC9966"
                text: "妙笔生花"
            }

            // 示例图片2
            Image {
                id: example2
                width: 360; height: 250
                anchors.right: parent.right
                anchors.rightMargin: 150
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 260
                source: "qrc:/image/guessIdiom/example-2.png"
            }

            Text {
                anchors.top: example2.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: example2.horizontalCenter
                font.family: "微软雅黑"
                font.pixelSize: 42
                font.bold: true
                color: "#CC9966"
                text: "针锋相对"
            }

            // 开始游戏
            Rectangle {
                id: button
                width: 120; height: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 60
                anchors.horizontalCenter: parent.horizontalCenter
                border.width: 2
                border.color: "black"
                radius: 10

                Text {
                    id: luckDrawText
                    anchors.centerIn: parent
                    font.pixelSize: 24
                    text: "开始游戏"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        introduce.visible = false
                        playGame.visible = true
                    }
                }
            }
        }

        // 游戏开始
        Rectangle {
            id: playGame
            anchors.fill: parent
            visible: false

            ListModel {
                id: pathModel
                ListElement { myState: false; imageName: "貌合神离"; imageSource: "qrc:/image/guessIdiom/1.png";  }
                ListElement { myState: false; imageName: "爱屋及乌"; imageSource: "qrc:/image/guessIdiom/2.png";  }
                ListElement { myState: false; imageName: "生死存亡"; imageSource: "qrc:/image/guessIdiom/3.png";  }
                ListElement { myState: false; imageName: "朝三暮四"; imageSource: "qrc:/image/guessIdiom/4.png";  }
                ListElement { myState: false; imageName: "鱼贯而入"; imageSource: "qrc:/image/guessIdiom/5.png";  }
                ListElement { myState: false; imageName: "每况日下"; imageSource: "qrc:/image/guessIdiom/6.png";  }
                ListElement { myState: false; imageName: "无独有偶"; imageSource: "qrc:/image/guessIdiom/7.png";  }
                ListElement { myState: false; imageName: "日行千里"; imageSource: "qrc:/image/guessIdiom/8.png";  }
                ListElement { myState: false; imageName: "三人为虎"; imageSource: "qrc:/image/guessIdiom/9.png";  }
                ListElement { myState: false; imageName: "名震一时"; imageSource: "qrc:/image/guessIdiom/10.png"; }
                ListElement { myState: false; imageName: "屈指可数"; imageSource: "qrc:/image/guessIdiom/11.png"; }
                ListElement { myState: false; imageName: "化整为零"; imageSource: "qrc:/image/guessIdiom/12.png"; }
                ListElement { myState: false; imageName: "鞍前马后"; imageSource: "qrc:/image/guessIdiom/13.png"; }
                ListElement { myState: false; imageName: "接二连三"; imageSource: "qrc:/image/guessIdiom/14.png"; }
                ListElement { myState: false; imageName: "可圈可点"; imageSource: "qrc:/image/guessIdiom/15.png"; }
                ListElement { myState: false; imageName: "点到为止"; imageSource: "qrc:/image/guessIdiom/16.png"; }
                ListElement { myState: false; imageName: "独出心裁"; imageSource: "qrc:/image/guessIdiom/17.png"; }
                ListElement { myState: false; imageName: "老牛舔犊"; imageSource: "qrc:/image/guessIdiom/18.png"; }
                ListElement { myState: false; imageName: "无中生有"; imageSource: "qrc:/image/guessIdiom/19.png"; }
                ListElement { myState: false; imageName: "安身立命"; imageSource: "qrc:/image/guessIdiom/20.png"; }
                ListElement { myState: false; imageName: "昂首阔步"; imageSource: "qrc:/image/guessIdiom/21.png"; }
                ListElement { myState: false; imageName: "闭门思过"; imageSource: "qrc:/image/guessIdiom/22.png"; }
                ListElement { myState: false; imageName: "四通八达"; imageSource: "qrc:/image/guessIdiom/23.png"; }
                ListElement { myState: false; imageName: "表里如一"; imageSource: "qrc:/image/guessIdiom/24.png"; }
                ListElement { myState: false; imageName: "天外有天"; imageSource: "qrc:/image/guessIdiom/25.png"; }
                ListElement { myState: false; imageName: "弹尽粮绝"; imageSource: "qrc:/image/guessIdiom/26.png"; }
                ListElement { myState: false; imageName: "七零八落"; imageSource: "qrc:/image/guessIdiom/27.png"; }
                ListElement { myState: false; imageName: "风花雪月"; imageSource: "qrc:/image/guessIdiom/28.png"; }
                ListElement { myState: false; imageName: "浪子回头"; imageSource: "qrc:/image/guessIdiom/29.png"; }
                ListElement { myState: false; imageName: "人去楼空"; imageSource: "qrc:/image/guessIdiom/30.png"; }
                ListElement { myState: false; imageName: "百年树人"; imageSource: "qrc:/image/guessIdiom/31.png"; }
                ListElement { myState: false; imageName: "鬼话连篇"; imageSource: "qrc:/image/guessIdiom/32.png"; }
                ListElement { myState: false; imageName: "扬眉吐气"; imageSource: "qrc:/image/guessIdiom/33.png"; }
                ListElement { myState: false; imageName: "白纸黑字"; imageSource: "qrc:/image/guessIdiom/34.png"; }
                ListElement { myState: false; imageName: "恩重如山"; imageSource: "qrc:/image/guessIdiom/35.png"; }
                ListElement { myState: false; imageName: "狗尾续貂"; imageSource: "qrc:/image/guessIdiom/36.png"; }
                ListElement { myState: false; imageName: "巧言如簧"; imageSource: "qrc:/image/guessIdiom/37.png"; }
                ListElement { myState: false; imageName: "地广人稀"; imageSource: "qrc:/image/guessIdiom/38.png"; }
                ListElement { myState: false; imageName: "天各一方"; imageSource: "qrc:/image/guessIdiom/39.png"; }
                ListElement { myState: false; imageName: "三从四德"; imageSource: "qrc:/image/guessIdiom/40.png"; }
                ListElement { myState: false; imageName: "畏首畏尾"; imageSource: "qrc:/image/guessIdiom/41.png"; }
                ListElement { myState: false; imageName: "抱头鼠窜"; imageSource: "qrc:/image/guessIdiom/42.png"; }
                ListElement { myState: false; imageName: "一塌糊涂"; imageSource: "qrc:/image/guessIdiom/43.png"; }
                ListElement { myState: false; imageName: "思如泉涌"; imageSource: "qrc:/image/guessIdiom/44.png"; }
                ListElement { myState: false; imageName: "力争上游"; imageSource: "qrc:/image/guessIdiom/45.png"; }
                ListElement { myState: false; imageName: "狼狈为奸"; imageSource: "qrc:/image/guessIdiom/46.png"; }
                ListElement { myState: false; imageName: "才子佳人"; imageSource: "qrc:/image/guessIdiom/47.png"; }
                ListElement { myState: false; imageName: "皮开肉绽"; imageSource: "qrc:/image/guessIdiom/48.png"; }
                ListElement { myState: false; imageName: "嵩山峻岭"; imageSource: "qrc:/image/guessIdiom/49.png"; }
                ListElement { myState: false; imageName: "蠢蠢欲动"; imageSource: "qrc:/image/guessIdiom/50.png"; }
                ListElement { myState: false; imageName: "本末倒置"; imageSource: "qrc:/image/guessIdiom/51.png"; }
                ListElement { myState: false; imageName: "妻离子散"; imageSource: "qrc:/image/guessIdiom/52.png"; }
                ListElement { myState: false; imageName: "觥筹交错"; imageSource: "qrc:/image/guessIdiom/53.png"; }
                ListElement { myState: false; imageName: "风卷残云"; imageSource: "qrc:/image/guessIdiom/54.png"; }
                ListElement { myState: false; imageName: "大惊失色"; imageSource: "qrc:/image/guessIdiom/55.png"; }
                ListElement { myState: false; imageName: "上下其手"; imageSource: "qrc:/image/guessIdiom/56.png"; }
                ListElement { myState: false; imageName: "外圆内方"; imageSource: "qrc:/image/guessIdiom/57.png"; }
                ListElement { myState: false; imageName: "全心投入"; imageSource: "qrc:/image/guessIdiom/58.png"; }
                ListElement { myState: false; imageName: "安然无恙"; imageSource: "qrc:/image/guessIdiom/59.png"; }
                ListElement { myState: false; imageName: "强词夺理"; imageSource: "qrc:/image/guessIdiom/60.png"; }
            }

            Image {
                id: image
                width: 350; height: 350
                anchors.top: parent.top
                anchors.topMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                source: pathModel.get(currentIndex).imageSource
            }

            Text {
                anchors.top: image.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: image.horizontalCenter
                font.family: "微软雅黑"
                font.pixelSize: 60
                font.bold: true
                color: "#CC6600"
                text: pathModel.get(currentIndex).imageName
                visible: pathModel.get(currentIndex).myState
            }
        }

        // 播放背景音乐
        Image {
            width: 32; height: 32
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            source: game.playbackState == MediaPlayer.PlayingState ? "qrc:/image/mute.png"
                                                                   : "qrc:/image/horn.png"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if ( game.playbackState == MediaPlayer.PlayingState ) {
                        game.stop()
                    } else {
                        game.play()
                    }
                }
            }
        }
    }
}
