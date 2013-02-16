/****************************************************************************
 * This file is part of Widget Factory.
 *
 * Copyright (C) 2013 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:BSD$
 *
 * You may use this file under the terms of the BSD license as follows:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    * Redistributions of source code must retain the above copyright
 *      notice, this list of conditions and the following disclaimer.
 *    * Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *    * Neither the name of Pier Luigi Fiorini nor the
 *      names of its contributors may be used to endorse or promote products
 *      derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL $COPYRIGHT_HOLDER$ BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0
import QtDesktop 1.0
import QtDesktop.Styles 1.0

ApplicationWindow {
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480

    Column {
        id: contentRow
        anchors.fill: parent
        anchors.margins: 8
        spacing: 16

        /*
        Row {
            spacing: contentRow.spacing

            Column {
                Row {
                    Label {
                        text: qsTr("&Style:")
                    }

                    ComboBox {
                        model: styles
                    }
                }
            }
        }
        */

        Row {
            spacing: contentRow.spacing

            Column {
                spacing: contentRow.spacing

                GroupBox {
                    title: qsTr("Group 1")
                    adjustToContentSize: true
                    style: GroupBoxStyle {}

                    Column {
                        ExclusiveGroup {
                            id: exclusive
                        }
                        RadioButton {
                            text: qsTr("Radio button 1")
                            exclusiveGroup: exclusive
                            style: RadioButtonStyle {}
                        }
                        RadioButton {
                            text: qsTr("Radio button 2")
                            exclusiveGroup: exclusive
                            style: RadioButtonStyle {}
                        }
                        RadioButton {
                            text: qsTr("Radio button 3")
                            exclusiveGroup: exclusive
                            style: RadioButtonStyle {}
                        }
                        CheckBox {
                            text: qsTr("Tri-state check box")
                            style: CheckBoxStyle {}
                        }
                    }
                }
            }

            Column {
                spacing: contentRow.spacing

                GroupBox {
                    title: qsTr("Group 2")
                    adjustToContentSize: true
                    style: GroupBoxStyle {}

                    Column {
                        Button {
                            text: qsTr("Default Push Button")
                            defaultbutton: true
                            style: ButtonStyle {}
                        }
                        Button {
                            text: qsTr("Toggle Push Button")
                            style: ButtonStyle {}
                        }
                        Button {
                            text: qsTr("Flat Push Button")
                            style: ButtonStyle {}
                        }
                    }
                }
            }
        }

        ListModel {
            id: dummyModel
            Component.onCompleted: {
                for (var i = 0 ; i < 100 ; ++i)
                    append({"title": "Title #" + i, "name" : "Name #" + i})
            }
        }

        Row {
            spacing: contentRow.spacing

            Column {
                spacing: contentRow.spacing
                width: 300
                height: 300

                TabFrame {
                    width: parent.width
                    height: parent.height
                    style: TabFrameStyle {}

                    Tab {
                        title: qsTr("Table")

                        TableView {
                            anchors.fill: parent
                            model: dummyModel

                            TableColumn {
                                role: "title"
                                title: "Title"
                                width: 120
                            }
                            TableColumn {
                                role: "name"
                                title: "Name"
                                width: 120
                            }
                        }
                    }

                    Tab {
                        title: qsTr("Text Edit")

                        TextArea {
                            anchors.fill: parent
                            text: qsTr("Twinkle, twinkle, little star," +
                                       "How I wonder what you are." +
                                       "Up above the world so high," +
                                       "Like a diamond in the sky." +
                                       "Twinkle, twinkle, little star," +
                                       "How I wonder what you are!")
                        }
                    }
                }
            }

            Column {
                spacing: contentRow.spacing

                GroupBox {
                    title: qsTr("Group 3")
                    adjustToContentSize: true
                    style: GroupBoxStyle {}

                    Column {
                        spacing: contentRow.spacing

                        TextField {
                            id: textField
                            echoMode: TextInput.Password
                            style: TextFieldStyle {}
                        }
                        SpinBox {
                            width: textField.width
                            style: SpinBoxStyle {}
                        }
                    }
                }
            }
        }

        Timer {
            id: timer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if (progressBar.value >= 1.0)
                    progressBar.value = 0.0;
                else
                    progressBar.value += 0.1;
            }
        }

        Row {
            ProgressBar {
                id: progressBar
                style: ProgressBarStyle {}
            }
        }
    }
}
