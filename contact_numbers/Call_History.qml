import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    title: "Call History"

    ListView {
        anchors.fill: parent
        model: callHistoryModel  // from C++
        delegate: Row {
            spacing: 10
            Image { source: photo; width: 40; height: 40 }
            Column {
                Text { text: contactName; font.bold: true }
                Text { text: contactNumber }
            }
            Text { text: callTime; anchors.right: parent.right }
        }
    }
}
