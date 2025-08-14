import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: "activeFocusItem: " + activeFocusItem

    property ListModel model: ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
            color: "green"
        }
        ListElement {
            name: "Cherry"
            color: "red"
        }
        ListElement {
            name: "Banana"
            color: "yellow"
        }
        ListElement {
            name: "Orange"
            color: "orange"
        }
        ListElement {
            name: "WaterMelon"
            color: "pink"
        }
    }

    SearchField {
        text: "Live SearchField"
        textRole: "name"
        suggestionModel: window.model
    }
}

