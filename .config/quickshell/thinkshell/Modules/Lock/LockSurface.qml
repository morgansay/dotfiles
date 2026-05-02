import QtQuick
import QtQuick.Effects
import Quickshell.Wayland
import qs.components
import qs.services
import qs.config

WlSessionLockSurface {
  id: root

  required property WlSessionLock lock
  required property Pam pam

  Rectangle {
    Button {
      text: "It's not working, let me out!"
      onClicked: lock.locked = false;
    }

    ColumnLayout {
      anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
      }

      RowLayout {
        TextField {
          id: passwordBox

          implicitWidth: 400
          padding: 10

          focus: true

        }

        Button {
          text: "Unlock"
          padding: 10

          focusPolicy: Qt.NoFocus
        }
      }
    }
  }

}