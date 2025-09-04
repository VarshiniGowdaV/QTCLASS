import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: addContactPage
    anchors.fill: parent
    color: "#F5F5F5"

    Column {
        anchors.fill: parent
        spacing: 20
        padding: 20
        Row {
            width: parent.width
            spacing: 10
            height: 40

            Button {
                text: "<"
                onClicked: {
                    pageLoader.source = "Phone_book_list.qml"
                }
            }

            Label {
                text: "Add Contact"
                font.pixelSize: 18
                font.bold: true
                color: "black"
            }
        }
        Rectangle {
            width: 150
            height: 150
            radius: width / 2
            color: "white"
            border.color: "gray"
            border.width: 3
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: profilePic
                anchors.fill: parent
                anchors.margins: 6
                fillMode: Image.PreserveAspectCrop
                source: imageField.text !== "" ? imageField.text : "qrc:/default_profile.png"
                clip: true
            }
        }
        Column {
            spacing: 15
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.9

            TextField {
                id: nameField
                placeholderText: "Enter Name"
                width: parent.width
            }

            TextField {
                id: numberField
                placeholderText: "Enter Number"
                inputMethodHints: Qt.ImhDigitsOnly
                width: parent.width
            }
        }
        Button {
            text: "Save Contact"
            width: parent.width * 0.9
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("Contact Saved:", nameField.text, numberField.text)
                pageLoader.source = "Phone_Book_Page.qml"
            }
        }
    }
}
