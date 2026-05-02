pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property real fontSize: 12;
    readonly property int radius: 6;

    readonly property int barHeight: 30;

    readonly property color background: "#000000";
    readonly property color main: "#ffffff";
}