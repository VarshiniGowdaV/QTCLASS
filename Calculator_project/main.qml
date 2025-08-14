import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Calculator"

    property string displayText: ""

    Rectangle {
        anchors.fill: parent
        color: "black"

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            anchors.margins: 10

            // Display Area
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 150
                color: "black"

                Text {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 40
                    color: "white"
                    text: displayText
                }
            }

            // Button Component
            Component {
                id: calcButtonComponent
                Button {
                    id: btn
                    property color bgColor: "#2d2d2d"
                    property color textColor: "white"
                    font.pixelSize: 20

                    background: Rectangle {
                        radius: width / 2
                        color: btn.bgColor
                    }

                    contentItem: Text {
                        text: btn.text
                        font.pixelSize: 20
                        color: btn.textColor
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    implicitWidth: 70
                    implicitHeight: 70
                    Layout.preferredWidth: parent ? parent.width / 4 - 10 : 70
                    Layout.preferredHeight: Layout.preferredWidth

                    onClicked: {
                        handleButtonClick(btn.text);
                    }
                }
            }

            // Buttons Area
            GridLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                columns: 4
                rowSpacing: 10
                columnSpacing: 10

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "AC"; item.bgColor = "#2d2d2d" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "%"; item.bgColor = "#2d2d2d" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "←"; item.bgColor = "#2d2d2d" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "÷"; item.bgColor = "#2d2d2d" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "7"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "8"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "9"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "×"; item.bgColor = "#2d2d2d" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "4"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "5"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "6"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "-"; item.bgColor = "#2d2d2d" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "1"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "2"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "3"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "+"; item.bgColor = "#2d2d2d" } }

                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "00"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "0"; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "."; item.bgColor = "#3a3a3a" } }
                Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "="; item.bgColor = "#787878" } }
            }
        }
    }

    // JavaScript helper for button clicks
    function handleButtonClick(label) {
        if (label === "AC") {
            displayText = "";
        } else if (label === "←") {
            displayText = displayText.slice(0, -1);
        } else if (label === "=") {
            try {
                // Replace ÷ and × for JS evaluation
                let expression = displayText.replace(/÷/g, "/").replace(/×/g, "*");
                displayText = String(Function('"use strict";return (' + expression + ')')());
            } catch (e) {
                displayText = "Error";
            }
        } else {
            displayText += label;
        }
    }
}

// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15

// ApplicationWindow {
//     visible: true
//     width: 360
//     height: 640
//     title: "Calculator"

//     Rectangle {
//         anchors.fill: parent
//         color: "black"

//         ColumnLayout {
//             anchors.fill: parent
//             spacing: 10
//             anchors.margins: 10

//             // Display Area
//             Rectangle {
//                 Layout.fillWidth: true
//                 Layout.preferredHeight: 150
//                 color: "black"
//             }

//             // Button Component
//             Component {
//                 id: calcButtonComponent
//                 Button {
//                     id: btn
//                     property color bgColor: "#2d2d2d"
//                     property color textColor: "white"
//                     font.pixelSize: 20

//                     background: Rectangle {
//                         radius: width / 2
//                         color: btn.bgColor
//                     }

//                     contentItem: Text {
//                         text: btn.text
//                         font.pixelSize: 20
//                         color: btn.textColor
//                         anchors.centerIn: parent
//                         horizontalAlignment: Text.AlignHCenter
//                         verticalAlignment: Text.AlignVCenter
//                     }

//                     // Make buttons proportional circles
//                     implicitWidth: 70
//                     implicitHeight: 70
//                     Layout.preferredWidth: parent ? parent.width / 4 - 10 : 70
//                     Layout.preferredHeight: Layout.preferredWidth
//                 }
//             }

//             // Buttons Area
//             GridLayout {
//                 Layout.fillWidth: true
//                 Layout.fillHeight: true
//                 columns: 4
//                 rowSpacing: 10
//                 columnSpacing: 10

//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "AC"; item.bgColor = "#2d2d2d" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "%"; item.bgColor = "#2d2d2d" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "←"; item.bgColor = "#2d2d2d" } } // changed symbol
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "÷"; item.bgColor = "#2d2d2d" } }

//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "7"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "8"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "9"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "×"; item.bgColor = "#2d2d2d" } }

//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "4"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "5"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "6"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "-"; item.bgColor = "#2d2d2d" } }

//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "1"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "2"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "3"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "+"; item.bgColor = "#2d2d2d" } }

//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "00"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "0"; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "."; item.bgColor = "#3a3a3a" } }
//                 Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "="; item.bgColor = "#787878" } }
//             }
//         }
//     }
// }


