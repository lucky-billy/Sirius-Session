import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtMultimedia 5.12
import QtGraphicalEffects 1.12
import "./content"

Window {
    id: root
    width: 1600; height: 900
    title: qsTr("乾曜2021年年度主题晚会")
    visible: true

    property var currentVolume: 1

    // 背景
    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/image/background.jpg"

        focus: true
        Keys.enabled: true
        Keys.onEscapePressed: { video.stop() }
        Keys.onEnterPressed: { lotteryDraw.cheat = true }
        Keys.onReturnPressed: { lotteryDraw.cheat = false }
        Keys.onUpPressed: { if ( currentVolume < 1 ) { currentVolume += 0.05 } }
        Keys.onDownPressed: { if ( currentVolume > 0.1 ) { currentVolume -= 0.05 } }

        // 公司名称
        Image {
            id: companyName
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/image/companyName.png"
            visible: false
        }

        // 阴影特效
        DropShadow {
            anchors.fill: companyName
            horizontalOffset: 0
            verticalOffset: 20
            radius: 8.0
            samples: 17
            spread: 0
            color: "#aa000000"
            source: companyName
        }

        // 界面按钮
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            enabled: video.playbackState != MediaPlayer.PlayingState

            // 播放视频
            Image {
                source: "qrc:/image/video.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: video.play()
                }
            }

            // 徒手穿裤子
            Image {
                source: "qrc:/image/activity.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: wearPant.visible = true
                }
            }

            // 蒙眼喂食
            Image {
                source: "qrc:/image/banana.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: blindfoldFeeding.visible = true
                }
            }

            // 看图猜成语
            Image {
                source: "qrc:/image/picture.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: guessIdiom.visible = true
                }
            }

            // 抽奖
            Image {
                source: "qrc:/image/award.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: lotteryDraw.visible = true
                }
            }
        }

        // 背景音乐按钮
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            enabled: video.playbackState != MediaPlayer.PlayingState

            // 总经理发言
            Image {
                source: "qrc:/image/manager.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if ( manager.playbackState == MediaPlayer.PlayingState ) {
                            manager.stop()
                        } else {
                            manager.play()
                        }
                    }
                }
            }

            // 中场休息
            Image {
                source: "qrc:/image/rest.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if ( rest.playbackState == MediaPlayer.PlayingState ) {
                            rest.stop()
                        } else {
                            rest.play()
                        }
                    }
                }
            }

            // 优秀员工颁奖
            Image {
                source: "qrc:/image/award-music.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if ( award.playbackState == MediaPlayer.PlayingState ) {
                            award.stop()
                        } else {
                            award.play()
                        }
                    }
                }
            }

            // 晚会结束
            Image {
                source: "qrc:/image/end.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if ( end.playbackState == MediaPlayer.PlayingState ) {
                            end.stop()
                        } else {
                            end.play()
                        }
                    }
                }
            }
        }

        //------------------------------------------------------------

        // 需要安装 LAVFilter
        MediaPlayer { id: video; source: "D:/QT/video.mp4" }

        // 界面 - 播放视频
        VideoOutput {
            z: 10
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop
            source: video
            visible: video.playbackState == MediaPlayer.PlayingState
        }

        // 界面 - 徒手穿裤子游戏
        WearPant { id: wearPant }

        // 界面 - 蒙眼喂食游戏
        BlindfoldFeeding { id: blindfoldFeeding }

        // 界面 - 看图猜成语游戏
        GuessIdiom { id: guessIdiom }

        // 界面 - 抽奖
        LotteryDraw { id: lotteryDraw }

        //------------------------------------------------------------

        // 背景音乐 - 总经理发言
        MediaPlayer { id: manager; source: "D:/QT/manager.mp3"; loops: 100; volume: currentVolume }

        // 背景音乐 - 中场休息
        MediaPlayer { id: rest; source: "D:/QT/rest.mp3"; loops: 100; volume: currentVolume }

        // 背景音乐 - 优秀员工颁奖
        MediaPlayer { id: award; source: "D:/QT/award.mp3"; loops: 100; volume: currentVolume }

        // 背景音乐 - 晚会结束
        MediaPlayer { id: end; source: "D:/QT/end.mp3"; loops: 100; volume: currentVolume }

        // 背景音乐 - 游戏
        MediaPlayer { id: game; source: "D:/QT/game.mp3"; loops: 100; volume: currentVolume }

        // 背景音乐 - 抽奖
        MediaPlayer { id: luckDraw; source: "D:/QT/luckDraw.mp3"; loops: 100; volume: currentVolume }

    }
}
