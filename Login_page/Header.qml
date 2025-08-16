import QtQuick

Rectangle {
    id: background
    width: parent.width
    height: 50
    color: "DarkGrey"
    border.color: "Black"
    z: 2

    Row {
        spacing:  20
        // anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: stuNo
            text: "Stu Number"
            font.bold: true
        }

        Text {
            id: stuName
            text: "Student Name"
            font.bold: true
        }

        Text {
            id: stuPhone
            text: "Phone Number"
            font.bold: true
        }

        Text {
            id: stuFather
            text: "Father Name"
            font.bold: true
        }

        Text {
            id: stuEmail
            text: "Email"
            font.bold: true

        }
    }
}
