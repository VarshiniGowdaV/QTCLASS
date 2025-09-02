
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

                    Row {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10
                        padding: 10

                        Rectangle {
                            width: 40
                            height: 40
                            radius: 20
                            color: "light blue"
                            Text {
                                anchors.centerIn: parent
                                text: name.charAt(0)
                                color: "white"
                                font.bold: true
                            }
                        }

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            Text { text: name; color: "white" }
                            Text {
                                text: number
                                color: "light grey"
                                visible: true
                            }
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
}


