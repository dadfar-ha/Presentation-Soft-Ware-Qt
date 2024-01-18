import QtQuick 2.0
import QtCharts 2.3

ChartView {
    id: root
    signal zoomChanged(var x,var y,var width,var height)
    theme:  ChartView.ChartThemeDark

    anchors.margins: -10

    MouseArea{
        anchors.fill: parent
        property double mousePressedX: 0
        property double mousePressedY: 0
        property bool leftButton: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        propagateComposedEvents: true
        //                    onDoubleClicked: chart1.zoomReset()
        onDoubleClicked: {
            root.zoomReset()
            //                        cp.rescaleChart1()
        }

        onPressed: {
            if(mouse.modifiers & Qt.ControlModifier)
                mouse.accepted = true;

//            console.log(mouseX,mouseY)
            mousePressedX = mouseX
            mousePressedY = mouseY
            rectZoom.x = mouseX
            if(mouse.button == Qt.LeftButton)
            {
                rectZoom.y = mouseY
                leftButton = true
            }
            else
            {
                rectZoom.y = plotArea.y
                leftButton = false
            }

            rectZoom.width = 0
            rectZoom.height = 0
            rectZoom.visible = true
//            mouse.accepted = false;
        }

        onPositionChanged: {
            if(rectZoom.visible){
                rectZoom.width = mouseX-rectZoom.x
//                rectZoom.height = mouseY-rectZoom.y
                if(leftButton)
                    rectZoom.height = mouseY-rectZoom.y
                else
                    rectZoom.height = plotArea.height
            }
        }

        onReleased: {
//            console.log(mouseX,mouseY)
//            console.log(mousePressedX,mousePressedY,mouseX,mouseY)
            var x = Math.min(mousePressedX,mouseX)
            var y = Math.min(mousePressedY,mouseY)
            var width = Math.abs(mouseX-mousePressedX)
            var height
            if(mouse.button == Qt.LeftButton)
                height = Math.abs(mouseY-mousePressedY)
            else
                height = plotArea.height

            root.zoomIn(Qt.rect(x,y, width, height))
            rectZoom.visible = true;
            zoomChanged(x,y,width,height)
            mouse.accepted = true;
        }

        onWheel: {
            if(wheel.angleDelta.y > 0){
                root.zoom(1.2)
            }
            else{
                root.zoom(0.8)
            }
        }
    }
    Rectangle {
        id: rectZoom
        color: "blue"
        opacity: 0.5
        visible: true
    }
}

