import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Login / Signup UI")
    id: background

    property bool showLoginForm: false
    property bool showSignupForm: false

    Rectangle {
        width: background.width * 0.6
        height: background.height * 0.9
        anchors.centerIn: parent
        radius: 10
        border.color: "black"
        color: "#f0f0f0"

        ScrollView {
            anchors.fill: parent

            Column {
                spacing: 10
                padding: 20
                width: parent.width
                Button {
                    text: "Login"
                    visible: !showLoginForm && !showSignupForm
                    onClicked: {
                        showLoginForm = true
                        showSignupForm = false
                    }
                }

                Button {
                    text: "Signup"
                    visible: !showLoginForm && !showSignupForm
                    onClicked: {
                        showSignupForm = true
                        showLoginForm = false
                    }
                }
                Column {
                    spacing: 10
                    visible: showLoginForm

                    Text {
                        text: "Login Form"
                        font.bold: true
                        font.pixelSize: 18
                    }

                    TextField {
                        id: loginUsername
                        placeholderText: "Username / Email"
                        width: parent.width
                    }

                    TextField {
                        id: loginPassword
                        placeholderText: "Password"
                        echoMode: TextInput.Password
                        width: parent.width
                    }
                    Button {
                        text: "Submit"
                        onClicked: {
                            if (studentHandler.login(loginUsername.text, loginPassword.text)) {
                                console.log(" Login Successful")
                            } else {
                                console.log(" Login Failed")
                            }
                        }
                    }


                    Button {
                        text: "Back"
                        onClicked: {
                            showLoginForm = false
                        }
                    }
                }

                Column {
                    spacing: 10
                    visible: showSignupForm

                    Text {
                        text: "Signup Form"
                        font.bold: true
                        font.pixelSize: 18
                    }

                    TextField {
                        id: studentName
                        placeholderText: "Student Name"
                        width: parent.width
                    }

                    TextField {
                        id: phoneNumber
                        placeholderText: "Phone Number"
                        width: parent.width
                    }

                    TextField {
                        id: fatherName
                        placeholderText: "Father's Name"
                        width: parent.width
                    }

                    TextField {
                        id: signupUsername
                        placeholderText: "Username / Email"
                        width: parent.width
                    }

                    TextField {
                        id: signupPassword
                        placeholderText: "Password"
                        echoMode: TextInput.Password
                        width: parent.width
                    }

                    TextField {
                        id: confirmPassword
                        placeholderText: "Confirm Password"
                        echoMode: TextInput.Password
                        width: parent.width
                    }

                    Button {
                        text: "Submit"
                        onClicked: {
                            if (signupPassword.text !== confirmPassword.text) {
                                console.log(" Passwords do not match!")
                            } else {
                                studentHandler.name = studentName.text
                                studentHandler.phone = phoneNumber.text
                                studentHandler.father = fatherName.text
                                studentHandler.username = signupUsername.text
                                studentHandler.password = signupPassword.text

                                if (studentHandler.signup()) {
                                    console.log(" Signup successful")
                                }
                            }
                        }
                    }
                    Button {
                        text: "Save"
                        onClicked: {
                            if (studentHandler) {
                                showSignupForm = true
                                console.log("Saved successfully")
                            }
                        }
                    }


                    Button {
                        text: "Back"
                        onClicked: {
                            showSignupForm = false
                        }
                    }
                }
            }
        }
    }
}
