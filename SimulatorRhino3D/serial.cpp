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

void Serial::terimaData()
{
    QByteArray data;
   // Nilai nilai;
    QString s;
    s=QString(data=readAll());

    if(s.contains("1")){
        m_turntable+=0.5;
        qDebug()<<"Turntable: "<<m_turntable;
    }
    if(s.contains("2")){
        m_turntable-=0.5;
        qDebug()<<"Sholder: "<<m_sholder;
    }

    emit buff();

   // emit buff(s);

}

