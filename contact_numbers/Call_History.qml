import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: callHistoryPage
    anchors.fill: parent
    color: "lightgray"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        ListView {
            id: callHistoryList
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
                color: "#ffffff"
                border.color: "gray"

                Row {
                    anchors.centerIn: parent
                    spacing: 12
                    Column {
                        Text { text: name; font.bold: true }
                        Text { text: callTime; font.pixelSize: 12; color: "gray" }
                    }
                    Item { width: 20 }
                    Text { text: number }
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                text: "Back"
                onClicked: pageLoader.source = "Frontpage.qml"
            }
        }
    }
}
