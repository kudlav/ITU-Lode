import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "../js/Theme.js" as Theme

Rectangle {
    anchors.fill: parent
    color: Theme.bg_button

    ColumnLayout {
        anchors.fill: parent

        Pane {
            Layout.fillWidth: true
            background: Rectangle {
                color: Theme.bg_battlefield
            }

           Label {
                id: pageTitle
                width: parent.width
                text: qsTr("Chat s nepřítelem")
                color: Theme.color_light
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            displayMarginBeginning: 40
            displayMarginEnd: 40
            verticalLayoutDirection: ListView.BottomToTop
            Layout.margins: 3
            spacing: 12
            model: 10
            delegate: Row {
                readonly property bool sentByMe: index % 2 == 0

                anchors.right: sentByMe ? parent.right : undefined
                spacing: 4

                Rectangle {
                    width: 80
                    height: 40
                    color: sentByMe ? "lightgrey" : "steelblue"

                    Label {
                        anchors.centerIn: parent
                        text: index
                        color: sentByMe ? "black" : "white"
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {}
        }

        Pane {
            id: pane
            padding: 5
            Layout.fillWidth: true
            background: Rectangle {
                color: Theme.bg_battlefield
            }

            RowLayout {
                width: parent.width

                TextArea {
                    id: messageField
                    verticalAlignment: Text.AlignVCenter
                    height: parent.height
                    width: parent.width-55
                    placeholderText: qsTr("Napište zprávu...")
                    wrapMode: TextArea.Wrap
                    background: Rectangle {
                        color: Theme.bg_button
                    }
                }

                Button {
                    id: sendButton
                    width: 55
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    text: qsTr("Odeslat")
                    enabled: messageField.length > 0
                }
            }
        }
    }
}
