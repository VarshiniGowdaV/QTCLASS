import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 600
    title: "Phone Book"

    Loader {
        id: pageLoader
        anchors.fill: parent
        sourceComponent: createContactPage
    }

    Component {
        id: createContactPage
        Contact {
            onSubmitClicked: (name, phone) => {
                contactModel.addContact(name, phone)
            }
            onBackClicked: {
                pageLoader.sourceComponent = contactListPage
            }
        }
    }

    Component {
        id: contactListPage
        ContactListDisplay {
            onBackClicked: {
                pageLoader.sourceComponent = createContactPage
            }
        }
    }
}
