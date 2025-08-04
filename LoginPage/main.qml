import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id:background

    Rectangle
    {
        width: background.width/2
        height: background.height/2
        border.color:"black"
        anchors.centerIn: parent
    }
    Column
    {
        id:col
        spacing: 10
        anchors.centerIn: parent
        Text {
            id: userlable
            text: qsTr("UserName")
        }
        TextField
        {
            id: userNameEdit
            width: background.width/2.5
            height: background.height/10
            placeholderText: "Enter UserName"
        }
        Text {
            id: passwordlable
            text: qsTr("Password")
        }
        TextField
        {
            id: passwordEdit
            width: background.width/2.5
            height: background.height/10
            placeholderText: "Enter Password"
        }
        Row
        {
           id:btnrow
           spacing: 10
           anchors.horizontalCenter: parent.horizontalCenter
           Button{
               id:submit
               text:"submit"
               width: background.width/6
               height: background.height/15

               onClicked:
               {
                   submitclicked()
               }
           }
           Button{
               id:cancel
               text:"cancel"
               width: background.width/6
               height: background.height/15

               onClicked:
               {
                   cancelclicked()
               }
           }
        }
    }

}
