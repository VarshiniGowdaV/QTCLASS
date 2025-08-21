import QtQuick
import QtQuick.Controls

Item {
    property var model
    signal addContactRequested()

    Column {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: searchField
            placeholderText: "Search contacts"
            width: parent.width
        }

        ListView {
            id: listView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: searchField.bottom
            anchors.bottom: addButton.top
            model: parent.model

            delegate: Rectangle {
                width: parent.width
                height: 40
                color: "transparent"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: name + " (" + phone + ")"
                    color: "white"
                }

                visible: searchField.text === "" ||
                         name.toLowerCase().indexOf(searchField.text.toLowerCase()) !== -1
            }
        }

        TextField {
            id: addButton
            placeholderText: "Type 'add' and press Enter"
            width: parent.width
            onAccepted: {
                if (text.toLowerCase() === "add") {
                    addContactRequested()
                    text = ""
                }
            }
        }
    }
}
