import QtQuick
import QtQuick.Controls.Fusion
import Quickshell
import Quickshell.Wayland

Scope {
  WlSessionLock {
    id: lock

    WlSessionLockSurface {
      Button {
        text: "Unlock"
        onClicked: lock.locked = false
      }
    }
  }
}
