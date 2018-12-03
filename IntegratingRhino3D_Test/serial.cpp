#include "serial.h"

#include <QDebug>
#include <QSerialPortInfo>

Serial* Serial::instance = nullptr;

Serial::Serial(QObject *parent):QSerialPort(parent)
{

    foreach (const QSerialPortInfo &port, QSerialPortInfo::availablePorts())
    {
        setPort(port);
    }

    setBaudRate(QSerialPort::Baud9600);
    setDataBits(QSerialPort::Data8);
    setParity(QSerialPort::NoParity);
    setStopBits(QSerialPort::OneStop);
    setFlowControl(QSerialPort::NoFlowControl);
    open(QIODevice::ReadWrite);

}

Serial *Serial::getGetInstance()
{
    if (instance == nullptr)
        instance = new Serial;
    return instance;

}

int Serial::terimaData()
{
    QByteArray data;

    QString s;
    s=QString(data=readAll());

    if(s.contains("1")){
        nilai+=2;
        qDebug()<<nilai;
    }

    emit buff();

    return nilai;

   // emit buff(s);

}

