import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Add Contact"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 15

        TextField { id: nameField; placeholderText: "Enter Name" }
        TextField { id: numberField; placeholderText: "Enter Number" }
        TextField { id: imageField; placeholderText: "Enter Image Path" }

        RowLayout {
            spacing: 10
            Button {
                text: "Save"
                onClicked: {
                    phoneBookModel.addContact(nameField.text, numberField.text, imageField.text)
                    stackView.pop()
                }
            }
            Button {
                text: "Back"
                onClicked: stackView.pop()
            }
        }
    }
}
