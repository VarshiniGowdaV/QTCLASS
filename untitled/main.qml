import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id :background
    Rectangle
    {
        width: background.width/2
        height: background.height/2
        border.color:"black"
        anchors.centerIn: parent
        radius: 10
    }
    Column
    {
        id:col
        spacing: 10
        anchors.centerIn: parent
        Text {
            id: studentname
            text: qsTr("StudentName")
        }
        TextField
        {
            id:studentnameEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the student name"
        }
        Text {
            id: studentphonenumber
            text: qsTr("Studentphonenumber")
        }
        TextField
        {
            id:studentphonenumberEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the student Phone Number"
        }
        Text {
            id: fatherName
            text: qsTr("FatherName")
        }
        TextField
        {
            id:fatherNameEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the fatherName"
        }
        Text {
            id:userNameEmail
            text: qsTr("UserName/Email")
        }
        TextField
        {
            id:userNameEmailEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the userName/Email"
        }
        Text {
            id:password
            text: qsTr("Password")
        }
        TextField
        {
            id:passwordEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the Password"
        }
        Text
        {
            id:confirmpassword
            text: qsTr("Confirm Password")
        }
        TextField
        {
            id:confirmpasswordEdit
            width:background.width/2.5
            height: background.height/25
            placeholderText: "Enter the confirm Password"
        }
        Row
        {
           id:btnrow
           spacing: 10
           anchors.horizontalCenter: parent.horizontalCenter
           Button
           {
               id:save
               text:"save"
               width: background.width/15
               height: background.height/35

               onClicked:
               {
                   submitclicked()
               }
           }
           Button{
               id:cancel
               text:"cancel"
               width: background.width/15
               height: background.height/35

               onClicked:
               {
                   cancelclicked()
               }
           }
           Button
           {
               id:clear
               text:"clear"
               width: background.width/15
               height: background.height/35

               onClicked:
               {
                   cancelclicked()
               }
           }
        }
    }
}

