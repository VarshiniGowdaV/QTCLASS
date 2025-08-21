import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property var contactNameList : ContactModel.contactList
    // property var contactNumberList: ContactModel.contactList

    /*Rectangle
    {
        width: parent.width/2
        height: parent.height/2
        Column
        {
            anchors.centerIn: parent
            spacing :10

            TextField
            {
                id: contactName
                placeholderText: "Name"
            }
            TextField
            {
                id: contactNumber
                placeholderText: "Number"
            }
            Button{
                id: submitBtn
                text: "Submit"
                onClicked:
                {
                    onSubmitBtnClicked()
                    showlist.visible = true
                }

            }
        }
    }
    function onSubmitBtnClicked()
    {
        contactNameList.push(contactName.displayText)
        contactNumberList.push(contactNumber.displayText)
        showlist.nameList = contactNameList
        showlist.numberList = contactNumberList
        // loader.setSource("ShowList.qml",{nameList:contactNameList,numberList:contactNumberList})
        console.log("name"+ contactNameList)
        console.log("Number"+contactNumberList)
    }

    Connections
    {
        target: showlist

       function onBackBtnClicked()
       {
           showlist.visible = false
       }
    }*/

    ShowList
    {
        id: showlist
        width: parent.width
        height: parent.height
        visible: true
        nameList : contactNameList

    }

}

// Window{
//         width: 640
//         height: 480
//         visible: true
//  Column{
//      width : parent.width
//      height : parent.height
//      spacing :10
//         Repeater
//         {
//             width : parent.width
//             height : parent.height
//             model: 10

//             Button{
//                 id:btn
//                 width:100
//                 height:50
//                 text: "Button"
//             }
//         }
//  }
// }
