import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: parent.width
    height: parent.height

    // property var contactNameList: []
    // property var contactPhoneNumberList: []

    // signal sendData(var contactNameList , var contactPhoneNumberList)
    signal viewContactButtonClicked()


    Column {
        anchors.centerIn: parent
        spacing: 20


        TextField {
            id: name
            width: 400
            height: 50
            placeholderText: "Name"
        }

        TextField {
            id: phoneNumber
            width: 400
            height: 50
            placeholderText: "PhoneNumber"
        }

        Button {
            width: 400
            height: 50
            text: "Submit"
            onClicked:  {
                Data.addContact(name.text, phoneNumber.text)
                // submitButtonClicked()
                // sendData(contactNameList, contactPhoneNumberList)
                console.log("Submit Clicked")
            }
        }

        Button {
            width: 400
            height: 50
            text: "View Contact Data "
            onClicked:  {
                viewContactButtonClicked()
                console.log("View Contact Button Clicked")
            }
        }
    }

    // function submitButtonClicked() {
    //     contactNameList.push(name.displayText)
    //     contactPhoneNumberList.push(phoneNumber.displayText)
    //     list.nameList = contactNameList
    //     list.numberList = contactPhoneNumberList
    //     console.log("name :" + contactNameList )
    //     console.log("PhoneNumber :" + contactPhoneNumberList )
    // }
}
