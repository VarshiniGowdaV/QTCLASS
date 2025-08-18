// import QtQuick
// import QtQuick.Controls

// Window {
//     width: 640
//     height: 480
//     visible: true
//     title: qsTr("Student Registration")
//     id: background

//     Rectangle {
//         width: background.width / 2
//         height: background.height / 1.1
//         border.color: "black"
//         anchors.centerIn: parent
//         radius: 10

//         Column {
//             id: col
//             spacing: 10
//             anchors.centerIn: parent

//             Text { text: "Student Name" }
//             TextField {
//                 id: studentnameEdit
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Enter the student name"
//             }

//             Text { text: "Student Phone Number" }
//             TextField {
//                 id: studentphonenumberEdit
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Enter the student phone number"
//             }

//             Text { text: "Father Name" }
//             TextField {
//                 id: fatherNameEdit
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Enter the father's name"
//             }

//             Text { text: "Username / Email" }
//             TextField {
//                 id: userNameEmailEdit
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Enter username or email"
//             }

//             Text { text: "Password" }
//             TextField {
//                 id: passwordEdit
//                 echoMode: TextInput.Password
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Enter password"
//             }

//             Text { text: "Confirm Password" }
//             TextField {
//                 id: confirmpasswordEdit
//                 echoMode: TextInput.Password
//                 width: background.width / 2.5
//                 height: background.height / 25
//                 placeholderText: "Re-enter password"
//             }

//             Row {
//                 id: btnRow
//                 spacing: 10
//                 anchors.horizontalCenter: parent.horizontalCenter

//                 Button {
//                     id: save
//                     text: "Save"
//                     width: background.width / 15
//                     height: background.height / 35
//                     onClicked: {
//                         backend.submitClicked(
//                             studentnameEdit.text,
//                             studentphonenumberEdit.text,
//                             fatherNameEdit.text,
//                             userNameEmailEdit.text,
//                             passwordEdit.text,
//                             confirmpasswordEdit.text
//                         )
//                     }
//                 }

//                 Button {
//                     id: cancel
//                     text: "Cancel"
//                     width: background.width / 15
//                     height: background.height / 35
//                     onClicked: backend.cancelClicked()
//                 }

//                 Button {
//                     id: clear
//                     text: "Clear"
//                     width: background.width / 15
//                     height: background.height / 35
//                     onClicked: {
//                         studentnameEdit.text = ""
//                         studentphonenumberEdit.text = ""
//                         fatherNameEdit.text = ""
//                         userNameEmailEdit.text = ""
//                         passwordEdit.text = ""
//                         confirmpasswordEdit.text = ""
//                     }
//                 }
//             }
//         }
//     }
// }

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

