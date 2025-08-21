import QtQuick
import QtQuick.Controls

Item {
    property var model
    signal back()

    Column {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: nameField
            placeholderText: "Enter Name"
            width: parent.width
        }

        TextField {
            id: phoneField
            placeholderText: "Enter Phone"
            width: parent.width
            inputMethodHints: Qt.ImhDigitsOnly
        }

        TextField {
            placeholderText: "Type 'save' and press Enter"
            width: parent.width
            onAccepted: {
                if (text.toLowerCase() === "save" &&
                    nameField.text !== "" && phoneField.text !== "") {
                    model.append({ "name": nameField.text, "phone": phoneField.text })
                    nameField.text = ""
                    phoneField.text = ""
                    back()
                }
                text = ""
            }
        }

        TextField {
            placeholderText: "Type 'back' and press Enter"
            width: parent.width
            onAccepted: {
                if (text.toLowerCase() === "back") {
                    back()
                }
                text = ""
            }
        }
    }
}

// import QtQuick
// import QtQuick.Controls

// Item {
//     property var model
//     signal back()

//     Column {
//         anchors.fill: parent
//         spacing: 10

//         TextField {
//             id: nameField
//             placeholderText: "Enter Name"
//             width: parent.width
//         }

//         TextField {
//             id: phoneField
//             placeholderText: "Enter Phone"
//             width: parent.width
//             inputMethodHints: Qt.ImhDigitsOnly
//         }

//         TextField {
//             placeholderText: "Type 'save' and press Enter"
//             width: parent.width
//             onAccepted: {
//                 if (text.toLowerCase() === "save" &&
//                     nameField.text !== "" && phoneField.text !== "") {
//                     model.append({ "name": nameField.text, "phone": phoneField.text })
//                     nameField.text = ""
//                     phoneField.text = ""
//                     back()
//                 }
//                 text = ""
//             }
//         }

//         TextField {
//             placeholderText: "Type 'back' and press Enter"
//             width: parent.width
//             onAccepted: {
//                 if (text.toLowerCase() === "back") {
//                     back()
//                 }
//                 text = ""
//             }
//         }
//     }
// }


