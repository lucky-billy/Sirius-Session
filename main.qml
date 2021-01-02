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

        // 按钮
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 60
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

            // 节目单
            Image {
                source: "qrc:/image/program.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                    }
                }
            }

            // 游戏
            Image {
                source: "qrc:/image/activity.png"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
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
