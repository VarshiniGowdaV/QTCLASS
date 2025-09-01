import QtQuick
import QtQuick.Controls

Rectangle {
    id: contactPage
    anchors.fill: parent
    color: "black"

    signal submitClicked(string name, string phone)
    signal backClicked()

    Column {
        anchors.centerIn: parent
        spacing: 15

        Label {
            text: "Create New Contact"
            font.pixelSize: 24
            color: "white"
        }

        TextField {
            id: nameField
            placeholderText: "Enter name"
            width: 200
        }

        TextField {
            id: phoneField
            placeholderText: "Enter phone"
            width: 200
        }

        Row {
            spacing: 10
            Button {
                text: "Submit"
                onClicked: {
                    if (nameField.text !== "" && phoneField.text !== "") {
                        submitClicked(nameField.text, phoneField.text)
                        nameField.text = ""
                        phoneField.text = ""
                    }
                }
            }
            Button {
                text: "Back"
                onClicked: backClicked()
            }
        }
    }
}
