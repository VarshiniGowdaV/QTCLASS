import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: screen.width
    height: screen.height
    visible: true
    title: qsTr("Contact Application")

    Loader {
        id: load
        width: parent.width
        height: parent.height
        source:  "Contact.qml"
    }

    Connections {
        target: load.item

        function onViewContactButtonClicked() {
            load.source = "ContactListDisplay.qml"
        }

        function onBackButtonClicked() {
            load.source = "Contact.qml"
        }
    }
}
