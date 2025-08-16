import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id: homePage
    anchors.fill: parent
    color: "lightgrey"

    signal signInClicked()
    signal signUpClicked()
    signal studentDataListClicked()

    Column {
        id: homePageColoum
        anchors.centerIn: homePage
        spacing: 30

        Label {
            text: "Student Application"
            font.pixelSize: 30
            color: "black"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: signIn
            width: homePage.width / 2
            height: 50

            Text {
                id: sigInLabel
                text: qsTr("SignIn")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 20
                color: "Black"
            }

            onClicked: {
                console.log("SignIn Button Cicked")
                signInClicked()
            }

            background: Rectangle{
                color: signIn.pressed ? "#5A5A5A" : "transparent"
                anchors.fill: signIn
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }

        Button {
            id: signUp
            width: homePage.width / 2
            height: 50

            Text {
                id: signUpLabel
                text: qsTr("SignUp")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 20
                color: "Black"
            }

            onClicked: {
                console.log("SignUp Button Cicked")
                signUpClicked()
            }

            background: Rectangle{
                color: signUp.pressed ? "#5A5A5A" : "transparent"
                anchors.fill: signUp
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }

        Button {
            id: viewDataList
            width: homePage.width / 2
            height: 50

            Text {
                id: viewDataLabel
                text: qsTr("View Student Data")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 20
                color: "Black"
            }

            onClicked: {
                console.log("StudentDataList Button Cicked")
                studentDataListClicked()
            }

            background: Rectangle{
                color: viewDataList.pressed ? "#5A5A5A" : "transparent"
                anchors.fill: viewDataList
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }
    }
}
