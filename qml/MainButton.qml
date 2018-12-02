import QtQuick 2.11
import QtQuick.Controls 2.4
import "../js/Theme.js" as Theme

RoundButton {
    width: 200
    height: 50
    padding: 10
    font.pointSize: 12
    anchors.horizontalCenter: parent.horizontalCenter
    background: Rectangle {
        radius: 10
        color: Theme.bg_button
        border.color: Theme.line_button
        border.width: 1
    }
}
