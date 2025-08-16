import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id: loginPage
    anchors.fill: parent
    color: "lightgrey"

    signal backButtonClicked()

    Column{
        id: loginColumnLayout
        spacing: 10
        anchors.verticalCenter: loginPage.verticalCenter
        anchors.horizontalCenter: loginPage.horizontalCenter

        Text {
            id: welcomePage
            text: qsTr("Welcome Back")
            font.bold: true
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            color: "Black"
        }

        Text {
            id: emailId
            text: qsTr("Email Id")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: emailIdText
            width: loginPage.width / 2
            height: 50
            placeholderText: "Enter Email Id"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
        }


        Text {
            id: password
            text: qsTr("Password")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: passwordText
            width: loginPage.width / 2
            height: 50
            placeholderText: "Enter Password"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
        }

        Button{
            id: submit
            width: loginPage.width / 2
            height: 50

            Text {
                id: cancel
                text: qsTr("Submit")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 14
                color: "White"
            }

            onClicked: {
                console.log("Submit Button Cicked")
                Login.checkLoginInfo(emailIdText.text, passwordText.text)
            }
        }

        Button{
            id: back
            width: loginPage.width / 2
            height: 50

            Text {
                id: clear
                text: qsTr("Back")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 14
                color: "White"
            }

            onClicked: {
                console.log("Back Button Cicked")
                backButtonClicked()
            }
        }
    }
}
