
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: homePage
    anchors.fill: parent
    color: "light grey"

    Column {
        anchors.centerIn: parent
        spacing: 40

        Row {
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                width: 100; height: 100
                radius: width / 2
                color: "grey"
                border.color: "black"
                border.width: 2

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelManager.createCallHistory()
                        pageLoader.source = "Call_History.qml"
                    }
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 6

                    Image {
                        source: "Images/callhistory.png"
                        width: 60
                        height: 60
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        // text: "📞 Call\nHistory"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }
            }
            Rectangle {
                width: 100; height: 100
                radius: width / 2
                color: "grey"
                border.color: "black"
                border.width: 2

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelManager.createPhoneBook()
                        pageLoader.source = "Phone_book.qml"
                    }
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 6

                    Image {
                        source: "Images/phonebook.png"
                        width: 60
                        height: 60
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        // text: "👤 Phone\nBook"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 12
                    }
                }
            }
        }

        Rectangle {
            width: 100
            height: 100
            radius: width / 2
            color: "grey"
            border.color: "black"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    modelManager.createWhatsApp()
                    pageLoader.source = "Whats_app.qml"
                }
            }

            Column {
                anchors.centerIn: parent
                spacing: 6

                Image {
                    source: "Images/whatsapp.png"
                    width: 60
                    height: 60
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    // text: "💬 WhatsApp"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 12
                }
            }
        }
    }
}

