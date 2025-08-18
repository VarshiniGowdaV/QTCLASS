import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Calculator"

    property string displayText: ""
    property var history: []

    function handleButtonClick(value) {
        if (value === "AC") {
            displayText = ""
        } else if (value === "←") {
            displayText = displayText.slice(0, -1)
        } else if (value === "=") {
            try {
                let expr = displayText.replace(/×/g, "*").replace(/÷/g, "/")
                let result = eval(expr)
                history.unshift({
                    expression: displayText,
                    result: result,
                    date: new Date().toLocaleString()
                })
                displayText = result
            } catch(e) {
                displayText = "Error"
            }
        } else {
            displayText += value
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
    }

    Component {
        id: mainPage
        Page {
            background: Rectangle { color: "black" }

            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                anchors.margins: 10

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    color: "black"

                    Text {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 40
                        color: "white"
                        text: displayText
                    }

                    Menu {
                        id: optionsMenu
                        MenuItem {
                            text: "History"
                            onTriggered: stackView.push(historyPage)
                        }
                    }

                    ToolButton {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        text: "⋮"
                        onClicked: optionsMenu.open()
                    }
                }

                Component {
                    id: calcButtonComponent
                    Button {
                        id: btn
                        property color bgColor: "gray"
                        property color textColor: "white"
                        font.pixelSize: 22

                        background: Rectangle {
                            radius: width / 2
                            color: btn.bgColor
                        }

                        contentItem: Item {
                            anchors.fill: parent
                            Text {
                                text: btn.text
                                font.pixelSize: 22
                                font.bold: true
                                color: btn.textColor
                                anchors.centerIn: parent
                            }
                        }

                        implicitWidth: 70
                        implicitHeight: 70
                        Layout.preferredWidth: parent ? parent.width / 4 - 10 : 70
                        Layout.preferredHeight: Layout.preferredWidth

                        onClicked: handleButtonClick(btn.text)
                    }
                }

                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 4
                    rowSpacing: 10
                    columnSpacing: 10

                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "AC"; item.bgColor = "#2d2d2d" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "%"; item.bgColor = "#2d2d2d" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "←"; item.bgColor = "#2d2d2d" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "÷"; item.bgColor = "#2d2d2d" } }

                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "7"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "8"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "9"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "×"; item.bgColor = "#2d2d2d" } }

                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "4"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "5"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "6"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "-"; item.bgColor = "#2d2d2d" } }

                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "1"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "2"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "3"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "+"; item.bgColor = "#2d2d2d" } }

                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "00"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "0"; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "."; item.bgColor = "#3a3a3a" } }
                    Loader { sourceComponent: calcButtonComponent; onLoaded: { item.text = "="; item.bgColor = "#787878" } }
                }
            }
        }
    }

    Component {
        id: historyPage
        Page {
            background: Rectangle { color: "black" }

            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                anchors.margins: 10

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    ToolButton {
                        text: "←"
                        onClicked: stackView.pop()
                    }

                    Text {
                        text: "History"
                        font.pixelSize: 22
                        color: "white"
                    }

                    Item { Layout.fillWidth: true }

                    ToolButton {
                        text: "🗑"
                        onClicked: history = []
                    }
                }

                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: history
                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 90
                        color: "#1c1c1c"
                        radius: 6
                        border.color: "gray"

                        Column {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 2
                            Text { text: modelData.expression; color: "lightgray"; font.pixelSize: 14 }
                            Text { text: modelData.result; color: "white"; font.pixelSize: 20 }
                            Text { text: modelData.date; color: "gray"; font.pixelSize: 12 }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                displayText = modelData.result
                                stackView.pop()
                            }
                        }
                    }
                }
            }
        }
    }
}

