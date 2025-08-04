import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Student Registration and Login"

    property bool showRegister: true

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: showRegister ? "Register View" : "Login View"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        // Registration View
        Column {
            visible: showRegister
            spacing: 10
            width: parent.width * 0.8

            TextField {
                id: studentNameField
                placeholderText: "Student Name"
            }

            TextField {
                id: phoneField
                placeholderText: "Phone Number (10 digits)"
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /^[0-9]{10}$/ }
            }

            TextField {
                id: fatherNameField
                placeholderText: "Father Name"
            }

            TextField {
                id: emailField
                placeholderText: "Email"
                validator: RegExpValidator { regExp: /^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$/ }
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
            }

            TextField {
                id: confirmPasswordField
                placeholderText: "Confirm Password"
                echoMode: TextInput.Password
            }

            Row {
                spacing: 10

                Button {
                    text: "Submit"
                    onClicked: {
                        if (passwordField.text !== confirmPasswordField.text) {
                            console.log("Passwords do not match")
                        } else {
                            console.log("Registered:", studentNameField.text)
                        }
                    }
                }

                Button {
                    text: "Clear"
                    onClicked: {
                        studentNameField.text = ""
                        phoneField.text = ""
                        fatherNameField.text = ""
                        emailField.text = ""
                        passwordField.text = ""
                        confirmPasswordField.text = ""
                    }
                }

                Button {
                    text: "Cancel"
                    onClicked: Qt.quit()
                }
            }
        }

        // Login View
        Column {
            visible: !showRegister
            spacing: 10
            width: parent.width * 0.8

            TextField {
                id: loginEmail
                placeholderText: "Username / Email"
            }

            TextField {
                id: loginPassword
                placeholderText: "Password"
                echoMode: TextInput.Password
            }

            Button {
                text: "Sign In"
                onClicked: console.log("Login attempt:", loginEmail.text)
            }
        }

        // Toggle between views
        Button {
            text: showRegister ? "Switch to Login" : "Switch to Register"
            onClicked: showRegister = !showRegister
        }
    }
}
