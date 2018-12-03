#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

public:
    explicit BackEnd(QObject *parent = nullptr);

    QString userName();
    void setUserName(QString &user);

signals:
    void userNameChanged();

private:
    QString m_userName = "Wildan Adition";
};

#endif // BACKEND_H
