import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Window {
    id: win
    visible: true
    width: 480
    height: 640
    title: "Telegram front"

    readonly property int default_margin: 10
    readonly property color default_color: "#17212B"
    readonly property color bg_color: "#0E1621"
    property string usrName: "Alexander"

    StackView{
        id: stackView
        initialItem: root
        anchors.fill: parent
    }

    Page{
        id: root
        signal buttonClicked();

        background: Rectangle { color: "lightblue" }
        Text{
            anchors.centerIn: parent
            id: textName
            text: usrName
        }
        TextEdit{
            anchors.centerIn: parent
            id: textEditName
        }

        Button{
            id:navButton
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            text: "Login"
            onClicked: {
                root.buttonClicked();
            }
        }
        onButtonClicked: {
            stackView.push(page)
        }
    }

    Page{
        visible: false
        id: page
        anchors.fill: parent
        background: Rectangle { color: bg_color }
        header: Header { title: usrName }
        footer: Editor { onNewMessage: {
                var newMsg = {};
                newMsg.text = msg;
                newMsg.time = Qt.formatTime(new Date(), "hh:mm")
                listmodel.append(newMsg)
            }
        }
        spacing: default_margin

        ListView{
           id: listView
           anchors.fill: parent
           model: listmodel
           spacing: default_margin

           delegate: Message{
               height: 60
               anchors.left: parent.left
               anchors.right: parent.right
               anchors.margins: default_margin
               text: model.text
               time: model.time
           }
        }
        ListModel{
            id: listmodel
            ListElement{
                text: "message 1"
                time: "11:11"
            }
            ListElement{
                text: "message 2"
                time: "11:11"
            }
            ListElement{
                text: "message 3"
                time: "11:11"
            }
        }

    }
}
