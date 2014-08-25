/****************************************************************************
 * This file is part of Hawaii Shell.
 *
 * Copyright (C) 2014 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:LGPL2.1+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2 as QtControlsStyle
import Hawaii.Shell.Controls 1.0 as Controls
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import "private/Utils.js" as Utils

QtControlsStyle.CalendarStyle {
    id: style
    background: Item {}
    gridColor: Qt.rgba(255, 255, 255, 0.3) //Utils.rgba(PlasmaColor.ColorScope.textColor, 0.4)
    gridVisible: true
    navigationBar: RowLayout {
        width: parent.width
        spacing: units.smallSpacing

        Controls.ToolButton {
            iconSize: units.iconSizes.small
            iconName: "go-previous-symbolic"
            flat: true
            onClicked: control.showPreviousMonth()

            Layout.alignment: Qt.AlignLeft
        }

        PlasmaExtras.Heading {
            level: 3
            text: styleData.title
            font.capitalization: Font.Capitalize
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideRight

            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
        }

        Controls.ToolButton {
            iconSize: units.iconSizes.small
            iconName: "go-next-symbolic"
            flat: true
            onClicked: control.showNextMonth()

            Layout.alignment: Qt.AlignRight
        }
    }
    dayDelegate: Item {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            anchors.margins: styleData.selected ? -1 : 0
            border.color: "transparent"
            color: styleData.date !== undefined && styleData.selected ? theme.viewFocusColor : "transparent"
        }

        PlasmaComponents.Label {
            id: label
            anchors.centerIn: parent
            color: {
                var theColor = Utils.rgba(PlasmaCore.ColorScope.textColor, 0.5); //Qt.lighter(PlasmaCore.ColorScope.textColor, 1.4);
                if (styleData.valid) {
                    theColor = styleData.visibleMonth ? Qt.darker(PlasmaCore.ColorScope.textColor, 1.2) : Qt.ligther(PlasmaCore.ColorScope.textColor, 1.35);
                    if (styleData.selected)
                        theColor = PlasmaCore.ColorScope.highlightColor;
                }
                return theColor;
            }
            text: styleData.date.getDate()
        }
    }
    dayOfWeekDelegate: Rectangle {
        color: style.gridVisible ? Utils.rgba(PlasmaCore.ColorScope.backgroundColor, 0.5) : "transparent"
        implicitHeight: theme.mSize(theme.smallestFont).height

        PlasmaComponents.Label {
            anchors.centerIn: parent
            text: control.__locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
            font: theme.smallestFont
        }
    }
    weekNumberDelegate: Item {
        implicitWidth: 2 * theme.mSize(theme.smallestFont).width + units.smallSpacing

        PlasmaComponents.Label {
            anchors.centerIn: parent
            text: styleData.weekNumber
            font: theme.smallestFont
        }
    }
}
