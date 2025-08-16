import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: registerPage
    anchors.fill: parent
    color: "lightgrey"

    // signal submitButtonClicked(string userName, string phoneNumber, string fatherName, string email,
    //                            string password, string confirmPassword)
    signal cancelButtonClicked()

    Column{
        id: columnLayout
        spacing:  10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent

        Text {
            id: studentName
            text: qsTr("Student Name")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: studentNameText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Student Name"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator:  RegularExpressionValidator {
                regularExpression: /^[a-zA-Z ]+$/
            }
        }


        Text {
            id: phoneNumber
            text: qsTr("Phone Number")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: phoneNumberText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Phone Number"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator: RegularExpressionValidator {
                regularExpression: /^[0-9]{10}+$/
            }
        }



        Text {
            id: fatherName
            text: qsTr("Father Name")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: fathereNameText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Father Name"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            validator:  RegularExpressionValidator {
                regularExpression: /^[a-zA-Z ]+$/
            }
        }


        Text {
            id: email
            text: qsTr("Email Id")
            color: "Black"
            font.bold: true
            font.pixelSize: 18
        }
        TextField{
            id: emailText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Email Id"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            onEditingFinished: {
                        if (!emailText.text.includes("@") || !emailText.text.includes(".com")) {
                            emailText.color = "red"
                            console.log("Invalid email format")
                        } else {
                            emailText.color = "white"
                        }
                    }
        }

        Text {
            id: password
            text: qsTr("Password")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: passwordText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Password"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            echoMode: TextInput.Password
        }

        Text {
            id: confirmPassword
            text: qsTr("Confirm Password")
            color: "Black"
            font.pixelSize: 18
            font.bold: true
        }
        TextField{
            id: confirmPasswordText
            width: registerPage.width / 2
            height: 50
            placeholderText: "Enter Confirm Password"
            placeholderTextColor: "White"
            font.pixelSize: 14
            color: "White"
            echoMode: TextInput.Password
        }

        Row{
            id: rowLayout
            spacing: 60

            Button{
                id: cancelButton
                width: registerPage.width / 5
                height: 50

                Text {
                    id: cancel
                    text: qsTr("Cancel")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 14
                    color: "Black"
                }

                onClicked: {
                    console.log("Cancel Button Cicked")
                    cancelButtonClicked()
                }

                background: Rectangle{
                    color: cancelButton.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: cancelButton
                    border.color: "Black"
                    border.width: 2
                    radius: 180
                }
            }

            Button{
                id: clearButton
                width: registerPage.width / 5
                height: 50

                Text {
                    id: clear
                    text: qsTr("Clear")
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 14
                    color: "Black"
                }

                onClicked: {
                    console.log("Clear Button Cicked")

                    studentNameText.text = ""
                    phoneNumberText.text = ""
                    fathereNameText.text = ""
                    emailText.text = ""
                    passwordText.text = ""
                    confirmPasswordText.text = ""
                }

                background: Rectangle{
                    color: clearButton.pressed ? "#5A5A5A" : "transparent"
                    anchors.fill: clearButton
                    border.color: "Black"
                    border.width: 2
                    radius: 180
                }
            }
        }
        Button{
            id: submitButton
            width: registerPage.width / 4
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: submit
                text: qsTr("Submit")
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 14
                color: "Black"
            }

            onClicked: {
                console.log("Submit Button Cicked")
                // submitButtonClicked (
                //             studentNameText.text,
                //             phoneNumberText.text,
                //             fathereNameText.text,
                //             emailText.text,
                //             passwordText.text,
                //             confirmPasswordText.text)

                Login.addStudent(studentNameText.text,
                                 phoneNumberText.text,
                                 fathereNameText.text,
                                 emailText.text,
                                 passwordText.text,
                                 confirmPasswordText.text)
            }

            background: Rectangle{
                color: submitButton.pressed ? "#5A5A5A" : "transparent"
                anchors.fill: submitButton
                border.color: "Black"
                border.width: 2
                radius: 180
            }
        }
    }
}
