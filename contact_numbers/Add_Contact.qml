import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: addContactPage
    title: "Add Contact"

    property var navigationCallback

    Column {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: nameField
            placeholderText: "Contact name..."
        }
        TextField {
            id: numberField
            placeholderText: "Contact number..."
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Button {
            text: "Save to Contact"
            onClicked: {
                phoneBookModel.addContact(nameField.text, numberField.text, "");
                navigationCallback("back");
            }
        }
        Button {
            text: "Save to WhatsApp"
            onClicked: {
                whatsappModel.addChat(nameField.text, numberField.text, "", "", "");
                navigationCallback("whatsApp");
            }
        }
    }
}
