import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "WhatsApp"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: whatsappSearch
            placeholderText: "Search Chats"
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: whatsappModel
            delegate: ItemDelegate {
                width: parent.width
                text: contactName + " | " + isIncoming + " | " + callTime
            }
        }

        Button {
            text: "Back"
            onClicked: stackView.pop()
        }
    }
}
