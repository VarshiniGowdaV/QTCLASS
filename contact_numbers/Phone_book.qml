import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "white"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        ListView {
            id: phoneBookList
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height - 100
            spacing: 8
            clip: true
            model: modelManager.contactModel

            delegate: Rectangle {
                width: parent.width
                height: 60
                radius: 6
                color: "#f0f0f0"
                border.color: "gray"

                Row {
                    anchors.centerIn: parent
                    spacing: 12
                    Text { text: name; font.bold: true }
                    Text { text: number }
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                text: "Add"
                onClicked: pageLoader.source = "Add_Contact.qml"
            }

            Button {
                text: "Back"
                onClicked: pageLoader.source = "Frontpage.qml"
            }
        }
    }
}
