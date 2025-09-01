import QtQuick
import QtQuick.Controls

Rectangle {
    id: contactListPage
    anchors.fill: parent
    color: "black"

    signal backClicked()

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            text: "Saved Contacts"
            font.pixelSize: 22
            color: "white"
        }

        ListView {
            id: contactListView
            width: parent.width
            height: parent.height * 0.7
            model: contactModel

            delegate: Rectangle {
                width: parent.width
                height: 40
                color: index % 2 === 0 ? "#202020" : "#303030"

                Row {
                    spacing: 20
                    anchors.verticalCenter: parent.verticalCenter
                    Text { text: contactName; color: "white" }
                    Text { text: contactNumber; color: "lightgreen" }
                }
            }
        }

        Button {
            text: "Back"
            onClicked: backClicked()
        }
    }
}
