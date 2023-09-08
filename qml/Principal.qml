import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    Row {
        anchors.centerIn: parent
        spacing: 16

        Button {
            text: qsTr("Receber")
            onClicked: stackView.push(recebe)
        }

        Button {
            text: qsTr("Encerrar")
            onClicked: Qt.quit()
        }
    }
}
