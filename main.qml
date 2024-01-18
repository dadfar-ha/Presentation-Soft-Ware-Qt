import QtQuick 2.15
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtPositioning 5.15
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtPositioning 5.6
import QtCharts 2.3
import QtQuick.Controls 2.0 as C2
import "qrc:/JavaScriptsFunction.js" as ParamScript

ApplicationWindow {
    id:mainn
    width: 1200
    height: 850
    minimumHeight: 500
    minimumWidth: 850
    visible: true
    Material.theme: Material.Light
    Material.accent: "#eb4d53"
    Material.primary: Material.Grey
    title: qsTr("Final Presentation")

    property bool flagfullWin: false
    property var deltaX :0

    //Signals ----------------------------------
    signal startplot1(var d)
    signal startplot2(var d)
    signal startplot3(var d)
    signal startplot4(var d)

    //Plots---------------------------------------------------------------
    function winPlot1(num1,num2,num3,num4,num5,num6,num7,num8,num9,num10){
        resultPoints1.clear()
        resultPoints1.clear()
        resultPoints2.clear()
        resultPoints3.clear()
        resultPoints4.clear()
        resultPoints1.append(num1,num2);
        resultPoints1.append(num9,num10);
        resultPoints2.append(num3,num4);
        resultPoints3.append(num5,num6);
        resultPoints4.append(num7,num8);
    }

    function winPlot2(num1,num2,num3,num4,num5,num6,num7,num8,num9,num10){
        resultPointss1.clear()
        resultPointss1.clear()
        resultPointss2.clear()
        resultPointss3.clear()
        resultPointss4.clear()
        resultPointss1.append(num1,num2);
        resultPointss1.append(num9,num10);
        resultPointss2.append(num3,num4);
        resultPointss3.append(num5,num6);
        resultPointss4.append(num7,num8);
    }

    function winPlot3(num1,num2,num3,num4,num5,num6,num7,num8,num9,num10){
        resultPointsss1.clear()
        resultPointsss1.clear()
        resultPointsss2.clear()
        resultPointsss3.clear()
        resultPointsss4.clear()
        resultPointsss1.append(num1,num2);
        resultPointsss1.append(num9,num10);
        resultPointsss2.append(num3,num4);
        resultPointsss3.append(num5,num6);
        resultPointsss4.append(num7,num8);
    }

    function winPlot4(num1,num2,num3,num4,num5,num6,num7,num8,num9,num10){
        resultPointssss1.clear()
        resultPointssss1.clear()
        resultPointssss2.clear()
        resultPointssss3.clear()
        resultPointssss4.clear()
        resultPointssss1.append(num1,num2);
        resultPointssss1.append(num9,num10);
        resultPointssss2.append(num3,num4);
        resultPointssss3.append(num5,num6);
        resultPointssss4.append(num7,num8);
    }

    RowLayout{
        Page{
            id:page1
            implicitWidth: 220
            implicitHeight: parent.height
            Material.theme: Material.Dark
            ColumnLayout{
                anchors.fill: parent
                Button {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    clip:true
                    id:fullwin
                    background: {
                        clip:true
                        color="transparent"
                    }
                    icon.source:  "/icons/largericon.png"
                    icon.color: "#9cd7b6"
                    onClicked: {
                        if(!flagfullWin){
                            ParamScript.changecolorcsvactive(fullwin)
                            mainn.visibility= Window.FullScreen
                            flagfullWin=true
                            jointBorder.color="white"
                        }
                        else if(flagfullWin){
                            ParamScript.changecolorcsvnotactive(fullwin)
                            mainn.visibility= Window.Windowed
                            flagfullWin=false
                            jointBorder.color="black"
                        }
                    }
                }
                GroupBox{
                    Layout.alignment: Qt.AlignTop
                    anchors.left: parent.left
                    id:mainMenuGRP

                    implicitWidth: page1.width
                    implicitHeight: 500
                    background: Rectangle {
                        id:mainMenuGRPBG
                        color: "transparent"
                        border.color: "transparent"
                    }
                    MouseArea {
                        anchors.fill: parent
                        drag.target: mainMenuGRP
                        onPositionChanged: {
                            greenLightDanceMainMenu.start()
                            borderWidthAnimationMainMenu.start()
                            mainMenuGRP.x += mouse.x - mouse.startX;
                            mainMenuGRP.y += mouse.y - mouse.startY;
                            if(mainMenuGRP.y <page1.y){
                                mainMenuGRP.x= page1.x
                                mainMenuGRP.y= page1.y
                            }
                        }
                        onWheel: {
                            var zoomFactor = 1.1;
                            if (wheel.angleDelta.y > 0) {
                                mainMenuGRP.scale *= zoomFactor;
                            } else {
                                mainMenuGRP.scale /= zoomFactor;
                            }
                        }
                    }
                    PropertyAnimation {
                        id: borderWidthAnimationMainMenu
                        target: mainMenuGRPBG
                        property: "border.width"
                        from: 3
                        to: 1
                        duration: 2000
                    }
                    SequentialAnimation {
                        id: greenLightDanceMainMenu

                        ColorAnimation {
                            target: mainMenuGRPBG
                            property: "border.color"
                            from: "transparent"
                            to: "#eb4d53"
                            duration: 500
                        }
                        ColorAnimation {
                            target: mainMenuGRPBG
                            property: "border.color"
                            from: "#eb4d53"
                            to: "transparent"
                            duration: 500
                        }
                    }
                    ColumnLayout{
                        //                    anchors.centerIn: parent.Center
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                        TabButton {
                            id:outlinebutton
                            text: qsTr("Outline")
                            onClicked: {
                                bar.currentIndex=1
                                pageChanger.text=1
                            }
                            Material.foreground: bar.currentIndex===1 ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:introductionbutton
                            text: qsTr("Introduction")
                            onClicked: {
                                bar.currentIndex=2
                                pageChanger.text=2
                            }
                            Material.foreground: bar.currentIndex===2 ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:backgroundbutton
                            text: qsTr("Related Works")
                            onClicked: {
                                bar.currentIndex=3
                                pageChanger.text=3
                            }
                            Material.foreground: bar.currentIndex===3 || bar.currentIndex===4
                                                 || bar.currentIndex===5 || bar.currentIndex===6
                                                 || bar.currentIndex===7 || bar.currentIndex===8 ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:methodbutton
                            text: qsTr("Theoretical Background")
                            onClicked: {
                                bar.currentIndex=9
                                pageChanger.text=9
                            }
                            Material.foreground: bar.currentIndex===9 || bar.currentIndex===10 ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:resultsbutton
                            text: qsTr("Our Method")
                            onClicked: {
                                bar.currentIndex=11
                                pageChanger.text=11
                            }
                            Material.foreground: bar.currentIndex===11 || bar.currentIndex===12 || bar.currentIndex===13  ||
                                                 bar.currentIndex===14  ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:conclusionbutton
                            text: qsTr("Evaluation Results")
                            onClicked: {
                                bar.currentIndex=15
                                pageChanger.text=15
                            }
                            Material.foreground: bar.currentIndex===15 || bar.currentIndex===16 || bar.currentIndex===17  ||
                                                 bar.currentIndex===18 || bar.currentIndex===19 || bar.currentIndex===20  ||
                                                 bar.currentIndex===21  ? "#eb4d53" : "white"
                        }
                        TabButton {
                            id:serialPortbutton
                            text: qsTr("Conclusion")
                            onClicked: {
                                bar.currentIndex=22
                                pageChanger.text=22
                            }
                            Material.foreground: bar.currentIndex===22 ? "#eb4d53" : "white"
                        }
                    }
                }
                Label{
                    text:"Version 3.1"
                    font.pixelSize: 8
                    color: "yellow"
                }
            }
        }
        Rectangle {
            id: jointBorder
            width: 5
            height: 400
            color: "black"

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                cursorShape: Qt.SizeHorCursor
                property int startX: 0
                onPressed: {
                    startX = mouse.x
                }
                onReleased: {//onReleased  onMouseXChanged  onPositionChanged
                    deltaX = mouse.x - startX
                    page1.implicitWidth += deltaX
                    startX = mouse.x
                }
            }
        }
        Page{
            Material.theme: Material.Dark
            Material.accent: "#428158"
            Material.primary: Material.Grey
            anchors.top:parent.top
            id:page2
            implicitWidth: mainn.width-page1.width
            implicitHeight: mainn.height
            Keys.onPressed: {
                if (event.key === Qt.Key_Right && bar.currentIndex!==20) {
                    bar.currentIndex+=1
                    pageChanger.text=bar.currentIndex
                }
                else if (event.key === Qt.Key_Left && bar.currentIndex!==0 ) {
                    bar.currentIndex-=1
                    pageChanger.text=bar.currentIndex
                }
            }
            ColumnLayout{
                implicitWidth: parent.width
                GroupBox{
                    implicitWidth: mainn.width-page1.width
                    implicitHeight: 65
                    RowLayout{
                        id:slidemenu
                        anchors.top: parent.top
                        implicitWidth: mainn.width-page1.width
                        ToolButton {
                            anchors.top: parent.top
                            id: toolButton
                            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
                            font.pixelSize: Qt.application.font.pixelSize * 1.6
                            onClicked: {
                                if (stackView.depth > 1) {
                                    stackView.pop()
                                } else {
                                    serialsdrawer.open()
                                }
                            }
                        }
                        spacing: 300
                        RowLayout{
                            anchors.top: parent.top
                            TabButton{
                                id:pageChangeLeft
                                background: {
                                    clip:true
                                    color="transparent"
                                }
                                icon.source:  "/icons/leftIcon.png"
                                onClicked: {
                                    if(bar.currentIndex!==0){
                                        bar.currentIndex=bar.currentIndex-1
                                        pageChanger.text=bar.currentIndex
                                    }
                                    pageChangeRight.icon.color="white"
                                    pageChangeLeft.icon.color="#eb4d53"
                                }
                            }
                            TabButton{
                                id:pageChangeRight
                                background: {
                                    clip:true
                                    color="transparent"
                                }
                                icon.source:  "/icons/rightIcon.png"
                                onClicked: {
                                    if(bar.currentIndex!==23){
                                        bar.currentIndex=bar.currentIndex+1
                                        pageChanger.text=bar.currentIndex
                                    }
                                    pageChangeLeft.icon.color="white"
                                    pageChangeRight.icon.color="#eb4d53"
                                }
                            }
                        }
                        GroupBox{
                            anchors.top: parent.top
                            id:textFeildGRP
                            implicitWidth: 120
                            implicitHeight: 70
                            background: Rectangle {
                                id:textFeildGRPBG
                                color: "transparent"
                                border.color: "transparent"
                            }
                            MouseArea {
                                anchors.fill: parent
                                drag.target: textFeildGRP
                                onPositionChanged: {
                                    greenLightDance.start()
                                    borderWidthAnimation.start()
                                    textFeildGRP.x += mouse.x - mouse.startX;
                                    textFeildGRP.y += mouse.y - mouse.startY;
                                    if(textFeildGRP.x <slidemenu.x){
                                        textFeildGRP.x= slidemenu.x
                                        textFeildGRP.y= slidemenu.y
                                    }
                                }
                                onWheel: {
                                    var zoomFactor = 1.1;
                                    if (wheel.angleDelta.y > 0) {
                                        textFeildGRP.scale *= zoomFactor;
                                    } else {
                                        textFeildGRP.scale /= zoomFactor;
                                    }
                                }
                            }
                            PropertyAnimation {
                                id: borderWidthAnimation
                                target: textFeildGRPBG
                                property: "border.width"
                                from: 3
                                to: 1
                                duration: 2000
                            }
                            SequentialAnimation {
                                id: greenLightDance

                                ColorAnimation {
                                    target: textFeildGRPBG
                                    property: "border.color"
                                    from: "transparent"
                                    to: "#eb4d53"
                                    duration: 500
                                }
                                ColorAnimation {
                                    target: textFeildGRPBG
                                    property: "border.color"
                                    from: "#eb4d53"
                                    to: "transparent"
                                    duration: 500
                                }
                            }
                            RowLayout{
                                Label{
                                    text: "Page:"
                                }
                                TextField {
                                    id:pageChanger
                                    anchors.right: page2.right
                                    implicitWidth: 30
                                    implicitHeight: 40
                                    placeholderText: bar.currentIndex
                                    onTextChanged: {
                                        bar.currentIndex=text
                                    }
                                    font.pixelSize: 13
                                    text:bar.currentIndex
                                    horizontalAlignment: Text.AlignHCenter
                                    Component.onCompleted: {
                                        pageChanger.text=bar.currentIndex
                                    }
                                }
                                Label{
                                    text: "/23"
                                }
                            }
                        }
                    }
                }
                StackLayout {
                    implicitWidth: parent.width
                    currentIndex: bar.currentIndex
                    Keys.onPressed: {
                        if (event.key === Qt.Key_Escape && mainn.visibility === Window.FullScreen) {
                            ParamScript.changecolorcsvnotactive(fullwin)
                            mainn.visibility = Window.Windowed
                            flagfullWin=false
                        }
                    }
                    Item {
                        id: slide1
                        anchors.fill:parent
                        ColumnLayout{
                            anchors.fill:parent
                            ColumnLayout{
                                spacing:20
                                GroupBox{
                                    id:welcome
                                    implicitHeight: 60
                                    implicitWidth:page2.width
                                    background: Rectangle {
                                        color: "transparent"
                                        border.color: "transparent"
                                    }
                                    Label{
                                        width: parent.width
                                        height: parent.height
                                        text: "Title:"
                                        font.pixelSize: 15
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                }
                                GroupBox{
                                    id:titleid
                                    implicitHeight: page2.height/1.5
                                    implicitWidth:page2.width
                                    background: Rectangle {
                                        color: "transparent"
                                        border.color: "transparent"
                                    }
                                    Label{
                                        width: parent.width
                                        height: parent.height/2
                                        text: "IRSGAN: Image Restoration and
Super-Resolution Using GAN"
                                        font.pixelSize: 40
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                }
                            }
                            GroupBox{
                                //                                anchors.top: titleid.bottom
                                implicitHeight: 30
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ColumnLayout{
                                    Label{
                                        width: parent.width
                                        height: parent.height
                                        text: " Present by: Dadfar Abyazi"
                                        font.pixelSize: 15
                                    }
                                    Label{
                                        width: parent.width
                                        height: parent.height
                                        text: " SuperVisor: Dr. Mehran Yazdi"
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            //                            GroupBox{
                            //                                implicitHeight: 30
                            //                                implicitWidth:parent.width
                            //                                background: Rectangle {
                            //                                    color: "transparent"
                            //                                    border.color: "transparent"
                            //                                }
                            //                                Label{
                            //                                    width: parent.width
                            //                                    height: parent.height
                            //                                    text: " Advisor:"
                            //                                    font.pixelSize: 15
                            //                                }
                            //                            }
                            //                            GroupBox{
                            //                                implicitHeight: 30
                            //                                implicitWidth:parent.width
                            //                                background: Rectangle {
                            //                                    color: "transparent"
                            //                                    border.color: "transparent"
                            //                                }
                            //                                Label{
                            //                                    width: parent.width
                            //                                    height: parent.height
                            //                                    text: " Guidance Adviser:"
                            //                                    font.pixelSize: 15
                            //                                }
                            //                            }
                        }
                    }
                    Item {
                        id: slidee1
                        anchors.fill:parent
                        ColumnLayout{
                            anchors.fill:parent
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Outline:"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Introduction"
                                    font.pixelSize: 25
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Related Works"
                                    font.pixelSize: 25
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Theoretical Background"
                                    font.pixelSize:25
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Our Method"
                                    font.pixelSize: 25
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Evaluation Results"
                                    font.pixelSize: 25
                                }
                            }
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                ToolButton{
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    text: "Conclusiont"
                                    font.pixelSize: 25
                                }
                            }
                        }

                    }
                    Item {
                        anchors.centerIn: parent.Center
                        id: slide2
                        implicitHeight: parent.height
                        implicitWidth:parent.width
                        ColumnLayout{
                            implicitHeight: parent.height
                            implicitWidth:parent.width
                            x:300
                            spacing:20
                            GroupBox{
                                id:page2Tiltle
                                implicitHeight: 250
                                implicitWidth:1000
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                TextArea{
                                    anchors.fill: parent.Center
                                    text: ". Image restoration and super-resolution are key aspects  of computer  vision  that  have \n
seen significant advancements due to the advent of deep learning techniques, particularly \n
Generative  Adversarial  Networks (GANs). This  thesis focuses on exploring these  topics \n
 through the lens of GANs."
                                    font.pixelSize: 25
                                    color: "black"
                                }
                                background: Rectangle {
                                    id:gRPPAGE2
                                    color: "#DEE2ED"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page2Tiltle
                                    onPositionChanged: {
                                        textcolorPage2.start()
                                        textAnimPage2.start()
                                        page2Tiltle.x += mouse.x - mouse.startX;
                                        page2Tiltle.y += mouse.y - mouse.startY;
                                        //                                        if(page2Tiltle.y >page2.y ){
                                        //                                            page2Tiltle.x= page2.x
                                        //                                            page2Tiltle.y= page2.y
                                        //                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page2Tiltle.scale *= zoomFactor;
                                        } else {
                                            page2Tiltle.scale /= zoomFactor;
                                        }
                                        if(page2Tiltle.scale<1/2){
                                            page2Tiltle.scale=1/2
                                        }
                                        else if(page2Tiltle.scale>3){
                                            page2Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage2
                                    target: gRPPAGE2
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage2

                                    ColorAnimation {
                                        target: gRPPAGE2
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE2
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }
                            GroupBox{
                                id:page2Tiltle2
                                implicitHeight: 250
                                implicitWidth:1000
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                TextArea{
                                    anchors.fill: parent.Center
                                    text: ". In the context of image restoration, GANs can be employed to recover lost or degraded
details in images.
On  the  other hand,  super-resolution  is  a process that  increases  the  resolution of an
image. Traditional methods often  involve  interpolation and resampling. However, these
techniques  can  lead to artifacts  and  loss  of detail. With the advent of  deep  learning,
super-resolution has become more  sophisticated  and accurate.
"
                                    font.pixelSize: 25
                                    color: "black"
                                }
                                background: Rectangle {
                                    id:gRPPAGE22
                                    color: "#DEE2ED"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page2Tiltle2
                                    onPositionChanged: {
                                        textcolorPage22.start()
                                        textAnimPage22.start()
                                        page2Tiltle2.x += mouse.x - mouse.startX;
                                        page2Tiltle2.y += mouse.y - mouse.startY;
                                        //                                        if(page2Tiltle.y >page2.y ){
                                        //                                            page2Tiltle.x= page2.x
                                        //                                            page2Tiltle.y= page2.y
                                        //                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page2Tiltle2.scale *= zoomFactor;
                                        } else {
                                            page2Tiltle2.scale /= zoomFactor;
                                        }
                                        if(page2Tiltle2.scale<1/2){
                                            page2Tiltle2.scale=1/2
                                        }
                                        else if(page2Tiltle2.scale>3){
                                            page2Tiltle2.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage22
                                    target: gRPPAGE2
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage22

                                    ColorAnimation {
                                        target: gRPPAGE2
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE22
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }
                            GroupBox{
                                id:page2Tiltle22
                                implicitHeight: 250
                                implicitWidth:1000
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                TextArea{
                                    anchors.fill: parent.Center
                                    text: ". In the context of image restoration, GANs can be employed to recover lost or degraded
details in images.
On  the  other hand,  super-resolution  is  a process that  increases  the  resolution of an
image. Traditional methods often  involve  interpolation and resampling. However, these
techniques  can  lead to artifacts  and  loss  of detail. With the advent of  deep  learning,
super-resolution has become more  sophisticated  and accurate.
"
                                    font.pixelSize: 25
                                    color: "black"
                                }
                                background: Rectangle {
                                    id:gRPPAGE222
                                    color: "#DEE2ED"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page2Tiltle22
                                    onPositionChanged: {
                                        textcolorPage222.start()
                                        textAnimPage222.start()
                                        page2Tiltle22.x += mouse.x - mouse.startX;
                                        page2Tiltle22.y += mouse.y - mouse.startY;
                                        //                                        if(page2Tiltle.y >page2.y ){
                                        //                                            page2Tiltle.x= page2.x
                                        //                                            page2Tiltle.y= page2.y
                                        //                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page2Tiltle22.scale *= zoomFactor;
                                        } else {
                                            page2Tiltle22.scale /= zoomFactor;
                                        }
                                        if(page2Tiltle22.scale<1/2){
                                            page2Tiltle22.scale=1/2
                                        }
                                        else if(page2Tiltle22.scale>3){
                                            page2Tiltle22.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage222
                                    target: gRPPAGE222
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage222

                                    ColorAnimation {
                                        target: gRPPAGE222
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE222
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide3
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:200
                            y:200
                            RowLayout{
                                Image {
                                    id: imagePage3
                                    scale:1
                                    source: "qrc:/qml/3.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage3
                                        onPositionChanged: {
                                            imagePage3.x += mouse.x - mouse.startX;
                                            imagePage3.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage3.scale *= zoomFactor;
                                            } else {
                                                imagePage3.scale /= zoomFactor;
                                            }
                                            if(imagePage3.scale<1/2){
                                                imagePage3.scale=1/2
                                            }
                                            else if(imagePage3.scale>3){
                                                imagePage3.scale=3
                                            }
                                        }
                                    }
                                }

                            }

                        }
                    }
                    Item {
                        id: slide4
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            x:150
                            y:50
                            anchors.fill: parent.Center
                            RowLayout{
                                Image {
                                    id: imagePage4
                                    scale:1
                                    source: "qrc:/qml/4.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage4
                                        onPositionChanged: {
                                            imagePage4.x += mouse.x - mouse.startX;
                                            imagePage4.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage4.scale *= zoomFactor;
                                            } else {
                                                imagePage4.scale /= zoomFactor;
                                            }
                                            if(imagePage4.scale<1/2){
                                                imagePage4.scale=1/2
                                            }
                                            else if(imagePage4.scale>3){
                                                imagePage4.scale=3
                                            }
                                        }
                                    }
                                }

                            }
                            GroupBox{
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                id:page4Tiltle
                                implicitHeight: text4.height
                                implicitWidth:400
                                TextArea{
                                    id:text4
                                    anchors.fill: parent.Center
                                    text: " یک نمای کلی از پکت هایی که در کلاس waterfall\n استفاده می شوندو در کلاس های بعدی مورد بررسی قرار \nمیگیرند.\n
آبی: کلاس اصلی دریافت پکت هااز Ethernet\n
سبز: نام پکت ها\n
زرد: نام کلاس ها"
                                    color: "black"
                                }
                                background: Rectangle {
                                    id:gRPPAGE4
                                    color: "#FDDAD1"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page4Tiltle
                                    onPositionChanged: {
                                        textcolorPage4.start()
                                        textAnimPage4.start()
                                        page4Tiltle.x += mouse.x - mouse.startX;
                                        page4Tiltle.y += mouse.y - mouse.startY;
                                        if(page4Tiltle.y <page2.y){
                                            page4Tiltle.x= page2.x
                                            page4Tiltle.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page4Tiltle.scale *= zoomFactor;
                                        } else {
                                            page4Tiltle.scale /= zoomFactor;
                                        }
                                        if(page4Tiltle.scale<1/2){
                                            page4Tiltle.scale=1/2
                                        }
                                        else if(page4Tiltle.scale>3){
                                            page4Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage4
                                    target: gRPPAGE4
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage4

                                    ColorAnimation {
                                        target: gRPPAGE4
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE4
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide5
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:150
                            y:50
                            RowLayout{
                                Image {
                                    id: imagePage5
                                    scale:1
                                    source: "qrc:/qml/5.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage5
                                        onPositionChanged: {
                                            imagePage5.x += mouse.x - mouse.startX;
                                            imagePage5.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage5.scale *= zoomFactor;
                                            } else {
                                                imagePage5.scale /= zoomFactor;
                                            }
                                            if(imagePage5.scale<1/2){
                                                imagePage5.scale=1/2
                                            }
                                            else if(imagePage5.scale>3){
                                                imagePage5.scale=3
                                            }
                                        }
                                    }
                                }

                            }
                            GroupBox{
                                id:page5Tiltle
                                implicitHeight: text5.height
                                implicitWidth:400
                                TextArea{
                                    id:text5
                                    anchors.fill: parent.Center
                                    text: " یک نمای کلی از پکت هایی که در کلاس PulseProcessor\n استفاده می شوندو در کلاس های بعدی مورد بررسی قرار \nمیگیرند.\n
آبی: کلاس اصلی دریافت پکت هااز Ethernet\n
سبز: نام پکت ها\n
زرد: نام کلاس ها"
                                }
                                background: Rectangle {
                                    id:gRPPAGE5
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page5Tiltle
                                    onPositionChanged: {
                                        textcolorPage5.start()
                                        textAnimPage5.start()
                                        page5Tiltle.x += mouse.x - mouse.startX;
                                        page5Tiltle.y += mouse.y - mouse.startY;
                                        if(page5Tiltle.y <page2.y){
                                            page5Tiltle.x= page2.x
                                            page5Tiltle.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page5Tiltle.scale *= zoomFactor;
                                        } else {
                                            page5Tiltle.scale /= zoomFactor;
                                        }
                                        if(page5Tiltle.scale<1/2){
                                            page5Tiltle.scale=1/2
                                        }
                                        else if(page5Tiltle.scale>3){
                                            page5Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage5
                                    target: gRPPAGE5
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage5

                                    ColorAnimation {
                                        target: gRPPAGE5
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE5
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide6
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:150
                            y:50
                            RowLayout{
                                Image {
                                    id: imagePage6
                                    scale:1
                                    source: "qrc:/qml/6.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage6
                                        onPositionChanged: {
                                            imagePage6.x += mouse.x - mouse.startX;
                                            imagePage6.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage6.scale *= zoomFactor;
                                            } else {
                                                imagePage6.scale /= zoomFactor;
                                            }
                                            if(imagePage6.scale<1/2){
                                                imagePage6.scale=1/2
                                            }
                                            else if(imagePage6.scale>3){
                                                imagePage6.scale=3
                                            }
                                        }
                                    }
                                }

                            }
                            GroupBox{
                                id:page6Tiltle
                                implicitHeight: text6.height
                                implicitWidth:400
                                TextArea{
                                    id:text6
                                    anchors.fill: parent.Center
                                    text: " یک نمای کلی از پکت هایی که در کلاس ParamProcessor\n استفاده می شوندو در کلاس های بعدی مورد بررسی قرار \nمیگیرند.\n
آبی: کلاس اصلی دریافت پکت هااز Ethernet\n
سبز: نام پکت ها\n
زرد: نام کلاس ها"
                                }
                                background: Rectangle {
                                    id:gRPPAGE6
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page6Tiltle
                                    onPositionChanged: {
                                        textcolorPage6.start()
                                        textAnimPage6.start()
                                        page6Tiltle.x += mouse.x - mouse.startX;
                                        page6Tiltle.y += mouse.y - mouse.startY;
                                        if(page6Tiltle.y <page2.y){
                                            page6Tiltle.x= page2.x
                                            page6Tiltle.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page6Tiltle.scale *= zoomFactor;
                                        } else {
                                            page6Tiltle.scale /= zoomFactor;
                                        }
                                        if(page6Tiltle.scale<1/2){
                                            page6Tiltle.scale=1/2
                                        }
                                        else if(page6Tiltle.scale>3){
                                            page6Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage6
                                    target: gRPPAGE6
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage6

                                    ColorAnimation {
                                        target: gRPPAGE6
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE6
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide7
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:150
                            y:50
                            Image {
                                id: imagePage7
                                scale:1
                                source: "qrc:/qml/7.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage7
                                    onPositionChanged: {
                                        imagePage7.x += mouse.x - mouse.startX;
                                        imagePage7.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage7.scale *= zoomFactor;
                                        } else {
                                            imagePage7.scale /= zoomFactor;
                                        }
                                        if(imagePage7.scale<1/2){
                                            imagePage7.scale=1/2
                                        }
                                        else if(imagePage7.scale>3){
                                            imagePage7.scale=3
                                        }
                                    }
                                }
                            }


                            RowLayout{
                                implicitHeight: parent.height-imagePage7.height
                                GroupBox{
                                    id:page7Tiltle
                                    implicitHeight: text7.height
                                    implicitWidth:400
                                    TextArea{
                                        id:text7
                                        //                                    anchors.fill: parent.Center
                                        text: " یک نمای کلی از پکت هایی که در کلاس dfProcessor\n استفاده می شوندو در کلاس های بعدی مورد بررسی قرار \nمیگیرند.\n
آبی: کلاس اصلی دریافت پکت هااز Ethernet\n
سبز: نام پکت ها\n
زرد: نام کلاس ها"
                                    }
                                    background: Rectangle {
                                        id:gRPPAGE7
                                        color: "transparent"
                                        border.color: "transparent"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: page7Tiltle
                                        onPositionChanged: {
                                            textcolorPage7.start()
                                            textAnimPage7.start()
                                            page7Tiltle.x += mouse.x - mouse.startX;
                                            page7Tiltle.y += mouse.y - mouse.startY;
                                            if(page7Tiltle.y <page2.y){
                                                page7Tiltle.x= page2.x
                                                page7Tiltle.y= page2.y
                                            }
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                page7Tiltle.scale *= zoomFactor;
                                            } else {
                                                page7Tiltle.scale /= zoomFactor;
                                            }
                                            if(page7Tiltle.scale<1/2){
                                                page7Tiltle.scale=1/2
                                            }
                                            else if(page7Tiltle.scale>3){
                                                page7Tiltle.scale=3
                                            }
                                        }
                                    }
                                    PropertyAnimation {
                                        id: textAnimPage7
                                        target: gRPPAGE7
                                        property: "border.width"
                                        from: 3
                                        to: 1
                                        duration: 2000
                                    }
                                    SequentialAnimation {
                                        id: textcolorPage7

                                        ColorAnimation {
                                            target: gRPPAGE7
                                            property: "border.color"
                                            from: "transparent"
                                            to: "#eb4d53"
                                            duration: 500
                                        }
                                        ColorAnimation {
                                            target: gRPPAGE7
                                            property: "border.color"
                                            from: "#eb4d53"
                                            to: "transparent"
                                            duration: 500
                                        }
                                    }
                                }
                                Image {
                                    id: imagePage7b
                                    scale:1
                                    source: "qrc:/qml/7b.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage7b
                                        onPositionChanged: {
                                            imagePage7b.x += mouse.x - mouse.startX;
                                            imagePage7b.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage7b.scale *= zoomFactor;
                                            } else {
                                                imagePage7b.scale /= zoomFactor;
                                            }
                                            if(imagePage7b.scale<1/2){
                                                imagePage7b.scale=1/2
                                            }
                                            else if(imagePage7b.scale>3){
                                                imagePage7b.scale=3
                                            }
                                        }
                                    }
                                }

                            }
                        }
                    }
                    Item {
                        id: slide8
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:150
                            y:50
                            RowLayout{
                                Image {
                                    id: imagePage8
                                    scale:1
                                    source: "qrc:/qml/8.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage8
                                        onPositionChanged: {
                                            imagePage8.x += mouse.x - mouse.startX;
                                            imagePage8.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage8.scale *= zoomFactor;
                                            } else {
                                                imagePage8.scale /= zoomFactor;
                                            }
                                            if(imagePage8.scale<1/2){
                                                imagePage8.scale=1/2
                                            }
                                            else if(imagePage8.scale>3){
                                                imagePage8.scale=3
                                            }
                                        }
                                    }
                                }

                            }
                            RowLayout{
                                GroupBox{
                                    id:page8Tiltle
                                    implicitHeight: text8.height
                                    implicitWidth:400
                                    TextArea{
                                        id:text8
                                        anchors.fill: parent.Center
                                        text: " یک نمای کلی از پکت هایی که در کلاس ClusterProcessor\n استفاده می شوندو در کلاس های بعدی مورد بررسی قرار \nمیگیرند.\n
آبی: کلاس اصلی دریافت پکت هااز Ethernet\n
سبز: نام پکت ها\n
زرد: نام کلاس ها"
                                    }
                                    background: Rectangle {
                                        id:gRPPAGE8
                                        color: "transparent"
                                        border.color: "transparent"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: page8Tiltle
                                        onPositionChanged: {
                                            textcolorPage8.start()
                                            textAnimPage8.start()
                                            page8Tiltle.x += mouse.x - mouse.startX;
                                            page8Tiltle.y += mouse.y - mouse.startY;
                                            if(page8Tiltle.y <page2.y){
                                                page8Tiltle.x= page2.x
                                                page8Tiltle.y= page2.y
                                            }
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                page8Tiltle.scale *= zoomFactor;
                                            } else {
                                                page8Tiltle.scale /= zoomFactor;
                                            }
                                            if(page8Tiltle.scale<1/2){
                                                page8Tiltle.scale=1/2
                                            }
                                            else if(page8Tiltle.scale>3){
                                                page8Tiltle.scale=3
                                            }
                                        }
                                    }
                                    PropertyAnimation {
                                        id: textAnimPage8
                                        target: gRPPAGE8
                                        property: "border.width"
                                        from: 3
                                        to: 1
                                        duration: 2000
                                    }
                                    SequentialAnimation {
                                        id: textcolorPage8

                                        ColorAnimation {
                                            target: gRPPAGE8
                                            property: "border.color"
                                            from: "transparent"
                                            to: "#eb4d53"
                                            duration: 500
                                        }
                                        ColorAnimation {
                                            target: gRPPAGE8
                                            property: "border.color"
                                            from: "#eb4d53"
                                            to: "transparent"
                                            duration: 500
                                        }
                                    }
                                }
                                Image {
                                    id: imagePage8b
                                    scale:1
                                    source: "qrc:/qml/7b.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage8b
                                        onPositionChanged: {
                                            imagePage8b.x += mouse.x - mouse.startX;
                                            imagePage8b.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage8b.scale *= zoomFactor;
                                            } else {
                                                imagePage8b.scale /= zoomFactor;
                                            }
                                            if(imagePage8b.scale<1/2){
                                                imagePage8b.scale=1/2
                                            }
                                            else if(imagePage8b.scale>3){
                                                imagePage8b.scale=3
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide9
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:150
                            y:50
                            spacing: 30
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Generative Adversarial Networks:"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            RowLayout{
                                Image {
                                    id: imagePage9
                                    scale:1
                                    source: "qrc:/qml/9.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage9
                                        onPositionChanged: {
                                            imagePage9.x += mouse.x - mouse.startX;
                                            imagePage9.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage9.scale *= zoomFactor;
                                            } else {
                                                imagePage9.scale /= zoomFactor;
                                            }
                                            if(imagePage9.scale<1/2){
                                                imagePage9.scale=1/2
                                            }
                                            else if(imagePage9.scale>3){
                                                imagePage9.scale=3
                                            }
                                        }
                                    }
                                }
                            }
                            GroupBox{
                                id:page9Tiltle
                                implicitHeight: 170
                                implicitWidth:650
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                TextArea{
                                    id:text9
                                    anchors.fill: parent.Center
                                    text: ". consist of two parts: a generator network, which creates new data instances, and a
discriminator  network, which  tries to distinguish between real  and  fake  instances.
The  generator and  discriminator  are  trained  together,  with  the   generator  trying
to  fool  the  discriminator  and the discriminator trying to correctly identify  real  vs.
instances. Over  time, the  generator  becomes better at creating data that looks like
fake the real thing,  and the discriminator  becomes better at distinguishing  between
real and fake data."
                                    color: "black"
                                }
                                background: Rectangle {
                                    id:gRPPAGE9
                                    color: "#DEE2ED"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page9Tiltle
                                    onPositionChanged: {
                                        textcolorPage9.start()
                                        textAnimPage9.start()
                                        page9Tiltle.x += mouse.x - mouse.startX;
                                        page9Tiltle.y += mouse.y - mouse.startY;
                                        if(page9Tiltle.y <page2.y){
                                            page9Tiltle.x= page2.x
                                            page9Tiltle.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page9Tiltle.scale *= zoomFactor;
                                        } else {
                                            page9Tiltle.scale /= zoomFactor;
                                        }
                                        if(page9Tiltle.scale<1/2){
                                            page9Tiltle.scale=1/2
                                        }
                                        else if(page9Tiltle.scale>3){
                                            page9Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage9
                                    target: gRPPAGE9
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage9

                                    ColorAnimation {
                                        target: gRPPAGE9
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE9
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide10
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:350
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Denoising & Super-Resolution:"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }

                            ColumnLayout{
                                spacing: 40
                                GroupBox{
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                    id:page10Tiltle
                                    implicitHeight: 170
                                    implicitWidth:900
                                    TextArea{
                                        id:text10
                                        anchors.fill: parent.Center
                                        text: ".Denoising  is a  critical  aspect of image restoration, aiming to  remove noise
from a noisy image to restore the true image. This process is challenging due
to the difficulty in distinguishing noise, edges, and texture, which are all high-
frequency  components. As  a  result,  the  denoised i mages may  lose  some
details. "
                                        color: "black"
                                        font.pixelSize: 25
                                    }
                                    background: Rectangle {
                                        id:gRPPAGE10
                                        color: "#DEE2ED"
                                        border.color: "transparent"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: page10Tiltle
                                        onPositionChanged: {
                                            textcolorPage10.start()
                                            textAnimPage10.start()
                                            page10Tiltle.x += mouse.x - mouse.startX;
                                            page10Tiltle.y += mouse.y - mouse.startY;
                                            if(page10Tiltle.y <page2.y){
                                                page10Tiltle.x= page2.x
                                                page10Tiltle.y= page2.y
                                            }
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                page10Tiltle.scale *= zoomFactor;
                                            } else {
                                                page10Tiltle.scale /= zoomFactor;
                                            }
                                            if(page10Tiltle.scale<1/2){
                                                page10Tiltle.scale=1/2
                                            }
                                            else if(page10Tiltle.scale>3){
                                                page10Tiltle.scale=3
                                            }
                                        }
                                    }
                                    PropertyAnimation {
                                        id: textAnimPage10
                                        target: gRPPAGE10
                                        property: "border.width"
                                        from: 3
                                        to: 1
                                        duration: 2000
                                    }
                                    SequentialAnimation {
                                        id: textcolorPage10

                                        ColorAnimation {
                                            target: gRPPAGE10
                                            property: "border.color"
                                            from: "transparent"
                                            to: "#eb4d53"
                                            duration: 500
                                        }
                                        ColorAnimation {
                                            target: gRPPAGE10
                                            property: "border.color"
                                            from: "#eb4d53"
                                            to: "transparent"
                                            duration: 500
                                        }
                                    }
                                }
                                GroupBox{
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                    id:page10Tiltle2
                                    implicitHeight: 300
                                    implicitWidth:900
                                    TextArea{
                                        anchors.fill: parent.Center
                                        implicitHeight: 300
                                        text: ".Super-resolution  is  another  crucial   aspect  of  image  restoration,  aiming  to
enhance the  resolution  of  a  low-resolution image. This  process  involves the
generation of high-quality details that were not  present  in  the  original  low-
resolution image.

.In the context of super-resolution, the generator takes a low-resolution image as
input  and  outputs  a  high-resolution  image.  The  discriminator then assesses
whether the output image is real or fake. "
                                        color: "black"
                                        font.pixelSize: 25
                                    }
                                    background: Rectangle {
                                        id:gRPPAGE102
                                        color: "#DEE2ED"
                                        border.color: "transparent"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: page10Tiltle2
                                        onPositionChanged: {
                                            textcolorPage102.start()
                                            textAnimPage102.start()
                                            page10Tiltle2.x += mouse.x - mouse.startX;
                                            page10Tiltle2.y += mouse.y - mouse.startY;
                                            if(page10Tiltle2.y <page2.y){
                                                page10Tiltle2.x= page2.x
                                                page10Tiltle2.y= page2.y
                                            }
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                page10Tiltle2.scale *= zoomFactor;
                                            } else {
                                                page10Tiltle2.scale /= zoomFactor;
                                            }
                                            if(page10Tiltle2.scale<1/2){
                                                page10Tiltle2.scale=1/2
                                            }
                                            else if(page10Tiltle2.scale>3){
                                                page10Tiltle2.scale=3
                                            }
                                        }
                                    }
                                    PropertyAnimation {
                                        id: textAnimPage102
                                        target: gRPPAGE102
                                        property: "border.width"
                                        from: 3
                                        to: 1
                                        duration: 2000
                                    }
                                    SequentialAnimation {
                                        id: textcolorPage102

                                        ColorAnimation {
                                            target: gRPPAGE102
                                            property: "border.color"
                                            from: "transparent"
                                            to: "#eb4d53"
                                            duration: 500
                                        }
                                        ColorAnimation {
                                            target: gRPPAGE102
                                            property: "border.color"
                                            from: "#eb4d53"
                                            to: "transparent"
                                            duration: 500
                                        }
                                    }
                                }
                            }
                        }

                    }
                    Item {
                        id: slide11
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:350
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " A. Network Architecture: Discriminator"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            ColumnLayout{
                                spacing: 20
                                RowLayout{
                                    Image {
                                        id: imagePage11
                                        scale:1
                                        source: "qrc:/qml/11.PNG"
                                        Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                        MouseArea {
                                            anchors.fill: parent
                                            drag.target: imagePage11
                                            onPositionChanged: {
                                                imagePage11.x += mouse.x - mouse.startX;
                                                imagePage11.y += mouse.y - mouse.startY;
                                            }
                                            onWheel: {
                                                var zoomFactor = 1.1;
                                                if (wheel.angleDelta.y > 0) {
                                                    imagePage11.scale *= zoomFactor;
                                                } else {
                                                    imagePage11.scale /= zoomFactor;
                                                }
                                                if(imagePage11.scale<1/2){
                                                    imagePage11.scale=1/2
                                                }
                                                else if(imagePage11.scale>3){
                                                    imagePage11.scale=3
                                                }
                                            }
                                        }
                                    }
                                }
                                GroupBox{
                                    id:page11Tiltle
                                    implicitHeight:220
                                    implicitWidth:1000
                                    TextArea{
                                        id:text11
                                        anchors.fill: parent.Center
                                        text: "Discriminator: We adopt the same discriminator as Real-ESRGAN.

The discriminator is designed to evaluate the perceptual quality of the fake images.

The method employs a U-Net structure, which is a type of fully convolutional neural network (FCN) architecture.

The U-Net structure is composed of two main parts: an encoder and a decoder."

                                        color: "black"
                                        font.pixelSize: 20
                                    }
                                    background: Rectangle {
                                        id:gRPPAGE11
                                        color: "#DEE2ED"
                                        border.color: "transparent"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: page11Tiltle
                                        onPositionChanged: {
                                            textcolorPage11.start()
                                            textAnimPage11.start()
                                            page11Tiltle.x += mouse.x - mouse.startX;
                                            page11Tiltle.y += mouse.y - mouse.startY;
                                            if(page11Tiltle.y <page2.y){
                                                page11Tiltle.x= page2.x
                                                page11Tiltle.y= page2.y
                                            }
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                page11Tiltle.scale *= zoomFactor;
                                            } else {
                                                page11Tiltle.scale /= zoomFactor;
                                            }
                                            if(page11Tiltle.scale<1/2){
                                                page11Tiltle.scale=1/2
                                            }
                                            else if(page11Tiltle.scale>3){
                                                page11Tiltle.scale=3
                                            }
                                        }
                                    }
                                    PropertyAnimation {
                                        id: textAnimPage11
                                        target: gRPPAGE11
                                        property: "border.width"
                                        from: 3
                                        to: 1
                                        duration: 2000
                                    }
                                    SequentialAnimation {
                                        id: textcolorPage11

                                        ColorAnimation {
                                            target: gRPPAGE11
                                            property: "border.color"
                                            from: "transparent"
                                            to: "#eb4d53"
                                            duration: 500
                                        }
                                        ColorAnimation {
                                            target: gRPPAGE11
                                            property: "border.color"
                                            from: "#eb4d53"
                                            to: "transparent"
                                            duration: 500
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide12
                        anchors.fill:parent
                        anchors.centerIn: parent.Center
                        ColumnLayout{
                            anchors.fill: parent.Center
                            x:350
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " B. Network Architecture: Generator"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            RowLayout{
                                Image {
                                    id: imagePage12
                                    scale:1
                                    source: "qrc:/qml/12.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage12
                                        onPositionChanged: {
                                            imagePage12.x += mouse.x - mouse.startX;
                                            imagePage12.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage12.scale *= zoomFactor;
                                            } else {
                                                imagePage12.scale /= zoomFactor;
                                            }
                                            if(imagePage12.scale<1/2){
                                                imagePage12.scale=1/2
                                            }
                                            else if(imagePage12.scale>3){
                                                imagePage12.scale=3
                                            }
                                        }
                                    }
                                }
                            }
                            GroupBox{
                                id:page12Tiltle
                                implicitHeight:220
                                implicitWidth:1000
                                TextArea{
                                    id:text12
                                    anchors.fill: parent.Center
                                    text: "(a) The structure  of  the improved  Residual-in-Residual  Dense  Block  (IRRDB),where we specify  the  residual
      scaling parameter (Beta=0.2) and add Gaussian noise in output of each Dense block.

(b) The structure of Dense Block.

The generator is engineered to produce HR images from LR inputs. The structure accepts a low-quality image
and generates a high-definition output."

                                    color: "black"
                                    font.pixelSize: 20
                                }
                                background: Rectangle {
                                    id:gRPPAGE12
                                    color: "#DEE2ED"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: page12Tiltle
                                    onPositionChanged: {
                                        textcolorPage12.start()
                                        textAnimPage12.start()
                                        page12Tiltle.x += mouse.x - mouse.startX;
                                        page12Tiltle.y += mouse.y - mouse.startY;
                                        if(page12Tiltle.y <page2.y){
                                            page12Tiltle.x= page2.x
                                            page12Tiltle.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            page12Tiltle.scale *= zoomFactor;
                                        } else {
                                            page12Tiltle.scale /= zoomFactor;
                                        }
                                        if(page12Tiltle.scale<1/2){
                                            page12Tiltle.scale=1/2
                                        }
                                        else if(page12Tiltle.scale>3){
                                            page12Tiltle.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage12
                                    target: gRPPAGE12
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPage12

                                    ColorAnimation {
                                        target: gRPPAGE12
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: gRPPAGE12
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide13
                        anchors.fill:parent
                        ColumnLayout{
                            x:400
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " B. Network Architecture: Generator"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }

                            ColumnLayout{
                                Image {
                                    id: imagePage131
                                    scale:1
                                    source: "qrc:/qml/13.1.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage131
                                        onPositionChanged: {
                                            imagePage131.x += mouse.x - mouse.startX;
                                            imagePage131.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage131.scale *= zoomFactor;
                                            } else {
                                                imagePage131.scale /= zoomFactor;
                                            }
                                            if(imagePage131.scale<1/2){
                                                imagePage131.scale=1/2
                                            }
                                            else if(imagePage131.scale>3){
                                                imagePage131.scale=3
                                            }
                                        }
                                    }
                                }
                                Image {
                                    id: imagePage132
                                    scale:1
                                    source: "qrc:/qml/13.2.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage132
                                        onPositionChanged: {
                                            imagePage132.x += mouse.x - mouse.startX;
                                            imagePage132.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage132.scale *= zoomFactor;
                                            } else {
                                                imagePage132.scale /= zoomFactor;
                                            }
                                            if(imagePage132.scale<1/2){
                                                imagePage132.scale=1/2
                                            }
                                            else if(imagePage132.scale>3){
                                                imagePage132.scale=3
                                            }
                                        }
                                    }
                                }
                                Image {
                                    id: imagePage133
                                    scale:1
                                    source: "qrc:/qml/13.3.PNG"
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                    MouseArea {
                                        anchors.fill: parent
                                        drag.target: imagePage133
                                        onPositionChanged: {
                                            imagePage133.x += mouse.x - mouse.startX;
                                            imagePage133.y += mouse.y - mouse.startY;
                                        }
                                        onWheel: {
                                            var zoomFactor = 1.1;
                                            if (wheel.angleDelta.y > 0) {
                                                imagePage133.scale *= zoomFactor;
                                            } else {
                                                imagePage133.scale /= zoomFactor;
                                            }
                                            if(imagePage133.scale<1/2){
                                                imagePage133.scale=1/2
                                            }
                                            else if(imagePage133.scale>3){
                                                imagePage133.scale=3
                                            }
                                        }
                                    }
                                }
                            }
                            Image {
                                id: imagePage13
                                scale:1
                                source: "qrc:/qml/13.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage13
                                    onPositionChanged: {
                                        imagePage13.x += mouse.x - mouse.startX;
                                        imagePage13.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage13.scale *= zoomFactor;
                                        } else {
                                            imagePage13.scale /= zoomFactor;
                                        }
                                        if(imagePage13.scale<1/2){
                                            imagePage13.scale=1/2
                                        }
                                        else if(imagePage13.scale>3){
                                            imagePage13.scale=3
                                        }
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide14
                        anchors.fill:parent
                        ColumnLayout{
                            x:400
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " B. Network Architecture: Degredation"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage14
                                scale:1
                                source: "qrc:/qml/14.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage14
                                    onPositionChanged: {
                                        imagePage14.x += mouse.x - mouse.startX;
                                        imagePage14.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage14.scale *= zoomFactor;
                                        } else {
                                            imagePage14.scale /= zoomFactor;
                                        }
                                        if(imagePage14.scale<1/2){
                                            imagePage14.scale=1/2
                                        }
                                        else if(imagePage14.scale>3){
                                            imagePage14.scale=3
                                        }
                                    }
                                }
                            }
                            Image {
                                //                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                id: imagePage142
                                scale:1
                                source: "qrc:/qml/14.2.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage142
                                    onPositionChanged: {
                                        imagePage142.x += mouse.x - mouse.startX;
                                        imagePage142.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage142.scale *= zoomFactor;
                                        } else {
                                            imagePage142.scale /= zoomFactor;
                                        }
                                        if(imagePage142.scale<1/2){
                                            imagePage142.scale=1/2
                                        }
                                        else if(imagePage142.scale>3){
                                            imagePage142.scale=3
                                        }
                                    }
                                }
                            }
                        }
                    }


                    Item {
                        id: slide15
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: SR"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage15
                                scale:1
                                source: "qrc:/qml/Results/15.1.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage15
                                    onPositionChanged: {
                                        imagePage15.x += mouse.x - mouse.startX;
                                        imagePage15.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage15.scale *= zoomFactor;
                                        } else {
                                            imagePage15.scale /= zoomFactor;
                                        }
                                        if(imagePage15.scale<1/2){
                                            imagePage15.scale=1/2
                                        }
                                        else if(imagePage15.scale>3){
                                            imagePage15.scale=3
                                        }
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide16
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: SR"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage152
                                scale:1
                                source: "qrc:/qml/Results/15.2.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage152
                                    onPositionChanged: {
                                        imagePage152.x += mouse.x - mouse.startX;
                                        imagePage152.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage152.scale *= zoomFactor;
                                        } else {
                                            imagePage152.scale /= zoomFactor;
                                        }
                                        if(imagePage152.scale<1/2){
                                            imagePage152.scale=1/2
                                        }
                                        else if(imagePage152.scale>3){
                                            imagePage152.scale=3
                                        }
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide17
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: SR"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage153
                                scale:1
                                source: "qrc:/qml/Results/15.3.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage153
                                    onPositionChanged: {
                                        imagePage153.x += mouse.x - mouse.startX;
                                        imagePage153.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage153.scale *= zoomFactor;
                                        } else {
                                            imagePage153.scale /= zoomFactor;
                                        }
                                        if(imagePage153.scale<1/2){
                                            imagePage153.scale=1/2
                                        }
                                        else if(imagePage153.scale>3){
                                            imagePage153.scale=3
                                        }
                                    }
                                }
                            }

                        }
                    }
                    Item {
                        id: slide18
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            spacing: 0
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: SR"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage154
                                scale:1
                                source: "qrc:/qml/Results/15.4.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage154
                                    onPositionChanged: {
                                        imagePage154.x += mouse.x - mouse.startX;
                                        imagePage154.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage154.scale *= zoomFactor;
                                        } else {
                                            imagePage154.scale /= zoomFactor;
                                        }
                                        if(imagePage154.scale<1/2){
                                            imagePage154.scale=1/2
                                        }
                                        else if(imagePage154.scale>3){
                                            imagePage154.scale=3
                                        }
                                    }
                                }
                            }
                            Image {
                                id: imagePage155
                                scale:1
                                source: "qrc:/qml/Results/15.5.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage155
                                    onPositionChanged: {
                                        imagePage155.x += mouse.x - mouse.startX;
                                        imagePage155.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage155.scale *= zoomFactor;
                                        } else {
                                            imagePage155.scale /= zoomFactor;
                                        }
                                        if(imagePage155.scale<1/2){
                                            imagePage155.scale=1/2
                                        }
                                        else if(imagePage155.scale>3){
                                            imagePage155.scale=3
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide19
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            spacing: 0
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: JPEG Compression"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage156
                                scale:1
                                source: "qrc:/qml/Results/15.6.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage156
                                    onPositionChanged: {
                                        imagePage156.x += mouse.x - mouse.startX;
                                        imagePage156.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage156.scale *= zoomFactor;
                                        } else {
                                            imagePage156.scale /= zoomFactor;
                                        }
                                        if(imagePage156.scale<1/2){
                                            imagePage156.scale=1/2
                                        }
                                        else if(imagePage156.scale>3){
                                            imagePage156.scale=3
                                        }
                                    }
                                }
                            }
                            Image {
                                id: imagePage157
                                scale:1
                                source: "qrc:/qml/Results/15.7.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage157
                                    onPositionChanged: {
                                        imagePage157.x += mouse.x - mouse.startX;
                                        imagePage157.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage157.scale *= zoomFactor;
                                        } else {
                                            imagePage157.scale /= zoomFactor;
                                        }
                                        if(imagePage157.scale<1/2){
                                            imagePage157.scale=1/2
                                        }
                                        else if(imagePage157.scale>3){
                                            imagePage157.scale=3
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide20
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            spacing: 0
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Comparison and Evaluation Results: Gaussian Denoising"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage158
                                scale:1
                                source: "qrc:/qml/Results/15.8.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage158
                                    onPositionChanged: {
                                        imagePage158.x += mouse.x - mouse.startX;
                                        imagePage158.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage158.scale *= zoomFactor;
                                        } else {
                                            imagePage158.scale /= zoomFactor;
                                        }
                                        if(imagePage158.scale<1/2){
                                            imagePage158.scale=1/2
                                        }
                                        else if(imagePage158.scale>3){
                                            imagePage158.scale=3
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Item {
                        id: slide21
                        anchors.fill:parent
                        Layout.alignment: Qt.AlignRight
                        RowLayout{
                            id:rowplots
                            Layout.alignment: Qt.AlignRight
                            anchors.top: rowplots.top
                            GroupBox{
                                id:settingGroupboxPlot
                                implicitHeight: 220
                                implicitWidth: 170
                                anchors.left: parent.left
                                Layout.alignment: Qt.AlignTop
                                background: Rectangle {
                                    id:settingGroupboxPlotBG
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: settingGroupboxPlot
                                    onPositionChanged: {
                                        greenLightDancesetting.start()
                                        borderWidthAnimationsetting.start()
                                        settingGroupboxPlot.x += mouse.x - mouse.startX;
                                        settingGroupboxPlot.y += mouse.y - mouse.startY;
                                        if(settingGroupboxPlot.y <page2.y){
                                            settingGroupboxPlot.x= page2.x
                                            settingGroupboxPlot.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            settingGroupboxPlot.scale *= zoomFactor;
                                        } else {
                                            settingGroupboxPlot.scale /= zoomFactor;
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: borderWidthAnimationsetting
                                    target: settingGroupboxPlotBG
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: greenLightDancesetting

                                    ColorAnimation {
                                        target: settingGroupboxPlotBG
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: settingGroupboxPlotBG
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }

                                ColumnLayout{
                                    ComboBox {
                                        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                        Material.theme: Material.Light
                                        implicitWidth: 100
                                        id: comboboxPlot
                                        font.pixelSize: 10
                                        anchors.centerIn: parent.Center
                                        model: ["Live", "Offline"]
                                        Material.foreground: "#BF3F26"
                                        Material.background: "#343434"
                                        onActivated: {
                                            if(comboboxPlot.currentText==="Live"){
                                                comboSequentialAnimReverse.start()
                                                //                                                ParamScript.changeVisibleToTrue(groupboxplots)
                                                //                                                ParamScript.changeVisibleToFalse(groupboxPlotsOffline)
                                            }
                                            if(comboboxPlot.currentText==="Offline"){
                                                comboSequentialAnim.start()
                                                //                                                ParamScript.changeVisibleToFalse(groupboxplots)
                                                //                                                ParamScript.changeVisibleToTrue(groupboxPlotsOffline)
                                            }
                                        }
                                        SequentialAnimation {
                                            id: comboSequentialAnim
                                            PropertyAnimation {
                                                id: comboAnimation
                                                target: groupboxplots
                                                property: "visible"
                                                from: true
                                                to: false
                                                duration: 200
                                            }
                                            PropertyAnimation {
                                                id: comboAnimation2
                                                target: groupboxPlotsOffline
                                                property: "visible"
                                                from: false
                                                to: true
                                                duration: 300
                                            }
                                        }
                                        SequentialAnimation {
                                            id: comboSequentialAnimReverse

                                            PropertyAnimation {
                                                id: comboAnimation2Reverse
                                                target: groupboxPlotsOffline
                                                property: "visible"
                                                from: true
                                                to: false
                                                duration: 300
                                            }
                                            PropertyAnimation {
                                                id: comboAnimationReverse
                                                target: groupboxplots
                                                property: "visible"
                                                from: false
                                                to: true
                                                duration: 200
                                            }
                                        }
                                    }
                                    RowLayout{
                                        Layout.alignment: Qt.AlignRight
                                        ColumnLayout{
                                            Button{
                                                text:"start1"
                                                onClicked: startplot1(true);
                                            }
                                            Button{
                                                text:"start3"
                                                onClicked: startplot3(true);
                                            }
                                        }
                                        ColumnLayout{
                                            Button{
                                                text:"start2"
                                                onClicked: startplot2(true);
                                            }
                                            Button{
                                                text:"start4"
                                                onClicked: startplot4(true);
                                            }
                                        }
                                    }
                                    Button{
                                        text:"Clear All"
                                        Layout.alignment: Qt.AlignCenter
                                        onClicked: {
                                            resultPoints1.clear()
                                            resultPoints1.clear()
                                            resultPoints2.clear()
                                            resultPoints3.clear()
                                            resultPoints4.clear()
                                            resultPointss1.clear()
                                            resultPointss1.clear()
                                            resultPointss2.clear()
                                            resultPointss3.clear()
                                            resultPointss4.clear()
                                            resultPointsss1.clear()
                                            resultPointsss1.clear()
                                            resultPointsss2.clear()
                                            resultPointsss3.clear()
                                            resultPointsss4.clear()
                                            resultPointssss1.clear()
                                            resultPointssss1.clear()
                                            resultPointssss2.clear()
                                            resultPointssss3.clear()
                                            resultPointssss4.clear()
                                        }
                                    }
                                }
                            }
                            GroupBox{
                                id:groupboxplots
                                Layout.alignment: Qt.AlignRight
                                visible: true
                                implicitHeight: (page2.height-100)
                                implicitWidth: (page2.width-300)
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: groupboxplots
                                    onPositionChanged: {
                                        groupboxplots.x += mouse.x - mouse.startX;
                                        groupboxplots.y += mouse.y - mouse.startY;
                                        if(groupboxplots.y <page2.y){
                                            groupboxplots.y= page2.y
                                        }
                                        if(groupboxplots.x <page2.x){
                                            groupboxplots.x= page2.x-20
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            groupboxplots.scale *= zoomFactor;
                                        } else {
                                            groupboxplots.scale /= zoomFactor;
                                        }
                                    }
                                }
                                ColumnLayout{
                                    Layout.alignment: Qt.AlignRight
                                    RowLayout{
                                        GroupBox{
                                            anchors.centerIn: parent.Center
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            MyChart {
                                                anchors.fill:parent
                                                id: chartMultiCrossPath
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                property var listSeriesMultiCrossPath: []
                                                title: "Evaluation Plots "

                                                ValueAxis {
                                                    id: xAxisMultiCrossPath
                                                    min: 0.9612
                                                    max: 0.9636
                                                    titleText: "PSNR"
                                                    titleVisible: true
                                                }
                                                axes: [xAxisMultiCrossPath]
                                                ValueAxis {
                                                    id: yAxisMultiCrossPath
                                                    min: 38.20
                                                    max:  38.45
                                                    titleText: "SSIM"
//                                                    labelFormat: "%g"
                                                }
                                                ScatterSeries {
                                                    id:resultPoints1
                                                    name: "IRGAN"
                                                    color:"purple"
                                                    axisX: xAxisMultiCrossPath
                                                    axisY: yAxisMultiCrossPath
                                                }
                                                ScatterSeries {
                                                    id:resultPoints2
                                                    name: "SwinIR"
                                                    color:"red"
                                                    axisX: xAxisMultiCrossPath
                                                }
                                                ScatterSeries {
                                                    id:resultPoints3
                                                    name: "Real-ESRGAN"
                                                    color:"blue"
                                                }
                                                ScatterSeries {
                                                    id:resultPoints4
                                                    name: "IPT"
                                                    color:"YELLOW"
                                                }
                                                onZoomChanged: {
                                                    xAxisMultiCrossPath.applyNiceNumbers()
                                                    yAxisMultiCrossPath.applyNiceNumbers()
                                                }
                                            }
                                        }
                                        //                                        }
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            MyChart {
                                                anchors.fill:parent
                                                id: chartMultiCrossPath2
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                property var listSeriesMultiCrossPath: []
                                                title: "Evaluation Plots "
                                                ValueAxis {
                                                    id: xAxisMultiCrossPath2
                                                    min: 0.92125
                                                    max: 0.92325
                                                    titleText: "PSNR"
                                                    titleVisible: true
                                                }
                                                ValueAxis {
                                                    id: yAxisMultiCrossPath2
                                                    min: 34.00
                                                    max:  34.25
                                                    titleText: "SSIM"
                                                    labelFormat: "%g"

                                                }
                                                ScatterSeries {
                                                    id:resultPointss1
                                                    name: "IRGAN"
                                                    color:"purple"
                                                    axisX: xAxisMultiCrossPath2
                                                    axisY: yAxisMultiCrossPath2
                                                }
                                                ScatterSeries {
                                                    id:resultPointss2
                                                    name: "SwinIR"
                                                    color:"red"
                                                }
                                                ScatterSeries {
                                                    id:resultPointss3
                                                    name: "Real-ESRGAN"
                                                    color:"blue"
                                                }
                                                ScatterSeries {
                                                    id:resultPointss4
                                                    name: "Real-ESRGAN"
                                                    color:"YELLOW"
                                                }
                                                onZoomChanged: {
                                                    xAxisMultiCrossPath2.applyNiceNumbers()
                                                    yAxisMultiCrossPath2.applyNiceNumbers()
                                                }
                                            }
                                        }
                                    }
                                    RowLayout{
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            MyChart {
                                                anchors.fill:parent
                                                id: chartMultiCrossPath3
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                property var listSeriesMultiCrossPath: []
                                                title: "Evaluation Plots "
                                                ValueAxis {
                                                    id: xAxisMultiCrossPath3
                                                    min: 0.9024
                                                    max: 0.9032
                                                    titleText: "PSNR"
                                                    titleVisible: true
                                                }
                                                ValueAxis {
                                                    id: yAxisMultiCrossPath3
                                                    min: 32.40
                                                    max:  32.45
                                                    titleText: "SSIM"
                                                    labelFormat: "%g"
                                                }
                                                ScatterSeries {
                                                    id:resultPointsss1
                                                    name: "IRGAN"
                                                    color:"purple"
                                                    axisX: xAxisMultiCrossPath3
                                                    axisY: yAxisMultiCrossPath3
                                                }
                                                ScatterSeries {
                                                    id:resultPointsss2
                                                    name: "SwinIR"
                                                    XYPoint { x: 1.9; y: 3.3 }
                                                    color:"red"
                                                }
                                                ScatterSeries {
                                                    id:resultPointsss3
                                                    name: "Real-ESRGAN"
                                                    color:"blue"
                                                }
                                                ScatterSeries {
                                                    id:resultPointsss4
                                                    name: "Real-ESRGAN"
                                                    color:"YELLOW"
                                                }
                                                onZoomChanged: {
                                                    xAxisMultiCrossPath3.applyNiceNumbers()
                                                    yAxisMultiCrossPath3.applyNiceNumbers()
                                                }
                                            }
                                        }
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            MyChart {
                                                anchors.fill:parent
                                                id: chartMultiCrossPath4
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                property var listSeriesMultiCrossPath: []
                                                title: "Evaluation Plots "

                                                ValueAxis {
                                                    id: xAxisMultiCrossPath4
                                                    min: 0.9612
                                                    max: 0.9636
                                                    titleText: "PSNR"
                                                    titleVisible: true
                                                }
                                                axes: [xAxisMultiCrossPath4]
                                                ValueAxis {
                                                    id: yAxisMultiCrossPath4
                                                    min: 38.20
                                                    max:  38.45
                                                    titleText: "SSIM"
//                                                    labelFormat: "%g"
                                                }
                                                ScatterSeries {
                                                    id:resultPointssss1
                                                    name: "IRGAN"
                                                    color:"purple"
                                                    axisX: xAxisMultiCrossPath4
                                                    axisY: yAxisMultiCrossPath4
                                                }
                                                ScatterSeries {
                                                    id:resultPointssss2
                                                    name: "SwinIR"
                                                    color:"red"
                                                    axisX: xAxisMultiCrossPath4
                                                }
                                                ScatterSeries {
                                                    id:resultPointssss3
                                                    name: "Real-ESRGAN"
                                                    color:"blue"
                                                }
                                                ScatterSeries {
                                                    id:resultPointssss4
                                                    name: "IPT"
                                                    color:"YELLOW"
                                                }
                                                onZoomChanged: {
                                                    xAxisMultiCrossPath4.applyNiceNumbers()
                                                    yAxisMultiCrossPath4.applyNiceNumbers()
                                                }
                                            }
                                            }
                                    }
                                }
                            }
                            GroupBox{
                                implicitWidth: (page2.width-100)
                                id:groupboxPlotsOffline
                                Layout.alignment: Qt.AlignRight
                                visible: false
                                ColumnLayout{
                                    Layout.alignment: Qt.AlignRight
                                    RowLayout{
                                        GroupBox{
                                            anchors.centerIn: parent.Center
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            Image {
                                                id: image1
                                                source: "qrc:/qml/Results/plot/1.PNG"
                                                height: parent.height
                                                width: parent.width
                                                MouseArea {
                                                    anchors.fill: parent
                                                    drag.target: image1
                                                    onPositionChanged: {
                                                        image1.x += mouse.x - mouse.startX;
                                                        image1.y += mouse.y - mouse.startY;
                                                    }
                                                    onWheel: {
                                                        var zoomFactor = 1.1;
                                                        if (wheel.angleDelta.y > 0) {
                                                            image1.scale *= zoomFactor;
                                                        }
                                                        else {
                                                            image1.scale /= zoomFactor;
                                                        }
                                                        if(image1.scale<1){
                                                            image1.scale=1
                                                        }

                                                    }
                                                }
                                            }
                                        }
                                        //                                        }
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            Image {
                                                id: image2
                                                source: "qrc:/qml/Results/plot/2.PNG"
                                                height: parent.height
                                                width: parent.width
                                                MouseArea {
                                                    anchors.fill: parent
                                                    drag.target: image2
                                                    onPositionChanged: {
                                                        image2.x += mouse.x - mouse.startX;
                                                        image2.y += mouse.y - mouse.startY;
                                                    }
                                                    onWheel: {
                                                        var zoomFactor = 1.1;
                                                        if (wheel.angleDelta.y > 0) {
                                                            image2.scale *= zoomFactor;
                                                        } else {
                                                            image2.scale /= zoomFactor;
                                                        }
                                                        if(image2.scale<1){
                                                            image2.scale=1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    RowLayout{
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            Image {
                                                id: image3
                                                source: "qrc:/qml/Results/plot/3.PNG"
                                                height: parent.height
                                                width: parent.width
                                                MouseArea {
                                                    anchors.fill: parent
                                                    drag.target: image3
                                                    onPositionChanged: {
                                                        image3.x += mouse.x - mouse.startX;
                                                        image3.y += mouse.y - mouse.startY;
                                                    }
                                                    onWheel: {
                                                        var zoomFactor = 1.1;
                                                        if (wheel.angleDelta.y > 0) {
                                                            image3.scale *= zoomFactor;
                                                        } else {
                                                            image3.scale /= zoomFactor;
                                                        }
                                                        if(image3.scale<1){
                                                            image3.scale=1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        GroupBox{
                                            implicitHeight: (page2.height-200)/2
                                            implicitWidth: (page2.width-400)/2
                                            Image {
                                                id: image4
                                                source: "qrc:/qml/Results/plot/4.PNG"
                                                height: parent.height
                                                width: parent.width
                                                MouseArea {
                                                    anchors.fill: parent
                                                    drag.target: image4
                                                    onPositionChanged: {
                                                        image4.x += mouse.x - mouse.startX;
                                                        image4.y += mouse.y - mouse.startY;
                                                    }
                                                    onWheel: {
                                                        var zoomFactor = 1.1;
                                                        if (wheel.angleDelta.y > 0) {
                                                            image4.scale *= zoomFactor;
                                                        } else {
                                                            image4.scale /= zoomFactor;
                                                        }
                                                        if(image4.scale<1){
                                                            image4.scale=1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Item {
                        id: slide22
                        anchors.fill:parent
                        ColumnLayout{
                            x:300
                            y:50
                            GroupBox{
                                implicitHeight: page2.height/8
                                implicitWidth:parent.width
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height
                                    text: " Conclusion:"
                                    font.bold: true
                                    font.pixelSize: 35
                                }
                            }
                            Image {
                                id: imagePage17
                                scale:1
                                source: "qrc:/qml/17.PNG"
                                Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: imagePage17
                                    onPositionChanged: {
                                        imagePage17.x += mouse.x - mouse.startX;
                                        imagePage17.y += mouse.y - mouse.startY;
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            imagePage17.scale *= zoomFactor;
                                        } else {
                                            imagePage17.scale /= zoomFactor;
                                        }
                                        if(imagePage17.scale<1/2){
                                            imagePage17.scale=1/2
                                        }
                                        else if(imagePage17.scale>3){
                                            imagePage17.scale=3
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        id: slide23
                        anchors.fill:parent
                        ColumnLayout{
                            y:220
                            anchors.centerIn: parent.bottom
                            GroupBox{
                                id:goodByeTitleid
                                implicitHeight: page2.height/7
                                implicitWidth:page2.width-10
                                background: Rectangle {
                                    id:goodbyeRect
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                                Label{
                                    width: parent.width
                                    height: parent.height/2
                                    text: "Thanks any Question?"
                                    font.pixelSize: 40
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    drag.target: goodByeTitleid
                                    onPositionChanged: {
                                        textcolorPageGoodBye.start()
                                        textAnimPage7GoodBye.start()
                                        goodByeTitleid.x += mouse.x - mouse.startX;
                                        goodByeTitleid.y += mouse.y - mouse.startY;
                                        if(goodByeTitleid.y <page2.y){
                                            goodByeTitleid.x= page2.x
                                            goodByeTitleid.y= page2.y
                                        }
                                    }
                                    onWheel: {
                                        var zoomFactor = 1.1;
                                        if (wheel.angleDelta.y > 0) {
                                            goodByeTitleid.scale *= zoomFactor;
                                        } else {
                                            goodByeTitleid.scale /= zoomFactor;
                                        }
                                        if(goodByeTitleid.scale<1/2){
                                            goodByeTitleid.scale=1/2
                                        }
                                        else if(goodByeTitleid.scale>3){
                                            goodByeTitleid.scale=3
                                        }
                                    }
                                }
                                PropertyAnimation {
                                    id: textAnimPage7GoodBye
                                    target: goodbyeRect
                                    property: "border.width"
                                    from: 3
                                    to: 1
                                    duration: 2000
                                }
                                SequentialAnimation {
                                    id: textcolorPageGoodBye

                                    ColorAnimation {
                                        target: goodbyeRect
                                        property: "border.color"
                                        from: "transparent"
                                        to: "#eb4d53"
                                        duration: 500
                                    }
                                    ColorAnimation {
                                        target: goodbyeRect
                                        property: "border.color"
                                        from: "#eb4d53"
                                        to: "transparent"
                                        duration: 500
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Drawer{
            id: serialsdrawer
            width: mainn.width
            Material.theme: Material.Dark
            Material.accent: "#eb4d53"
            height: 50
            dim:false
            edge:Qt.TopEdge
            TabBar {
                id: bar
                anchors.fill:parent
                implicitWidth: mainn.width-page1.width
                TabButton {
                    text: qsTr("0")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("1")
                    onClicked: {
                        outlinebutton.clicked()
                    }
                }
                TabButton {
                    text: qsTr("2")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("3")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("4")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("5")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("6")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("7")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("8")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("9")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("10")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("11")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("12")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("13")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("13")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("14")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("15")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("16")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("17")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("18")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("19")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("20")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("21")
                    onClicked: {
                    }
                }
                TabButton {
                    text: qsTr("22")
                    onClicked: {
                    }
                }
            }
            StackView {
                id: stackView
                anchors.fill: parent
            }
        }
    }
}











