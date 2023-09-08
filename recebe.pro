QT += dbus quick quickcontrols2
CONFIG += qmltypes

HEADERS = include/RecebeComando.hpp
INCLUDEPATH += include

SOURCES = src/main.cpp src/RecebeComando.cpp
OTHER_FILES = qml/main.qml qml/Principal.qml qml/Recebe.qml
RESOURCES = recebe_qml.qrc

QML_IMPORT_NAME = com.ilmmatias.recebe
QML_IMPORT_MAJOR_VERSION = 1
QML_IMPORT_MINOR_VERSION = 0

DBUS_ADAPTORS += com.ilmmatias.envia_recebe.xml
DBUS_INTERFACES += com.ilmmatias.envia_recebe.xml
