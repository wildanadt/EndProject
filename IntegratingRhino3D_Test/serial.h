#ifndef SERIAL_H
#define SERIAL_H

#include <QtSerialPort/QSerialPort>
#include <QObject>
#include <QSettings>


class Serial :  public QSerialPort
{
    static Serial* instance;
    Q_OBJECT
    Q_PROPERTY(int data READ data NOTIFY buff)
    explicit Serial(QObject *parent = nullptr);

public:


    int data() {return nilai;}
    static Serial *getGetInstance();

public slots:
    
    int terimaData();

signals:

    void buff();

private:
    int nilai =10;


};

#endif // SERIAL_H
