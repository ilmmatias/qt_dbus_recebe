#include <QDBusConnection>

#include "RecebeComando.hpp"
#include "envia_recebe_adaptor.h"
#include "envia_recebe_interface.h"

RecebeComando::RecebeComando(void) : QObject() {
    /* Validate if D-Bus is properly setup in the host; We should have a session bus accessible
       if that's the case. */
    auto sessionBus = QDBusConnection::sessionBus();
    if (!sessionBus.isConnected()) {
        qFatal("Cannot connect to the D-Bus session bus.");
    }

    /* Add our D-Bus interface. */
    new Envia_recebeAdaptor(this);
    sessionBus.registerObject("/", this);

    /* And connect to D-Bus, waiting for any messages from the `envia` program/server. */
    auto *iface = new com::ilmmatias::envia_recebe("", "", sessionBus, this);

    if (!connect(
        iface,
        &com::ilmmatias::envia_recebe::publicar,
        this,
        [this](const QString &topic, const QString &contents) {
            if (topic == m_topic) {
                emit contentsChanged(contents);
            }
        }
    )) {
        qFatal("Cannot hook onto messages from the D-Bus server.");
    }
}
