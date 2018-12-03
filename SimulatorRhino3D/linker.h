#ifndef LINKER_H
#define LINKER_H

#include <QObject>

class Linker : public QObject
{
    Q_OBJECT
public:
    explicit Linker(QObject *parent = nullptr);
    static Linker *tt();

signals:

public slots:
};

#endif // LINKER_H
