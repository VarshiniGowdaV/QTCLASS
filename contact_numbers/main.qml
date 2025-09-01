import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    width: 600
    height: 800
    visible: true
    title: "Contact Application"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "Frontpage.qml"
    }
}
