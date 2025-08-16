import QtQuick
import QtQuick.Controls

Rectangle {
        id: registerPage
        anchors.fill: parent
        color: "lightgrey"

        ListView {
                id: studentListView
                interactive: true
                model: Login
                delegate: myComponent
                header: headerComponent
                clip : true
                anchors.fill: parent
                spacing: 5
        }

        Component {
            id: headerComponent
            Header {
                // width: parent.width
                // height: 50
            }
        }

        Component {
                id: myComponent

                Rectangle {
                        id: background
                        width: parent.width
                        height: 50
                        color: "lightgrey"
                        border.color: "black"

                        Row {
                                spacing: 10
                                // anchors.centerIn: parent
                                anchors.verticalCenter: parent.verticalCenter

                                Text {
                                        id: stuName1
                                        text: model.index + 1
                                }

                                Text {
                                        id: stuName
                                        text: userName
                                }

                                Text {
                                        id: stuPhone
                                        text: phoneNumber
                                }

                                Text {
                                        id: stuFather
                                        text: fatherName
                                }

                                Text {
                                        id: stuEmail
                                        text: email
                                }

                                // Text {
                                //         id: stuPassword
                                //         text: password
                                // }

                                // Text {
                                //         id: stuConfirmPassword
                                //         text: confirmPassword
                                // }
                        }
                }
        }
}
