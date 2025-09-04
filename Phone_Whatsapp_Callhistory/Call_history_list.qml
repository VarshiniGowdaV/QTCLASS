import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: callHistoryPage
    anchors.fill: parent
    color: "lightgray"

    property string searchText: ""

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        Row {
            width: parent.width
            height: 40
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "<"
                width: 40
                height: 40
                onClicked: pageLoader.source = "Front_page.qml"
            }

            Label {
                text: "Call History"
                color: "black"
                font.bold: true
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
            }
        }

        TextField {
            id: searchField
            placeholderText: "Search by name..."
            width: parent.width - 20
            onTextChanged: callHistoryPage.searchText = text
        }

        ListView {
            id: callHistoryList
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height - 120
            spacing: 8
            clip: true
            model: ListModel {
                id: filteredModel
            }

            delegate: Rectangle {
                width: parent.width
                height: 60
                radius: 6
                color: "white"
                border.color: "gray"

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        Text { text: name; font.bold: true }
                        Text { text: callTime; font.pixelSize: 12; color: "gray" }
                    }

                    Item { width: 20 }

                    Text {
                        text: number
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Item { width: 20 }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        font.pixelSize: 20
                        text: {
                            if (isIncoming && !isMissed) return "↘️";
                            else if (!isIncoming && !isMissed) return "↗️";
                            else if (isMissed) return "❌📞";
                            else return "";
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        updateFilteredModel()
    }

    onSearchTextChanged: updateFilteredModel()

    function updateFilteredModel() {
        filteredModel.clear()
        for (var i = 0; i < modelManager.contactModel.count; i++) {
            var item = modelManager.contactModel.get(i)
            if (item.name.toLowerCase().indexOf(searchText.toLowerCase()) !== -1) {
                filteredModel.append(item)
            }
        }
    }
}


