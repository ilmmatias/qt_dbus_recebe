import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.15

import com.ilmmatias.recebe 1.0

Page {
    RecebeComando {
        id: "recebeComando"
        onContentsChanged: contents => {
            textArea.text += "[" + Qt.formatTime(new Date(), "hh:mm:ss") + "]: " + contents + "\n"
        }
    }

    ColumnLayout {
        anchors.fill: parent

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextArea {
                id: "textArea"
                readOnly: true
                selectByKeyboard: true
                selectByMouse: true
            }
        }

        Row {
            Layout.alignment: Qt.AlignHCenter
            padding: 4
            spacing: 4

            Button {
                text: qsTr("Voltar")
                onClicked: stackView.pop()
            }

            TextField {
                id: "topicInput"
                placeholderText: qsTr("Tópico...")
                onTextChanged: {
                    recebeComando.topic = topicInput.text
                    textArea.text = ""
                }
            }
        }
    }
}
