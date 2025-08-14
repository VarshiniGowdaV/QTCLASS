import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    ListModel
    {
        id:studentmodel
        ListElement{name:"varshini";rollnumber: "14";phone:"1234567890"}
        ListElement{name:"varshini1";rollnumber: "15";phone:"1234567890"}
        ListElement{name:"varshini2";rollnumber: "16";phone:"1234567890"}
        ListElement{name:"varshini3";rollnumber: "17";phone:"1234567890"}
        ListElement{name:"varshini4";rollnumber: "18";phone:"1234567890"}
        ListElement{name:"varshini5";rollnumber: "19";phone:"1234567890"}
        ListElement{name:"varshini6";rollnumber: "20";phone:"1234567890"}
        ListElement{name:"varshini7";rollnumber: "21";phone:"1234567890"}
        ListElement{name:"varshini8";rollnumber: "22";phone:"1234567890"}
        ListElement{name:"varshini9";rollnumber: "23";phone:"1234567890"}
        ListElement{name:"varshini10";rollnumber: "24";phone:"1234567890"}

    }
    ListView{
        id:listView
        width: parent.width/2
        height: parent.height
        model: studentmodel
        delegate: studentdelegate
        //clip: true
        //spacing: 5
    }
    Component{
        id:studentdelegate
        Rectangle{
            id:background
            width: listView.width
            height: listView.height/5
            color: "gray"
            Row{
             spacing: 10
             width: parent.width
             height: parent.height/5
             Text{
                 id:stname
                 text:name
             }
             Text{
                 id:strollnumber
                 text:rollnumber
             }
             Text{
                 id:stphone
                 text:phone
             }
            }
        }
    }
}
