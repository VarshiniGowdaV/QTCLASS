import QtQuick
import QtQuick.Controls
import QtQuick.Window

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Invisible MouseArea Bug Demo"

    // Background items
    Column {
        anchors.fill: parent
        spacing: 10
        Button { text: "Button 1"; onClicked: console.log("Button 1 clicked") }
        Button { text: "Button 2"; onClicked: console.log("Button 2 clicked") }
        Button { text: "Button 3"; onClicked: console.log("Button 3 clicked") }
    }

    // Simulated Virtual Keyboard
    Rectangle {
        id: virtualKeyboard
        anchors.bottom: parent.bottom
        width: parent.width
        height: 200
        color: "#cccccc"

        // Invisible MouseArea simulating the Qt Virtual Keyboard bug
        MouseArea {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: Screen.height      // BUG: covers entire screen!
            // No visible color, fully transparent
            onPressed: console.log("Keyboard MouseArea pressed")
        }

        // Actual keys (for completeness)
        Row {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            Repeater {
                model: ["A", "B", "C"]
                Button { text: modelData; onClicked: console.log(modelData + " pressed") }
            }
        }
    }
}
