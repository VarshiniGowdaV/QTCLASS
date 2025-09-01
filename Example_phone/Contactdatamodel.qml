import QtQuick
import QtQuick.Controls

Rectangle {
    id: dataDisplay

    signal backButtonClicked()

    ListView {
        width: parent.width
        height: parent.height
        model: Data
        delegate: myComponent
        // interactive: true
        spacing:  10
    }

    Component {
        id: myComponent

        Rectangle {
            width: dataDisplay.width / 2
            height: 50

            Row {
                spacing: 50
                Text {
                    id: namelabel
                    text: "Name : " + contactName
                }

                Text {
                    id: numberLabel
                    text: "Number : " + contactNumber
                }
            }
        }
    }

    Button {
        width: 400
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text:  "Back"
        onClicked:  {
            backButtonClicked()
            console.log("Back Button Clicked")
        }
    }
}
