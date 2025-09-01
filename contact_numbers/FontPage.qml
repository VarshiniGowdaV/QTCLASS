import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Front Page"

    Row {
        anchors.centerIn: parent
        spacing: 40

        // Call History Button
        Rectangle {
            width: 80
            height: 80
            radius: width / 2
            color: "#3498db"
            Text {
                anchors.centerIn: parent
                text: "Call"
                color: "white"
                font.pixelSize: 14
            }
            MouseArea {
                anchors.fill: parent
                onClicked: window.loadPage("CallHistoryPage.qml")
            }
        }

        // Phone Book Button
        Rectangle {
            width: 80
            height: 80
            radius: width / 2
            color: "#2ecc71"
            Text {
                anchors.centerIn: parent
                text: "Phone"
                color: "white"
                font.pixelSize: 14
            }
            MouseArea {
                anchors.fill: parent
                onClicked: window.loadPage("PhoneBookPage.qml")
            }
        }

        // WhatsApp Button
        Rectangle {
            width: 80
            height: 80
            radius: width / 2
            color: "#27ae60"
            Text {
                anchors.centerIn: parent
                text: "WhatsApp"
                color: "white"
                font.pixelSize: 14
            }
            MouseArea {
                anchors.fill: parent
                onClicked: window.loadPage("WhatsappPage.qml")
            }
        }
    }
}
