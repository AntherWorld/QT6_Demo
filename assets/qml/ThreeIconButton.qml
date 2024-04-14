import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: root_Button
    property string normalPic: "qrc:/image/ok.png"
    property string hoverPic: "qrc:/image/ok1.png"
    property string pressPic: "qrc:/image/ok2.png"

    font.pixelSize: 20  // 设置字体大小

    contentItem: Item {
        width: root_Button.width
        height: root_Button.height

        Text {
            anchors.centerIn: parent
            text: root_Button.text
            color: "black"  // 文本颜色设置为白色
            font: root_Button.font
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
/*
        Image {
            id: buttonImage
            source: root_Button.normalPic  // 使用Property Binding绑定source
            anchors.fill: parent
            fillMode: Image.Stretch // 正确的填充模式
        }

*/

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
            bimage.source=root_Button.hoverPic
            console.log(root_Button.text + " entered ")

            }
            onExited: {
            bimage.source=root_Button.normalPic
            console.log(root_Button.text + " exit ")
            }
            onPressed: {
             bimage.source=root_Button.pressPic
             console.log(root_Button.text + " press ")
            }
            onReleased: {
                 bimage.source=root_Button.hoverPic
                 console.log(root_Button.text + " 悬停 ")

            }
        }
    }


    background: BorderImage {
        id:bimage
        source:normalPic
        //source: root_Button.down ?pressPic:(root_Button.hovered ? hoverPic :normalPic)
        //source: root_Button.hovered ?hoverPic:(root_Button.down  ? pressPic :normalPic)
        anchors.fill: parent
        border.left: 10
        border.right: 10
        border.top: 10
        border.bottom: 10
        }
}
