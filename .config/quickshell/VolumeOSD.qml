import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }

  Connections {
    target: Pipewire.defaultAudioSink?.audio

    function onVolumeChanged() {
      root.shouldShowOsd = true;
      hideTimer.restart();
    }
  }

  property bool shouldShowOsd: false

  Timer {
    id: hideTimer
    interval: 1000
    onTriggered: root.shouldShowOsd = false
  }

  LazyLoader {
    active: root.shouldShowOsd

    PanelWindow {
      anchors.bottom: true
      margins.bottom: screen.height / 5
      exclusiveZone: 0

      implicitWidth: 180
      implicitHeight: 60

      mask: Region {}

      Rectangle {
        anchors.fill: parent

        border {
          color: "#ff0055"
          width: 2
        }

        color: "#120B10"

        RowLayout {
          anchors {
            fill: parent
            leftMargin: 8
            rightMargin: 8
          }

          Text {
            color: "#00FFC8"
            text: "VOL"

            font {
              family: "3270NerdFont"
              pixelSize: 16
            }
          }

          Rectangle {
            Layout.fillWidth: true

            implicitHeight: 16
            color: "#777777"

            Rectangle {
              anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
              }

              color: "#00FFC8"

              implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
              radius: parent.radius
            }
          }
        }
      }
    }
  }
}
