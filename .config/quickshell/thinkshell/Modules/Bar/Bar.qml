import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import qs.Services
import qs.Config
import qs.Modules.Bar.Widgets

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: Style.barHeight

  Rectangle {
    id: background
    anchors.fill: parent
    color: Style.background
  }

  // Bar widgets
  IconImage {
      source: "/home/strongwall3/.config/quickshell/thinkshell/Modules/Bar/volume-2.svg"
  }

  RowLayout {
    id: barItemsLeft
    anchors.left: parent.left

    Workspaces {}

  }

  RowLayout {
    id: barItemsCenter

    anchors.horizontalCenter: parent.horizontalCenter

    Clock {}

  }

  RowLayout {
    id: barItemsRight

    anchors.right: parent.right

    Clock {}
    Workspaces {}
  }

}
