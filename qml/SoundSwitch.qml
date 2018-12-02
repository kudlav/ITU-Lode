import QtQuick 2.11
import QtQuick.Controls 2.4
import "../js/Theme.js" as Theme

Switch {
    text: root.music ? qsTr("Zvuk zapnut") : qsTr("Zvuk vypnut")
    checked: root.music
    enabled: true
    anchors.top: parent.top
    anchors.topMargin: 20
    onClicked: {
        root.music = !root.music;
    }
}
