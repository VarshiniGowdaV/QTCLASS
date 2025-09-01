import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Phone Book"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField { placeholderText: "Search Contacts..." }
        ListView {
            Layout.fillWidth: true; Layout.fillHeight: true
            model: phoneBookModel  // from C++
            delegate: Row {
                spacing: 10
                Image { source: photo; width: 40; height: 40 }
                Column {
                    Text { text: contactName; font.bold: true }
                    Text { text: contactNumber }
                }
            }
        }
        Button { text: "Add Contact" }
    }
}
