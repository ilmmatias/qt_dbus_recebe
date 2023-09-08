import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: qsTr("Aplicação")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: principal
    }

    Principal {
        id: principal
        visible: false
    }

    Recebe {
        id: recebe
        visible: false
    }
}
