import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4
import "../js/Theme.js" as Theme

Window {
    id: root
    visible: true
    width: 960
    height: 600
    color: Theme.bg_page
    title: "Hra Lodě"

    property bool music: false
    property variant battlefield: [["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"]]
    property variant battlefield2: [["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"],["v","v","v","v","v","v","v","v","v","v"]]

    Loader {
        id: window
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Escape) {
                console.log("Hide");
                root.visibility = 3;
            }
        }
        source: "NewGame.qml"
    }

    signal handlerLoader(string page)

    Connections {
        target: window.item
        onHandlerLoader: {
            window.source = page;
        }
    }
}
