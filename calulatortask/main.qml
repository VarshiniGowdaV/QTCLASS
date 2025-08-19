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

        // Display
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            radius: 10
            color: "grey"
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                text: backend ? backend.displayText : "0"
                color: "white"
                font.pixelSize: 36
                elide: Text.ElideLeft
            }
        }

        // Buttons Grid
        GridLayout {
            id: buttonGrid
            columns: 4
            rowSpacing: 10
            columnSpacing: 10
            Layout.fillWidth: true
            Layout.fillHeight: true

            Repeater {
                model: backend.buttons
                delegate: Button {
                    property string label: modelData.label
                    property color bgColor: modelData.color

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: label

                    background: Rectangle {
                        color: bgColor
                        radius: width / 4
                    }
                    contentItem: Text {
                        text: label
                        font.pixelSize: 22
                        color: "white"
                        anchors.centerIn: parent
                    }

                    onClicked: backend.handleButtonClick(label)

                    // keep circular
                    onWidthChanged: height = width
                }
            }
        }
    }
}

// // import QtQuick 2.15
// // import QtQuick.Controls 2.15
// // import QtQuick.Layouts 1.15

// // ApplicationWindow {
// //     visible: true
// //     width: 360
// //     height: 560
// //     title: "Calculator"

// //     Rectangle {
// //         anchors.fill: parent
// //         color: "light gray"

// //         ColumnLayout {
// //             anchors.fill: parent
// //             anchors.margins: 12
// //             spacing: 12

// //             Rectangle {
// //                 Layout.fillWidth: true
// //                 Layout.preferredHeight: 120
// //                 radius: 10
// //                 color: "#1e1e1e"
// //                 border.color: "#2a2a2a"

// //                 Text {
// //                     anchors.fill: parent
// //                     anchors.margins: 16
// //                     horizontalAlignment: Text.AlignRight
// //                     verticalAlignment: Text.AlignVCenter
// //                     font.pixelSize: 38
// //                     color: "white"
// //                     text: backend.displayText
// //                     elide: Text.ElideLeft
// //                     wrapMode: Text.NoWrap
// //                 }
// //             }

// //             Rectangle {
// //                 Layout.fillWidth: true
// //                 Layout.fillHeight: true
// //                 radius: 10
// //                 color: "#181818"
// //                 border.color: "#262626"

// //                 GridLayout {
// //                     id: grid
// //                     anchors.fill: parent
// //                     anchors.margins: 10
// //                     columnSpacing: 10
// //                     rowSpacing: 10
// //                     columns: 4

// //                     property real cellW: (width - (columns - 1) * columnSpacing) / columns
// //                     property int rows: 5
// //                     property real cellH: (height - (rows - 1) * rowSpacing) / rows

// //                     Repeater {
// //                         model: backend.buttons

// //                         delegate: Button {
// //                             Layout.preferredWidth: grid.cellW
// //                             Layout.preferredHeight: grid.cellH
// //                             font.pixelSize: 20
// //                             text: modelData["text"]

// //                             background: Rectangle {
// //                                 radius: 10
// //                                 color: modelData["color"]
// //                             }

// //                             contentItem: Text {
// //                                 text: parent.text
// //                                 color: "white"
// //                                 font.pixelSize: 20
// //                                 horizontalAlignment: Text.AlignHCenter
// //                                 verticalAlignment: Text.AlignVCenter
// //                                 anchors.fill: parent
// //                                 anchors.margins: 2
// //                             }

// //                             onClicked: backend.handleButtonClick(text)
// //                         }
// //                     }
// //                 }
// //             }
// //         }
// //     }
// // }
