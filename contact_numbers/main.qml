import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: frontPage
    title: "Front Page"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Button { text: "Call History"; onClicked: window.stackView.push(Qt.resolvedUrl("CallHistoryPage.qml")) }
        Button { text: "Phone Book"; onClicked: window.stackView.push(Qt.resolvedUrl("PhoneBookPage.qml")) }
        Button { text: "WhatsApp"; onClicked: window.stackView.push(Qt.resolvedUrl("WhatsAppPage.qml")) }
        Button { text: "Settings"; onClicked: window.stackView.push(Qt.resolvedUrl("SettingsPage.qml")) }
    }
}
