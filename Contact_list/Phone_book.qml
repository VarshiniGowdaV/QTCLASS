import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Phone Book"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: phoneSearch
            placeholderText: "Search Contact"
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: phoneBookModel
            delegate: ItemDelegate {
                width: parent.width
                text: contactName + " (" + contactNumber + ")"
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Button {
                text: "Add Contact"
                onClicked: stackView.push(Qt.resolvedUrl("AddContactPage.qml"))
            }
            Button {
                text: "Back"
                onClicked: stackView.pop()
            }
        }
    }
}
