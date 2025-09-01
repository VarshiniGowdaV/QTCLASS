import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: homePage
    title: "Home"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "📒 Phone Book"
            onClicked: window.loadPage("PhoneBookPage.qml")
        }

        Button {
            text: "📞 Call History"
            onClicked: window.loadPage("CallHistoryPage.qml")
        }

        Button {
            text: "💬 WhatsApp"
            onClicked: window.loadPage("WhatsAppPage.qml")
        }
    }
}
