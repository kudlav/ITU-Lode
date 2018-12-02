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

    Column {
        id: column
        antialiasing: false
        width: root.width
        height: root.height

        Row {
            width: parent.width
            height: (parent.height-60)*0.2

            SoundSwitch {}

            Text {
                id: header
                height: parent.height
                text: qsTr("Rozmístěte vaše lodě")
                font.bold: true
                font.pointSize: 30
                lineHeight: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Row {
            width: parent.width
            height: (parent.height-60)*0.8

            Column {
                id: column1
                height: parent.height
                width: 200

                Rectangle {
                    width: 180
                    height: parent.height-10
                    color: Theme.bg_battlefield
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    RoundButton {
                        text: qsTr("Rozmístit náhodně")
                        leftPadding: 30
                        focusPolicy: Qt.NoFocus
                        anchors.bottomMargin: 5
                        font.pointSize: 12
                        padding: 6
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        background: Rectangle {
                            radius: 15
                            color: Theme.color_green
                        }
                        onClicked: {
                            handlerLoader("NewGame.qml")
                        }
                    }
                }
            }

            Column {
                height: parent.height
                width: parent.width-200

                GridLayout {
                    id: battlefield
                    property variant xScale: ["1","2","3","4","5","6","7","8","9","10"]
                    property variant yScale: ["A","B","C","D","E","F","G","H","I","J"]
                    rows: 11
                    columns: 11
                    rowSpacing: 3
                    columnSpacing: 3
                    /* X scale row */
                    Text {
                        Layout.column: 0
                        Layout.row: 0
                        text: qsTr(" ")
                    }
                    Repeater {
                        model: battlefield.xScale
                        Text {
                            Layout.column: index+1
                            Layout.row: 0
                            text: modelData
                        }
                    }
                    Repeater {
                        model: battlefield.yScale
                        Text {
                            Layout.column: 0
                            Layout.row: index+1
                            text: modelData
                        }
                    }
                    /* Battlefield cells */
                    Repeater {
                        model: 100
                        Rectangle {
                            Layout.column: (index%10)+1
                            Layout.row: (index/10)+1
                            color: Theme.bg_battlefield
                            width: 30
                            height: 30
                        }
                    }

                }
            }
        }

        Row {
            width: parent.width
            height: 60

            Column {
                width: parent.width*0.5
                height: parent.height
                MainButton {
                    text: qsTr("🡄 Zpět do menu")
                    onClicked: {
                        handlerLoader("NewGame.qml")
                    }
                }
            }
            Column {
                width: parent.width*0.5
                height: parent.height
                MainButton {
                    text: qsTr("Začít hru!")
                    width: 200
                    onClicked: {
                        handlerLoader("Prepare.qml")
                    }
                }
            }
        }
    }
}
