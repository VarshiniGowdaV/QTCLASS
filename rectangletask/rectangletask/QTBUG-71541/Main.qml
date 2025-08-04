import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 300
    height: 200
    title: "ARGB Example"

    Rectangle {
        anchors.fill: parent
        color: "white"

        // Rectangle {
        //     width: 150
        //     height: 150
        //     anchors.centerIn: parent
        //     color: "#80FF0000"  // ARGB: Alpha=80, Red=FF

            Rectangle {
                width: 150
                height: 150
                anchors.centerIn: parent
                //color: "#FF000080"  // Qt thinks this is ARGB!
               color: "#80FF0000"
            }

        }

        Text {
            anchors.centerIn: parent
            text: "Behind Red"
            color: "black"
        }
    }

