import QtQuick 2.12

//Message delegate item

Item {
    id: root
    property alias text: lblText.text
    property alias time: lblTime.text
    property alias backgroundColor: rectBubble.color
    property alias textColor: lblText.color
    property alias font: lblText.font

    //Properties from main.qml are available here
    height: lblText.contentHeight + 2*defMargin + lblTime.height

    Rectangle {
        id: rectBubble
        color: win.bubbleColor
        anchors.fill: parent
        radius: 5

        Text {
            id: lblText
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: defMargin
            font.pointSize: 11
            color: win.textColor
            wrapMode: Text.WordWrap
        }
        Text {
            id: lblTime
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: defMargin/2
            color: textColor
        }
    }
}
