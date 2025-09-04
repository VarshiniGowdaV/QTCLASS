


import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: phoneBookPage
    anchors.fill: parent
    color: "#1A1A1A"

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        Row {
            width: parent.width
            height: 50
            spacing: 10

            Button {
                text: "<"
                width: 40
                height: 40
                onClicked: pageLoader.source = "Frontpage.qml"
                background: Rectangle {
                    color: "grey"
                    radius: 20
                }
                contentItem: Text {
                    text: "<"
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Label {
                text: "Phone Book"
                color: "white"
                font.bold: true
                verticalAlignment: Label.AlignVCenter
                horizontalAlignment: Label.AlignLeft
            }
        }

        TextField {
            id: searchBar
            width: parent.width
            placeholderText: "Search contacts"
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                color: "grey"
                radius: 8
            }
            color: "white"
            placeholderTextColor: "light grey"
        }

        ListView {
            id: phoneBookList
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height - 200
            spacing: 8
            clip: true
            model: modelManager.contactModel

            delegate: Rectangle {
                id: contactDelegate
                width: parent.width
                height: 60
                color: "grey"
                radius: 6

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        profileName.text = name
                        profileNumber.text = number
                        bottomSheet.visible = true
                    }
                }

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Rectangle {
                        width: 40
                        height: 40
                        radius: 20
                        color: "lightblue"
                        Text {
                            anchors.centerIn: parent
                            text: name.charAt(0)
                            color: "white"
                            font.bold: true
                        }
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2
                        Text { text: name; color: "white" }
                    }
                }

                // Call icon
                Image {
                    source: "Images/Call.png"
                    width: 32
                    height: 32
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 12
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Calling:", number)
                            pageLoader.source = "ContactCall.qml"
                            pageLoader.item.contactName = name
                            pageLoader.item.contactNumber = number
                        }
                    }
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                text: "Add"
                onClicked: pageLoader.source = "Add_Contact.qml"
                background: Rectangle {
                    color: "grey"
                    radius: 8
                }
                contentItem: Text {
                    text: "Add"
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    Rectangle {
        id: bottomSheet
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.4
        visible: false
        radius: 20
        color: "#2A2A2A"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Rectangle {
                width: 80; height: 80
                radius: 40
                color: "lightblue"
                Text {
                    anchors.centerIn: parent
                    text: profileName.text.charAt(0)
                    font.pixelSize: 28
                    color: "white"
                }
            }

            Text {
                id: profileName
                text: ""
                color: "white"
                font.pixelSize: 20
                font.bold: true
            }

            Text {
                id: profileNumber
                text: ""
                color: "lightgrey"
                font.pixelSize: 16
            }

            Row {
                spacing: 15
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Edit"
                    onClicked: {
                        console.log("Edit", profileName.text)
                    }
                }
                Button {
                    text: "Delete"
                    onClicked: {
                        console.log("Delete", profileName.text)
                        bottomSheet.visible = false
                    }
                }
                Button {
                    text: "Close"
                    onClicked: bottomSheet.visible = false
                }
            }
        }
    }
}

