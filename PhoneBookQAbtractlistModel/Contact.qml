

import QtQuick
import QtQuick.Controls

Rectangle {
    id: contactPage
    anchors.fill: parent
    color: "black"

    signal submitButtonClicked()
    signal backButtonClicked()

    Column {
        id: contactList
        anchors.centerIn: parent
        spacing: 20

        Label {
            text: "Create New Contact"
            font.pixelSize: 30
            color: "white"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Contact Name"
            color: "white"
            font.pixelSize: 18
            font.bold: true
        }
        TextField {
            id: contactNameText
            width: contactPage.width / 2
            height: 40
            placeholderText: "Enter Contact Name"
        }

        Text {
            text: "Phone Number"
            color: "white"
            font.pixelSize: 18
            font.bold: true
        }
        TextField {
            id: phoneNumberText
            width: contactPage.width / 2
            height: 40
            placeholderText: "Enter Phone Number"
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "Submit"
                onClicked: contactPage.submitButtonClicked()
            }
            Button {
                text: "Back"
                onClicked: contactPage.backButtonClicked()
            }
        }
    }
}
