
import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    visible: true
    width: 340
    height: 640
    title: "Calculator"
    color: "black"

    Connections {
        target: backend
        function onDisplayChanged(newValue) {
            displayText.text = newValue
        }
    }

    Column {
        anchors.fill: parent
        spacing: 12
        anchors.margins: 12

        Rectangle {
            width: parent.width
            height: 100
            radius: 12
            color: "grey"
            border.color: "white"
            border.width: 1

            Text {
                id: displayText
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 20
                text: "0"
                font.pixelSize: 32
                color: "white"
                width: parent.width - 35
            }
        }

        GridView {
            id: grid
            width: parent.width
            height: parent.height - 124
            cellWidth: 76
            cellHeight: 76
            model: backend.buttons
            flow: GridView.FlowLeftToRight
            layoutDirection: Qt.LeftToRight

            delegate: Rectangle {
                width: 64
                height: 64
                radius: width / 2
                color: "grey"

                Text {
                    text: modelData
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        backend.handleButtonClick(modelData)
                    }
                }
            }
        }
    }
}
