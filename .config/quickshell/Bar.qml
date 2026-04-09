import Quickshell
import QtQuick

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }
  
  implicitHeight: 30
  color: "#1a1b26"

  Item {
    id: modulesLeft
    
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }

    Clock {
      anchors.centerIn: parent
    }
  }


  Clock {
    anchors.centerIn: parent
  }
}
