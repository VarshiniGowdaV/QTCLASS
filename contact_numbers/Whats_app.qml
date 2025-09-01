import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "WhatsApp"

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        ListView {
            Layout.fillWidth: true; Layout.fillHeight: true
            model: chatModel  // from C++
            delegate: Row {
                Text { text: senderName + ": " + message }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            TextField { id: messageInput; Layout.fillWidth: true; placeholderText: "Type a message..." }
            Button { text: "Send"; onClicked: sendMessage(messageInput.text) }
        }
    }
}
