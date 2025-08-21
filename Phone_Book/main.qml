import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    width: 550
    height: 1000
    visible: true
    title: "PhoneBook"

    ListModel {
        id: contactModel
    }

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "ContactList.qml"
        onLoaded: {
            if (pageLoader.item) {
                pageLoader.item.model = contactModel
            }
        }
    }

    Connections {
        target: pageLoader.item
        function onAddContactRequested() {
            pageLoader.source = "AddContact.qml"
            pageLoader.onLoaded.connect(() => pageLoader.item.model = contactModel)
        }
        function onBackRequested() {
            pageLoader.source = "ContactList.qml"
            pageLoader.onLoaded.connect(() => pageLoader.item.model = contactModel)
        }
        function onContactAdded(name, phone) {
            contactModel.append({ "name": name, "phone": phone })
            pageLoader.source = "ContactList.qml"
            pageLoader.onLoaded.connect(() => pageLoader.item.model = contactModel)
        }
    }
}


// import QtQuick
// import QtQuick.Controls
// import "./" // Import the current directory to access AddContact.qml and ContactList.qml

// ApplicationWindow {
//     visible: true
//     width: 400
//     height: 600
//     title: "PhoneBook"
//     color: "black"

//     ListModel {
//         id: contactModel
//     }

//     Loader {
//         id: pageLoader
//         anchors.fill: parent
//         sourceComponent: contactListPage
//     }

//     Component {
//         id: contactListPage
//        ContactList
//         {
//             model: contactModel
//             onAddContact: pageLoader.sourceComponent = addContactPage
//         }
//     }

//     Component {
//         id: addContactPage
//         AddContact
//         {
//             model: contactModel
//             onBack: pageLoader.sourceComponent = contactListPage
//         }
//     }
// }

// import QtQuick
// import QtQuick.Controls

// Window {
//     width: 400
//     height: 600
//     visible: true
//     title: "PhoneBook"
//     color: "black"
//     TextField {
//         id: searchField
//         text: "Search contacts"
//         anchors.top: parent.top
//         anchors.left: parent.left
//         anchors.right: parent.right
//         height: 50
//         color: "white"

//         background: Rectangle {
//             color: "black"
//             border.color: "grey"
//             radius: 5
//         }

//         font.pixelSize: 16

//         onTextChanged: {
//             filterContacts(text)
//         }
//     }
//     Rectangle {
//         id: addContact
//         width: parent.width
//         height: 60
//         color: "#222"
//         anchors.bottom: parent.bottom

//         Button {
//             anchors.centerIn: parent
//             text: "Add Contact"
//             onClicked: {
//                 console.log("Add Contact clicked")
//             }
//         }
//     }
//     function filterContacts(query) {
//         console.log("Filtering contacts for:", query)
//     }
// }

