#pragma once

#include <QObject>
#include <qqml.h>

struct RecebeComando : public QObject {
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString topic MEMBER m_topic)

public:
    RecebeComando(void);

signals:
    void contentsChanged(QString contents);

private:
    QString m_topic;
};
