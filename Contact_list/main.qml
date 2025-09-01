import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 400
    height: 650
    visible: true
    title: "Contacts App"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("FrontPage.qml")
    }
}
