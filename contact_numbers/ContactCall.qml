import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: callPage
    anchors.fill: parent
    color: "black"

    property string contactName: ""
    property string contactNumber: ""

    Column {
        anchors.centerIn: parent
        spacing: 30
        Rectangle {
            width: 120; height: 120
            radius: 60
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: contactName.length > 0 ? contactName.charAt(0) : "?"
                font.pixelSize: 48
                color: "white"
                font.bold: true
            }
        }

        Text {
            text: contactName
            color: "white"
            font.pixelSize: 28
            font.bold: true
        }

        Text {
            text: contactNumber
            color: "lightgrey"
            font.pixelSize: 20
        }

        Text {
            text: "Calling..."
            color: "green"
            font.pixelSize: 18
        }

        Row {
            spacing: 40
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                width: 120; height: 50
                text: "End"
                background: Rectangle {
                    color: "red"
                    radius: 25
                }
                contentItem: Text {
                    text: "End"
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    console.log("Call ended:", contactName)
                    pageLoader.source = "Phone_book.qml"
                }
            }
        }
    }
}
