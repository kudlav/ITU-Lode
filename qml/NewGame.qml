import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4
import "../js/Theme.js" as Theme

Rectangle {
    width: parent.width
    height: parent.height
    color: "#00000000"

    signal handlerLoader(string page)

    Column {
        id: column
        antialiasing: false
        width: root.width
        height: root.height

        Row {
            id: row
            width: parent.width
            height: parent.height*0.2

            SoundSwitch {}

            Text {
                id: header
                height: parent.height
                text: qsTr("Nová hra")
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
            height: parent.height*0.2
            MainButton {
                text: qsTr("Hra pro jednoho hráče")
                onClicked: {
                    handlerLoader("BoatPicker.qml")
                }
            }
        }

        Row {
            width: parent.width
            height: parent.height*0.2
            MainButton {
                text: qsTr("Hra pro více hráčů")
            }
        }

        Row {
            width: parent.width
            height: parent.height*0.2
            MainButton {
                text: qsTr("Nápověda a pravidla hry")
            }
        }

        Row {
            id: row1
            width: parent.width
            height: parent.height*0.2
            MainButton {
                text: qsTr("Ukončit aplikaci")
                onClicked: {
                    Qt.quit()
                }
            }

            Text {
                text: qsTr("Verze 1.0")
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                font.pixelSize: 12
            }
            Text {
                text: qsTr("Okno můžete kdykoliv skrýt stiskem klávesy ESC")
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                font.pixelSize: 15
            }
        }
    }
}

