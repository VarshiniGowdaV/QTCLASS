import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Calculator"
    color: "black"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            radius: 10
            color: "black"
            Text {
                id: display
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 40
                color: "white"
                text: backend ? backend.displayText : "0"            }
        }

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            columns: 4
            rowSpacing: 10
            columnSpacing: 10

            Repeater {
                model: backend.buttons
                delegate: Button {
                    text: modelData.text
                    font.pixelSize: 22
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    background: Rectangle {
                        color: modelData.color || "grey"
                        radius: 40
                    }
                    onClicked:  backend.handleButtonClick(modelData.text)
                }
            }

        }
    }
}
