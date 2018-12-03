#include "Backend.h"
#include "serial.h"

#include <qdebug.h>

BackEnd::BackEnd(QObject *parent):QObject(parent)
{
    Serial *configPointer = Serial::getGetInstance();

   // Serial *serial = new Serial;
    QObject::connect(configPointer, SIGNAL(readyRead()),configPointer,SLOT(terimaData()));
}

QString BackEnd::userName()
{
    Serial *configPointer = Serial::getGetInstance();
    QString string = QString::number(configPointer->data());

    qDebug()<<BackEnd::m_userName;
   // m_userName+=string;
    return m_userName ;
}

void BackEnd::setUserName(QString &user)
{

    if (user == m_userName )
        return;

    m_userName = user ;
    emit userNameChanged();
}
