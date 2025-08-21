import QtQuick 2.15
import QtQuick.Controls
Rectangle
{
    width: parent.width/2
    height: parent.height/2

    property var nameList:[]
    property var numberList : []


    signal backBtnClicked()

    // Column
    // {
    //     anchors.centerIn: parent
    //     spacing :10
    //     Repeater
    //     {
    //         width: parent.width/2
    //         height: parent.height/2
    //         model: nameList

    //         Text {
    //             id: name
    //             text : "name:"+ modelData
    //         }

    //     }
    //     Repeater
    //     {
    //         width: parent.width/2
    //         height: parent.height/2
    //         model: numberList


    //         Text{
    //             id:number
    //             text : "number :"+modelData
    //         }
    //     }
    // }
    ListView
    {
        id: mylistView
        width: parent.width
        height: parent.height -100
        model: nameList.length
        interactive : true
        clip: true
        delegate: mydelegate

    }

    Component{

        id: mydelegate

        Column{
            width:mylistView.width
            height: mylistView.height/5
            spacing:10

            Text {
                id: name
                text: "name: "+ nameList[index].contactName
                Component.onCompleted:
                {
                    console.log("Component created")
                }
                Component.onDestruction:
                {
                    console.log("Component destroyed")

                }
            }
            Text {
                id: number
                text: "number: "+nameList[index].contactNumber
            }

        }


    }
Row
{
    anchors.top :mylistView.bottom

    Button
    {
        id: backbtn
        text: "Back"
        onClicked:
        {
            backBtnClicked()
        }
    }

    Button
    {
        id: data
        text: "Add Number"
        onClicked:
        {
            ContactModel.addNumberButtonClicked()
        }
    }
}

}
