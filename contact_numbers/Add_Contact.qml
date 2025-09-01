import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: addContactPage
    anchors.fill: parent
    color: "lightgray"

    Column {
        anchors.centerIn: parent
        spacing: 15

        TextField {
            id: nameField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Name"
            font.pixelSize: 18
            color: "black"
        }

        TextField {
            id: numberField
            width: addContactPage.width / 2
            height: 50
            placeholderText: "Enter Number"
            font.pixelSize: 18
            color: "black"
        }

        TextField {
            id: imageField
            placeholderText: "Image URL (optional)"
            width: addContactPage.width / 2
            height: 50
            font.pixelSize: 18
            color: "black"
        }

        Row {
            spacing: 40

            Button {
                text: "Save"
                onClicked: {
                    if (nameField.text !== "" && numberField.text !== "") {
                        modelManager.addContact(nameField.text, numberField.text, imageField.text, "", false, false, "");
                        pageLoader.source = "PhoneBookPage.qml"
                    } else {
                        console.log("Please enter name and number")
                    }
                }
            }

            Button {
                text: "Back"
                onClicked: pageLoader.source = "PhoneBookPage.qml"
            }
        }
    }
}
