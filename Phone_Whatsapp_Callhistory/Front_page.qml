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
                color: "white"
                border.color: "black"
                border.width: 2

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelManager.createCallHistory()
                        pageLoader.source = "Call_history_list.qml"
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "📞 Call\nHistory"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                width: 100; height: 100
                radius: width / 2
                color: "white"
                border.color: "black"
                border.width: 2

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelManager.createPhoneBook()
                        pageLoader.source = "Phone_book_list.qml"
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "👤 Phone\nBook"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Rectangle {
            width: 100; height: 100
            radius: width / 2
            color: "white"
            border.color: "black"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    modelManager.createWhatsApp()
                    pageLoader.source = "Whatsapp_list.qml"
                }
            }

            Text {
                anchors.centerIn: parent
                text: "💬 WhatsApp"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}

