import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtMultimedia 5.12
import "./content"

Window {
    id: root
    width: 1600; height: 900
    title: qsTr("乾曜2021年年度主题晚会")
    visible: true

    // 背景
    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/image/background.jpg"

        focus: true
        Keys.enabled: true
        Keys.onEscapePressed: { video.stop() }
        Keys.onEnterPressed: { console.log("111") }
        Keys.onReturnPressed: { console.log("222") }

        // 公司名称
        Image {
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/image/companyName.png"
        }

        // 按钮
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
                    onClicked: {
                        video.play()
                    }
                }
            }

            // 穿裤子
            Image {
                source: "qrc:/image/activity.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        wearPant.visible = true
                    }
                }
            }

            // 蒙眼喂食
            Image {
                source: "qrc:/image/banana.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        blindfoldFeeding.visible = true
                    }
                }
            }

            // 看图猜成语
            Image {
                source: "qrc:/image/picture.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        guessIdiom.visible = true
                    }
                }
            }

            // 抽奖
            Image {
                source: "qrc:/image/award.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        lotteryDraw.visible = true
                    }
                }
            }
        }

        //------------------------------------------------------------

        // 需要安装 LAVFilter
        MediaPlayer { id: video; source: "D:/QT/video.mp4" }

        // 视频播放器
        VideoOutput {
            z: 10
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop
            source: video
            visible: video.playbackState == MediaPlayer.PlayingState
        }

        //------------------------------------------------------------

        // 穿裤子
        WearPant { id: wearPant }

        // 蒙眼喂食
        BlindfoldFeeding { id: blindfoldFeeding }

        // 看图猜成语
        GuessIdiom { id: guessIdiom }

        //------------------------------------------------------------

        // 抽奖界面
        LotteryDraw { id: lotteryDraw }

        // 抽奖动画
        FlashDisplay { id: flashDisplay }

        // 抽奖文本
        TextDisplay { id: textDisplay }

        // 抽奖音效
        MediaPlayer { id: music; source: "D:/QT/music.wav" }

        //------------------------------------------------------------
    }
}
