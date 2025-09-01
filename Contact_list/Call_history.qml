import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Call History"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: callSearch
            placeholderText: "Search Call History"
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: callHistoryModel
            delegate: ItemDelegate {
                width: parent.width
                text: contactName + " | " + callTime +
                      (isIncoming === "yes" ? " (Incoming)" : (isOutgoing === "yes" ? " (Outgoing)" : ""))
            }
        }

        Button {
            text: "Back"
            onClicked: stackView.pop()
        }
    }
}
