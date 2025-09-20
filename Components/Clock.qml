// Config created by Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
// Copyright (C) 2022-2025 Keyitdev
// Based on https://github.com/MarianArlt/sddm-sugar-dark
// Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects

Column {
    id: clock

    width: parent.width / 2
    spacing: 0

    Label {
        id:headerTextLabel

        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: root.font.pointSize * 2.8
        color: config.HeaderTextColor
        renderType: Text.QtRendering
        text: config.HeaderText
        layer.enabled: true
        layer.effect: MultiEffect {
        	shadowEnabled: true
        	shadowColor: "#20333f"
        	shadowBlur: 1.0
        	shadowHorizontalOffset: 0
        	shadowVerticalOffset: 3
        }
    }

    Label {
        id: timeLabel

        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: root.font.pointSize * 8
        font.bold: true
        color: config.TimeTextColor
        renderType: Text.QtRendering

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)
        }
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#20333f"
            shadowBlur: 0.9
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 2
        }
    }

    Label {
        id: dateLabel

        anchors.horizontalCenter: parent.horizontalCenter
        
        color: config.DateTextColor
        font.pointSize: root.font.pointSize * 1.5
        font.bold: true
        renderType: Text.QtRendering

        function updateTime() {
            text = new Date().toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat)}

		layer.enabled: true
   		layer.effect: MultiEffect {
       		shadowEnabled: true
       		shadowColor: "#20333f"
       		shadowBlur: 0.9
       		shadowHorizontalOffset: 0
       		shadowVerticalOffset: 2
        }
    }

    Timer {
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime()
            timeLabel.updateTime()
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime()
        timeLabel.updateTime()
    }
}
