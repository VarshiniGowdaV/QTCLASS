import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Front Page"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Phone Book"
            onClicked: stackView.push(Qt.resolvedUrl("PhoneBookPage.qml"))
        }
        Button {
            text: "Call History"
            onClicked: stackView.push(Qt.resolvedUrl("CallHistoryPage.qml"))
        }
        Button {
            text: "WhatsApp"
            onClicked: stackView.push(Qt.resolvedUrl("WhatsAppPage.qml"))
        }
    }
}
