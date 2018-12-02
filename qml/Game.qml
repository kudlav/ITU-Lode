import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "../js/Theme.js" as Theme

Rectangle {
    id: game
    width: root.width
    height: root.height
    color: "#00000000"
    property bool myTurn: true

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: clock()
    }

    Timer {
        id: aiCompute
        running: false; repeat: false
        onTriggered: {
            if (!game.myTurn) {
                var x = Math.floor(Math.random() * 10);
                var y = Math.floor(Math.random() * 10);
                shot(false, x, y)
            }
        }
    }

    signal handlerLoader(string page)
    signal changeTurn()
    signal clock()
    signal shot(bool me, int row, int col)

    Connections {
        target: game.item
        onChangeTurn: {
            game.myTurn = !game.myTurn;
            time.value = 0;
            if (!game.myTurn) {
                aiCompute.interval = Math.floor(Math.random() * 5000)+2000;
                aiCompute.start()
            }
        }
        onClock: {
            time.value++
            if (time.value == 40) {
                changeTurn();
            }
        }
        onShot: {
            var battlefield;
            if (me) {
                 battlefield = root.battlefield2;
            }
            else {
                battlefield = root.battlefield;
            }
            switch (battlefield[row][col]) {
                case "v":
                    battlefield[row][col] = "V";
                    break;
                case "l":
                    battlefield[row][col] = "L";
                    break;
            }
            if (me) {
                root.battlefield2 = battlefield;
            }
            else {
                root.battlefield = battlefield;
            }
            changeTurn();
        }
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
                height: 40

                SoundSwitch {}
            }

            Row {
                width: parent.width
                height: (parent.height-100)*0.2

                Column {
                    id: column3
                    width: parent.width*0.5
                    height: parent.height
                    Text {
                        id: header
                        text: game.myTurn ? qsTr("Jste na tahu...") : qsTr("Nepřítel na tahu...")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                        font.pointSize: 20
                        fontSizeMode: Text.Fit
                    }
                }

                Column {
                    id: column2
                    width: parent.width*0.5
                    height: parent.height
                    Row {
                        height: parent.height
                        width: parent.width
                        Column {
                            height: parent.height
                            width: parent.width*0.4
                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Čas pro tah: "+(40-time.value)+" s"
                            }
                        }
                        Column {
                            height: parent.height
                            width: parent.width*0.6
                            ProgressBar {
                                id: time
                                anchors.verticalCenter: parent.verticalCenter
                                from: 0
                                to: 40
                                value: 0
                            }
                        }
                    }
                }
            }

            Row {
                width: parent.width
                height: (parent.height-100)*0.8

                Column {
                    id: column
                    width: parent.width*0.5
                    Text {
                        height: 20
                        text: qsTr("Vaše flotila:")
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        renderType: Text.NativeRendering
                        font.bold: true
                        font.pointSize: 12
                    }
                    GridLayout {
                        id: battlefield
                        property variant xScale: ["1","2","3","4","5","6","7","8","9","10"]
                        property variant yScale: ["A","B","C","D","E","F","G","H","I","J"]
                        anchors.horizontalCenter: parent.horizontalCenter
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
                                width: 30
                                height: 30
                                color: Theme.bg_battlefield
                                Text {
                                    width: parent.width
                                    height: parent.height
                                    text: (root.battlefield[parent.Layout.row-1][parent.Layout.column-1]=="v" || root.battlefield[parent.Layout.row-1][parent.Layout.column-1]=="l") ? qsTr("") : qsTr("❌")
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }

                    }
                }
                Column {
                    id: column1
                    width: parent.width*0.5
                    Text {
                        height: 20
                        text: qsTr("Nepřátelská flotila:")
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        renderType: Text.NativeRendering
                        font.bold: true
                        font.pointSize: 12
                    }
                    GridLayout {
                        id: battlefield2
                        anchors.horizontalCenter: parent.horizontalCenter
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
                                width: 30
                                height: 30
                                color: Theme.bg_battlefield
                                Text {
                                    width: parent.width
                                    height: parent.height
                                    text: (root.battlefield2[parent.Layout.row-1][parent.Layout.column-1]=="v" || root.battlefield2[parent.Layout.row-1][parent.Layout.column-1]=="l") ? qsTr("") : qsTr("❌")
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (game.myTurn) {
                                            shot(true, parent.Layout.row-1, parent.Layout.column-1)
                                        }
                                    }
                                }
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
                }
                Column {
                    width: parent.width*0.5
                    height: parent.height
                    MainButton {
                        text: qsTr("Vzdát se")
                        onClicked: {
                            handlerLoader("NewGame.qml")
                        }
                    }
                }
            }
        }
    }
}
