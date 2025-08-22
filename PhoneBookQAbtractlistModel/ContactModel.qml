import QtQuick
import QtQuick.Controls

Rectangle {
    anchors.fill: parent
    color: "black"

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            text: "Contact List"
            font.pixelSize: 30
            color: "white"
        }

        ListView {
            width: parent.width * 0.8
            height: parent.height * 0.6
            model: contactModel

            delegate: Rectangle {
                width: parent.width
                height: 50
                color: "#333"
                border.color: "white"
                border.width: 1
                radius: 5

                Row {
                    spacing: 20
                    anchors.centerIn: parent
                    Text {
                        text: contactName
                        color: "white"
                        font.pixelSize: 18
                    }
                    Text {
                        text: contactNumber
                        color: "lightgreen"
                        font.pixelSize: 18
                    }
                }
            }
        }

        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: mainWindow.loadContactPage()
        }
    }
}
