import QtQuick
import QtQuick.Controls

Window {
    width: 500
    height: 850
    visible: true
    title: qsTr("Login / Signup UI")
    id: background

    property bool showLoginForm: false
    property bool showSignupForm: false

    Rectangle {
        width: background.width * 0.4
        height: background.height * 0.9
        anchors.centerIn: parent
        radius: 10
        border.color: "black"
        color: "light grey"

        Text {
            text: qsTr("Student Login")
            font.pixelSize: 24
            font.bold: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
        }

        Column {
            width: parent.width * 0.9
            spacing: 10
            anchors {
                top: parent.top
                topMargin: 60
                horizontalCenter: parent.horizontalCenter
            }

            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

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
            }

            Column {
                spacing: 10
                visible: showLoginForm
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "Login Form"
                    font.bold: true
                    font.pixelSize: 18
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: userlable
                    text: qsTr("UserName")
                }
                TextField {
                    id: loginUsername
                    placeholderText: "Username / Email"
                    width: parent.width * 0.9
                }
                Text {
                    id: passwordlable
                    text: qsTr("Password")
                }
                TextField {
                    id: loginPassword
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                    width: parent.width * 0.9
                }

                Button {
                    text: "Submit"
                    onClicked: {
                        if (studentHandler.login(loginUsername.text, loginPassword.text)) {
                            console.log("Login Successful")
                        } else {
                            console.log("Login Failed")
                        }
                    }
                }

                Button {
                    text: "Back"
                    onClicked: showLoginForm = false
                }
            }

            Column {
                spacing: 10
                visible: showSignupForm
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "Signup Form"
                    font.bold: true
                    font.pixelSize: 18
                }
                Text {
                    id: studentNamelable
                    text: qsTr("StudentName")
                }
                TextField {
                    id: studentName
                    placeholderText: "Student Name"
                    width: parent.width * 0.9
                }
                Text {
                    id: studentPhoneNumberlable
                    text: qsTr("Student Phone Number")
                }
                TextField {
                    id: phoneNumber
                    placeholderText: "Phone Number"
                    width: parent.width * 0.9
                }
                Text {
                    id: fatherNamelable
                    text: qsTr("FatherName")
                }
                TextField {
                    id: fatherName
                    placeholderText: "Father's Name"
                    width: parent.width * 0.9
                }
                Text {
                    id: usernamelable
                    text: qsTr("UserName/Emailid")
                }
                TextField {
                    id: signupUsername
                    placeholderText: "Username / Email"
                    width: parent.width * 0.9
                }
                Text {
                    id: passwordslable
                    text: qsTr("Password")
                }
                TextField {
                    id: signupPassword
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                    width: parent.width * 0.9
                }
                Text {
                    id: confirmpasswordlable
                    text: qsTr("ConfirmPassword")
                }
                TextField {
                    id: confirmPassword
                    placeholderText: "Confirm Password"
                    echoMode: TextInput.Password
                    width: parent.width * 0.9
                }

                Button {
                    text: "Submit"
                    onClicked: {
                        studentHandler.name = studentName.text
                        studentHandler.phone = phoneNumber.text
                        studentHandler.father = fatherName.text
                        studentHandler.username = signupUsername.text
                        studentHandler.password = signupPassword.text
                        studentHandler.confirmPassword = confirmPassword.text

                        let result = studentHandler.signup()
                        if (result === "") {
                            console.log("Signup successful")
                        } else {
                            console.log("Signup failed: " + result)
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
                    onClicked: showSignupForm = false
                }
            }
        }
    }
}


