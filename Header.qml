import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

//Page header

Rectangle {
    id: root
    property alias title: lblTitle.text
    property alias avatarColor: imgAvatar.color
    property alias textColor: lblTitle.color
    color: "#91113c"
    height: 60

    //Avatar circle
    Rectangle {
        id: imgAvatar
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: defMargin

        height: root.height*0.8
        width: height
        radius: height/2
        color: win.bubbleColor

        //First letter of title
        Text {
            id: lblAvatar
            anchors.centerIn: parent
            font.pixelSize: parent.height*0.5
            text: title[0]
            color: textColor
        }
    }

    //Title label
    Label {
        id: lblTitle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: win.textColor
        font.pixelSize: root.height*0.4
    }
}
