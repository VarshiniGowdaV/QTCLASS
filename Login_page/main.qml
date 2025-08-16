import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id: mainWindow
    width: 550
    height: 1000
    visible: true
    title: qsTr("Registraction Aplication")


    Loader {
        id: pageLoader
        width: 600
        height: mainWindow.height
        anchors.centerIn: parent
        source: "HomePage.qml"
    }

    Connections{
        target: pageLoader.item

        function onSignInClicked() {
            pageLoader.source = "LoginPage.qml"
        }

        function onSignUpClicked() {
            pageLoader.source = "RegisterPage.qml"
        }

        function onStudentDataListClicked() {
            pageLoader.source = "StudentDataList.qml"
        }

        // function onSubmitButtonClicked(){
        // }

        function onCancelButtonClicked() {
            pageLoader.source = "HomePage.qml"
        }

        function onBackButtonClicked() {
            pageLoader.source = "HomePage.qml"
        }

    }

    Connections{
        target: Login

        onRegistrationSuccess: {
            console.log("Student Registration Success")
            pageLoader.source = "LoginPage.qml"
        }

        onLoginSuccess: {
            console.log("Login Success")
            pageLoader.source = ""
        }
    }

}
