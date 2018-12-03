import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "../js/Theme.js" as Theme

Rectangle {
    width: root.width
    height: root.height
    color: "#00000000"

    signal handlerLoader(string page)

    Timer {
            interval: 14000; running: true; repeat: false
            onTriggered: handlerLoader("Game.qml")
    }

    Row {
        anchors.fill: parent

        Column {
            id: columnLeft
            height: parent.height
            width: 200

            Chat {}
        }

        Column {
            id: columnRight
            height: parent.height
            width: parent.width-200

            Row {
                width: parent.width
                height: (parent.height)*0.2
                SoundSwitch {}
            }

            Row {
                width: parent.width
                height: (parent.height)*0.6

                Text {
                    id: header
                    text: qsTr("Čekáme na umístění lodí nepřítelem")
                    anchors.top: parent.top
                    font.bold: true
                    font.pointSize: 30
                    lineHeight: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Image {
                    id: clock
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "../pics/clock.png"
                    RotationAnimation on rotation {
                            loops: Animation.Infinite
                            duration: 15000
                            from: 0
                            to: 360
                        }
                }
            }

            Row {
                width: parent.width
                height: (parent.height)*0.2
                MainButton {
                    text: qsTr("Zrušit hru")
                    onClicked: {
                        handlerLoader("NewGame.qml")
                    }
                }
            }
        }
    }
}
