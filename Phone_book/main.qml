import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Contact UI"
    color: "black"

    property var contacts: []

    Settings {
        id: appSettings
        property var savedContacts: []
    }

    property bool showAddForm: false
    property string selectedContact: ""

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

        contacts.sort(function(a, b) {
            return a.name.localeCompare(b.name)
        })

        contactList.model = contacts
        appSettings.savedContacts = contacts

        // Reset form
        firstNameField.text = ""; surnameField.text = ""; companyField.text = ""; phoneField.text = ""
        showAddForm = false
    }

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
                        case "B": return "orange"
                        case "C": return "lightgreen"
                        case "D": return "purple"
                        case "E": return "pink"
                        case "F": return "brown"
                        case "G": return "lightblue"
                        case "H": return "teal"
                        case "I": return "magenta"
                        case "J": return "yellow"
                        case "K": return "skyblue"
                        case "L": return "grey"
                        case "M": return "linegreen"
                        case "N": return "light purple"
                        case "O": return "tan"
                        case "P": return "blue"
                        case "Q": return "cyan"
                        case "R": return "aqua"
                        case "S": return "hotpink"
                        case "T": return "navyblue"
                        case "U": return "lilac"
                        case "V": return "royalblue"
                        case "W": return "maroon"
                        case "X": return "salmon"
                        case "Y": return "beige"
                        case "Z": return "palegreen"
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
                }
            }
        }
        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AlwaysOn }
        visible: !showAddForm
    }

    Rectangle {
        id: addForm
        visible: showAddForm
        anchors.top: searchField.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "black"

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

    Rectangle {
        id: addButton
        width: 50
        height: 50
        radius: 25
        color: "blue"
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

    function filterContacts() {
        var searchText = searchField.text.toLowerCase()
        var filteredContacts = contacts.filter(function(contact) {
            return contact.name.toLowerCase().indexOf(searchText) !== -1
        })

        filteredContacts.sort(function(a, b) {
            return a.name.localeCompare(b.name)
        })

        contactList.model = filteredContacts
    }

    Component.onCompleted: {
        contacts = appSettings.savedContacts || []
        contacts.sort(function(a, b) { return a.name.localeCompare(b.name) })
        contactList.model = contacts
    }
}



