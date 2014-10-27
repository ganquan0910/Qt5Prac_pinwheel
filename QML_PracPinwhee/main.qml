import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Image {
          id: rect
          anchors.centerIn: parent
          source: "./pinwheel.png"

          MouseArea { id: mouseArea; anchors.fill: parent }

          states: State {
              name: "brighter"
              when: mouseArea.pressed
          }

          transitions: Transition {
              RotationAnimation{
                  property: "rotation"
                  duration:1500
                  target:rect;
                  from:0
                  to:360;
                  easing.type: Easing.OutCirc
              }
          }
      }
}
