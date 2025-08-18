import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Contact UI"
    color: "black"

    // JavaScript array to manage contacts with name and phone
    property var contacts: []

    // Persistent storage for contacts
    Settings {
        id: appSettings
        property var savedContacts: []
    }

    // State for showing/hiding the add contact form
    property bool showAddForm: false
    property string selectedContact: ""

    // Function to add or update a contact
    function addOrUpdateContact(firstName, surname, company, phone) {
        var fullName = firstName + (surname ? " " + surname : "")
        var contactExists = false
        for (var i = 0; i < contacts.length; i++) {
            if (contacts[i].name === fullName) {
                contacts[i].phone = phone
                contactExists = true
                break
            }
        }
        if (!contactExists && fullName) {
            contacts.push({ name: fullName, phone: phone })
        }

        // Sort contacts alphabetically by name
        contacts.sort(function(a, b) {
            return a.name.localeCompare(b.name)
        })

        // Update the ListView and save
        contactList.model = contacts
        appSettings.savedContacts = contacts

        // Reset form
        firstNameField.text = ""; surnameField.text = ""; companyField.text = ""; phoneField.text = ""
        showAddForm = false
    }

    // Search bar
    TextField {
        id: searchField
        placeholderText: "Search contacts"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        background: Rectangle { color: "black"; border.color: "gray"; radius: 5 }
        placeholderTextColor: "#999"
        color: "white"
        font.pixelSize: 16
        onTextChanged: filterContacts()
    }

    // ListView for contacts
    ListView {
        id: contactList
        anchors.top: searchField.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: contacts
        delegate: Item {
            width: parent.width
            height: 60
            Row {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 10
                Rectangle {
                    width: 30
                    height: 30
                    radius: 15
                    color: {
                        var firstChar = modelData.name.charAt(0).toUpperCase()
                        switch (firstChar) {
                        case "A": return "red"
                        case "M": return "teal"
                        case "P": return "blue"
                        default: return "green"
                        }
                    }
                    Text {
                        text: modelData.name.charAt(0).toUpperCase()
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                        font.pixelSize: 14
                    }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 2
                    Text {
                        text: modelData.name
                        color: "white"
                        font.pixelSize: 18
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                selectedContact = modelData.name
                                var nameParts = selectedContact.split(" ")
                                firstNameField.text = nameParts[0] || ""
                                surnameField.text = nameParts.slice(1).join(" ") || ""
                                companyField.text = ""
                                phoneField.text = modelData.phone || ""
                                showAddForm = true
                            }
                        }
                    }
                    // Phone number hidden, only name is shown
                }
            }
        }
        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AlwaysOn }
        visible: !showAddForm
    }

    // Add contact form
    Rectangle {
        id: addForm
        visible: showAddForm
        anchors.top: searchField.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "black"

        // Header
        Rectangle {
            id: formHeader
            width: parent.width
            height: 60
            color: "black"
            Row {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                spacing: 10
                Text {
                    text: "Create contact"
                    color: "white"
                    font.pixelSize: 20
                    anchors.verticalCenter: parent.verticalCenter
                }
                Item { width: parent.width - 120; height: 1 }
                Button {
                    text: "Save"
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle { color: "blue"; radius: 5 }
                    onClicked: addOrUpdateContact(firstNameField.text, surnameField.text, companyField.text, phoneField.text)
                }
            }
        }

        // Form content
        Column {
            anchors.top: formHeader.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            spacing: 10
            Rectangle {
                width: 80
                height: 80
                radius: 40
                color: "grey"
                anchors.horizontalCenter: parent.horizontalCenter
                Text { text: "Add picture"; color: "white"; anchors.centerIn: parent }
                MouseArea { anchors.fill: parent; onClicked: console.log("Add picture clicked") }
            }
            TextField {
                id: firstNameField
                placeholderText: "First name"
                width: parent.width
                background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
                color: "white"
                placeholderTextColor: "#999"
                font.pixelSize: 16
            }
            TextField {
                id: surnameField
                placeholderText: "Surname"
                width: parent.width
                background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
                color: "white"
                placeholderTextColor: "#999"
                font.pixelSize: 16
            }
            TextField {
                id: companyField
                placeholderText: "Company"
                width: parent.width
                background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
                color: "white"
                placeholderTextColor: "#999"
                font.pixelSize: 16
            }
            TextField {
                id: phoneField
                placeholderText: "Phone (Mobile)"
                width: parent.width
                background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
                color: "white"
                placeholderTextColor: "#999"
                font.pixelSize: 16
                inputMask: "+99 999 999 9999;_"
                text: "+91 "
            }
            Row {
                spacing: 10
                Button {
                    text: "Add phone"
                    background: Rectangle { color: "grey"; radius: 5 }
                    onClicked: console.log("Add phone clicked")
                }
                Button {
                    text: "Add email"
                    background: Rectangle { color: "grey"; radius: 5 }
                    onClicked: console.log("Add email clicked")
                }
            }
            Button {
                text: "Add birthday"
                background: Rectangle { color: "grey"; radius: 5 }
                onClicked: console.log("Add birthday clicked")
            }
            Button {
                text: "Save"
                background: Rectangle { color: "grey"; radius: 5 }
                onClicked: addOrUpdateContact(firstNameField.text, surnameField.text, companyField.text, phoneField.text)
            }
            Button {
                text: "Back"
                background: Rectangle { color: "grey"; radius: 5 }
                onClicked: showAddForm = false
            }
        }
    }

    // Add button
    Rectangle {   // Using Rectangle instead of RoundButton for simplicity
        id: addButton
        width: 50
        height: 50
        radius: 25
        color: "#45b7d1"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        Text {
            text: "+"
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 30
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                selectedContact = ""
                firstNameField.text = ""; surnameField.text = ""; companyField.text = ""; phoneField.text = ""
                showAddForm = true
            }
        }
    }

    // Function to filter contacts
    function filterContacts() {
        var searchText = searchField.text.toLowerCase()
        var filteredContacts = contacts.filter(function(contact) {
            return contact.name.toLowerCase().indexOf(searchText) !== -1
        })

        // Sort filtered contacts alphabetically
        filteredContacts.sort(function(a, b) {
            return a.name.localeCompare(b.name)
        })

        contactList.model = filteredContacts
    }

    Component.onCompleted: {
        contacts = appSettings.savedContacts || []
        // Sort contacts on load
        contacts.sort(function(a, b) { return a.name.localeCompare(b.name) })
        contactList.model = contacts
    }
}



// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import Qt.labs.settings 1.1

// ApplicationWindow {
//     visible: true
//     width: 400
//     height: 600
//     title: "Contact UI"
//     color: "black"

//     // JavaScript array to manage contacts with name and phone
//     property var contacts: []

//     // Persistent storage for contacts
//     Settings {
//         id: appSettings
//         property var savedContacts: []
//     }

//     // State for showing/hiding the add contact form
//     property bool showAddForm: false
//     property string selectedContact: ""

//     // Function to add or update a contact
//     function addOrUpdateContact(firstName, surname, company, phone) {
//         var fullName = firstName + (surname ? " " + surname : "")
//         var contactExists = false
//         for (var i = 0; i < contacts.length; i++) {
//             if (contacts[i].name === fullName) {
//                 contacts[i].phone = phone
//                 contactExists = true
//                 break
//             }
//         }
//         if (!contactExists && fullName) {
//             contacts.push({ name: fullName, phone: phone })
//         }

//         // Sort contacts alphabetically by name
//         contacts.sort(function(a, b) {
//             return a.name.localeCompare(b.name)
//         })

//         // Update the ListView and save
//         contactList.model = contacts
//         appSettings.savedContacts = contacts

//         // Reset form
//         firstNameField.text = ""; surnameField.text = ""; companyField.text = ""; phoneField.text = ""
//         showAddForm = false
//     }

//     // Search bar
//     TextField {
//         id: searchField
//         placeholderText: "Search contacts"
//         anchors.top: parent.top
//         anchors.left: parent.left
//         anchors.right: parent.right
//         height: 50
//         background: Rectangle { color: "black"; border.color: "gray"; radius: 5 }
//         placeholderTextColor: "#999"
//         color: "white"
//         font.pixelSize: 16
//         onTextChanged: filterContacts()
//     }

//     // ListView for contacts
//     ListView {
//         id: contactList
//         anchors.top: searchField.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         model: contacts
//         delegate: Item {
//             width: parent.width
//             height: 60
//             Row {
//                 anchors.verticalCenter: parent.verticalCenter
//                 anchors.left: parent.left
//                 anchors.leftMargin: 10
//                 spacing: 10
//                 Rectangle {
//                     width: 30
//                     height: 30
//                     radius: 15
//                     color: {
//                         var firstChar = modelData.name.charAt(0).toUpperCase()
//                         switch (firstChar) {
//                         case "A": return "red"
//                         case "M": return "teal"
//                         case "P": return "blue"
//                         default: return "green"
//                         }
//                     }
//                     Text {
//                         text: modelData.name.charAt(0).toUpperCase()
//                         anchors.centerIn: parent
//                         color: "white"
//                         font.bold: true
//                         font.pixelSize: 14
//                     }
//                 }
//                 Column {
//                     anchors.verticalCenter: parent.verticalCenter
//                     spacing: 2
//                     Text {
//                         text: modelData.name
//                         color: "white"
//                         font.pixelSize: 18
//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 selectedContact = modelData.name
//                                 var nameParts = selectedContact.split(" ")
//                                 firstNameField.text = nameParts[0] || ""
//                                 surnameField.text = nameParts.slice(1).join(" ") || ""
//                                 companyField.text = ""
//                                 phoneField.text = modelData.phone || ""
//                                 showAddForm = true
//                             }
//                         }
//                     }
//                     // Phone number hidden, only name is shown
//                 }
//             }
//         }
//         ScrollBar.vertical: ScrollBar { policy: ScrollBar.AlwaysOn }
//         visible: !showAddForm
//     }

//     // Add contact form
//     Rectangle {
//         id: addForm
//         visible: showAddForm
//         anchors.top: searchField.bottom
//         anchors.left: parent.left
//         anchors.right: parent.right
//         anchors.bottom: parent.bottom
//         color: "black"

//         // Header
//         Rectangle {
//             id: formHeader
//             width: parent.width
//             height: 60
//             color: "black"
//             Row {
//                 anchors.fill: parent
//                 anchors.leftMargin: 10
//                 anchors.rightMargin: 10
//                 spacing: 10
//                 Text {
//                     text: "Create contact"
//                     color: "white"
//                     font.pixelSize: 20
//                     anchors.verticalCenter: parent.verticalCenter
//                 }
//                 Item { width: parent.width - 120; height: 1 }
//                 Button {
//                     text: "Save"
//                     anchors.verticalCenter: parent.verticalCenter
//                     background: Rectangle { color: "blue"; radius: 5 }
//                     onClicked: addOrUpdateContact(firstNameField.text, surnameField.text, companyField.text, phoneField.text)
//                 }
//             }
//         }

//         // Form content
//         Column {
//             anchors.top: formHeader.bottom
//             anchors.left: parent.left
//             anchors.right: parent.right
//             anchors.bottom: parent.bottom
//             anchors.margins: 10
//             spacing: 10
//             Rectangle {
//                 width: 80
//                 height: 80
//                 radius: 40
//                 color: "grey"
//                 anchors.horizontalCenter: parent.horizontalCenter
//                 Text { text: "Add picture"; color: "white"; anchors.centerIn: parent }
//                 MouseArea { anchors.fill: parent; onClicked: console.log("Add picture clicked") }
//             }
//             TextField {
//                 id: firstNameField
//                 placeholderText: "First name"
//                 width: parent.width
//                 background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
//                 color: "white"
//                 placeholderTextColor: "#999"
//                 font.pixelSize: 16
//             }
//             TextField {
//                 id: surnameField
//                 placeholderText: "Surname"
//                 width: parent.width
//                 background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
//                 color: "white"
//                 placeholderTextColor: "#999"
//                 font.pixelSize: 16
//             }
//             TextField {
//                 id: companyField
//                 placeholderText: "Company"
//                 width: parent.width
//                 background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
//                 color: "white"
//                 placeholderTextColor: "#999"
//                 font.pixelSize: 16
//             }
//             TextField {
//                 id: phoneField
//                 placeholderText: "Phone (Mobile)"
//                 width: parent.width
//                 background: Rectangle { color: "black"; border.color: "grey"; radius: 5 }
//                 color: "white"
//                 placeholderTextColor: "#999"
//                 font.pixelSize: 16
//                 inputMask: "+99 999 999 9999;_"
//                 text: "+91 "
//             }
//             Row {
//                 spacing: 10
//                 Button {
//                     text: "Add phone"
//                     background: Rectangle { color: "grey"; radius: 5 }
//                     onClicked: console.log("Add phone clicked")
//                 }
//                 Button {
//                     text: "Add email"
//                     background: Rectangle { color: "grey"; radius: 5 }
//                     onClicked: console.log("Add email clicked")
//                 }
//             }
//             Button {
//                 text: "Add birthday"
//                 background: Rectangle { color: "grey"; radius: 5 }
//                 onClicked: console.log("Add birthday clicked")
//             }
//             Button {
//                 text: "Save"
//                 background: Rectangle { color: "grey"; radius: 5 }
//                 onClicked: addOrUpdateContact(firstNameField.text, surnameField.text, companyField.text, phoneField.text)
//             }
//             Button {
//                 text: "Back"
//                 background: Rectangle { color: "grey"; radius: 5 }
//                 onClicked: showAddForm = false
//             }
//         }
//     }

//     // Add button
//     Rectangle {   // Using Rectangle instead of RoundButton for simplicity
//         id: addButton
//         width: 50
//         height: 50
//         radius: 25
//         color: "#45b7d1"
//         anchors.bottom: parent.bottom
//         anchors.right: parent.right
//         anchors.margins: 10
//         Text {
//             text: "+"
//             anchors.centerIn: parent
//             color: "white"
//             font.pixelSize: 30
//         }
//         MouseArea {
//             anchors.fill: parent
//             onClicked: {
//                 selectedContact = ""
//                 firstNameField.text = ""; surnameField.text = ""; companyField.text = ""; phoneField.text = ""
//                 showAddForm = true
//             }
//         }
//     }

//     // Function to filter contacts
//     function filterContacts() {
//         var searchText = searchField.text.toLowerCase()
//         var filteredContacts = contacts.filter(function(contact) {
//             return contact.name.toLowerCase().indexOf(searchText) !== -1
//         })

//         // Sort filtered contacts alphabetically
//         filteredContacts.sort(function(a, b) {
//             return a.name.localeCompare(b.name)
//         })

//         contactList.model = filteredContacts
//     }

//     Component.onCompleted: {
//         contacts = appSettings.savedContacts || []
//         // Sort contacts on load
//         contacts.sort(function(a, b) { return a.name.localeCompare(b.name) })
//         contactList.model = contacts
//     }
// }



