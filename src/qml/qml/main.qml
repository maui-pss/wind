/****************************************************************************
**
** Copyright (C) 2013 Pier Luigi Fiorini.
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Controls 1.0

ApplicationWindow {
    title: "Widget Gallery"
    width: 380
    height: 480

    SystemPalette {
        id: palette
    }

    Rectangle {
        color: palette.window
        anchors.fill: parent
    }

    // Implements back key navigation
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            if (pageStack.depth > 1) {
                pageStack.pop();
                event.accepted = true;
            } else { Qt.quit(); }
        }
    }

    toolBar: Rectangle {
        width: parent.width
        height: 50
        color: Qt.darker(palette.window, 1.5)

        Rectangle {
            id: backButton
            anchors {
                left: parent.left
                leftMargin: 20
            }
            width: opacity ? 40 : 0
            height: 40
            opacity: pageStack.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            radius: 4
            color: backmouse.pressed ? Qt.darker(palette.window, 2.0) : "transparent"

            Behavior on opacity { NumberAnimation{} }

            Image {
                anchors.centerIn: parent
                source: "/images/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: pageStack.pop()
            }
        }

        Text {
            font.pixelSize: 32
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            anchors.centerIn: parent
            color: "white"
            text: "Widget Gallery"
        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Buttons"
            page: "ButtonPage.qml"
        }
        ListElement {
            title: "CheckBox"
            page: "CheckBoxPage.qml"
        }
        ListElement {
            title: "RadioButton"
            page: "RadioButtonPage.qml"
        }
        ListElement {
            title: "Sliders"
            page: "SliderPage.qml"
        }
        ListElement {
            title: "ProgressBar"
            page: "ProgressBarPage.qml"
        }
        ListElement {
            title: "Tabs"
            page: "TabBarPage.qml"
        }
        ListElement {
            title: "TextInput"
            page: "TextInputPage.qml"
        }
    }

    StackView {
        id: pageStack
        anchors.fill: parent

        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                anchors.fill: parent
                model: pageModel
                clip: true
                delegate: AndroidDelegate {
                    text: title
                    onClicked: pageStack.push(Qt.resolvedUrl(page))
                }
            }
        }
    }
}
