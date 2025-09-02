import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: whatsappPage
    anchors.fill: parent
    color: "white"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Header Bar
        Rectangle {
            id: headerBar
            width: parent.width
            height: 50
            color: "lightgrey"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8

                Button {
                    text: "<"
                    font.pixelSize: 18
                    background: Rectangle { color: "black" }
                    onClicked: pageLoader.source = "Frontpage.qml"
                }

                Label {
                    text: "WhatsApp"
                    font.pixelSize: 18
                    font.bold: true
                    color: "black"
                    Layout.alignment: Qt.AlignVCenter
                }
            }
        }

        // 🔍 Search Bar
        TextField {
            id: searchBar
            placeholderText: "Search..."
            Layout.fillWidth: true
            height: 40
            font.pixelSize: 14
            onTextChanged: whatsappList.forceLayout()   // Refresh filtering
        }

        // WhatsApp List
        ListView {
            id: whatsappList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: modelManager.contactModel
            spacing: 6

            delegate: Item {
                width: whatsappList.width
                height: 70
                visible: (searchBar.text === ""
                          || name.toLowerCase().indexOf(searchBar.text.toLowerCase()) !== -1
                          || shortMessage.toLowerCase().indexOf(searchBar.text.toLowerCase()) !== -1)

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    Rectangle {
                        width: 50
                        height: 50
                        radius: 25
                        color: "#25D366"
                        Layout.alignment: Qt.AlignVCenter

                        Text {
                            anchors.centerIn: parent
                            text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
                            color: "white"
                            font.bold: true
                            font.pixelSize: 18
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: name
                                font.pixelSize: 16
                                font.bold: true
                                color: "black"
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }

                            Text {
                                text: callTime
                                font.pixelSize: 12
                                color: "gray"
                                horizontalAlignment: Text.AlignRight
                            }
                        }

                        Text {
                            text: shortMessage
                            font.pixelSize: 14
                            color: "gray"
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: 1
                    color: "#dddddd"
                }
            }
        }
    }
}



// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15

// Rectangle {
//     id: whatsappPage
//     anchors.fill: parent
//     color: "white"

//     ColumnLayout {
//         anchors.fill: parent
//         spacing: 0
//         Rectangle {
//             id: headerBar
//             width: parent.width
//             height: 50
//             color: "light grey"

//             RowLayout {
//                 anchors.fill: parent
//                 anchors.margins: 8

//                 Button {
//                     text: "<"
//                     font.pixelSize: 18
//                     background: Rectangle { color: "black" }
//                     onClicked: pageLoader.source = "Frontpage.qml"
//                 }

//                 Label {
//                     text: "WhatsApp"
//                     font.pixelSize: 18
//                     font.bold: true
//                     color: "black"
//                     Layout.alignment: Qt.AlignVCenter
//                 }
//             }
//         }
//         ListView {
//             id: whatsappList
//             Layout.fillWidth: true
//             Layout.fillHeight: true
//             clip: true
//             model: modelManager.contactModel
//             spacing: 6

//             delegate: Item {
//                 width: whatsappList.width
//                 height: 70

//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: 10
//                     spacing: 12

//                     Rectangle {
//                         width: 50
//                         height: 50
//                         radius: 25
//                         color: "#25D366"
//                         Layout.alignment: Qt.AlignVCenter

//                         Text {
//                             anchors.centerIn: parent
//                             text: (name && name.length > 0) ? name.charAt(0).toUpperCase() : ""
//                             color: "white"
//                             font.bold: true
//                             font.pixelSize: 18
//                         }
//                     }

//                     ColumnLayout {
//                         Layout.fillWidth: true
//                         spacing: 4

//                         RowLayout {
//                             Layout.fillWidth: true

//                             Text {
//                                 text: name
//                                 font.pixelSize: 16
//                                 font.bold: true
//                                 color: "black"
//                                 elide: Text.ElideRight
//                                 Layout.fillWidth: true
//                             }

//                             Text {
//                                 text: callTime
//                                 font.pixelSize: 12
//                                 color: "gray"
//                                 horizontalAlignment: Text.AlignRight
//                             }
//                         }

//                         Text {
//                             text: shortMessage
//                             font.pixelSize: 14
//                             color: "gray"
//                             elide: Text.ElideRight
//                             Layout.fillWidth: true
//                         }
//                     }
//                 }

//                 Rectangle {
//                     anchors.left: parent.left
//                     anchors.right: parent.right
//                     anchors.bottom: parent.bottom
//                     height: 1
//                     color: "white"
//                 }
//             }
//         }
//     }
// }
