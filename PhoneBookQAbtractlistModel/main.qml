import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: "Phone Book"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "Contact.qml"
    }

    function loadContactPage() {
        pageLoader.source = "Contact.qml"
    }

    function loadContactListPage() {
        pageLoader.source = "ContactListDisplay.qml"
    }
}
