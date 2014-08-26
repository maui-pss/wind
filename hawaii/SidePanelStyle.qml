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

import QtQuick 2.1
import Hawaii.Shell.Controls.Styles 1.0 as Styles
import Hawaii.Components 1.0 as Components
import org.kde.plasma.core 2.0 as PlasmaCore
import "private/Utils.js" as Utils

Styles.SidePanelStyle {
    id: style
    background: Rectangle {
        property color borderColor: Utils.rgba(Qt.darker(PlasmaCore.ColorScope.backgroundColor, 1.35), 0.5)

        color: Utils.rgba(PlasmaCore.ColorScope.backgroundColor, 0.95)

        Image {
            anchors.fill: parent
            source: "images/noise-texture.png"
            fillMode: Image.Tile
        }

        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 1
            color: borderColor
            antialiasing: true
            visible: style.control.location == PlasmaCore.Types.LeftEdge
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 1
            color: borderColor
            antialiasing: true
            visible: style.control.location == PlasmaCore.Types.TopEdge
        }

        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 1
            color: borderColor
            antialiasing: true
            visible: style.control.location == PlasmaCore.Types.RightEdge
        }

        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            height: 1
            color: borderColor
            antialiasing: true
            visible: style.control.location == PlasmaCore.Types.BottomEdge
        }
    }
}
