#ifndef SERIAL_H
#define SERIAL_H

#include <QtSerialPort/QSerialPort>
#include <QObject>
#include <QSettings>


class Serial :  public QSerialPort
{
    static Serial* instance;
    Q_OBJECT
    Q_PROPERTY(qreal data READ data NOTIFY buff)
    explicit Serial(QObject *parent = nullptr);

public:

    struct Nilai{
        qreal m_turntable;
        qreal m_sholder;
    };
    qreal data(){return m_turntable;}
    static Serial *getGetInstance();

    qreal turnTableValue(){return m_turntable;}
    qreal sholderValue(){return m_sholder;}
    qreal elbowValue(){return m_elbow;}


public slots:
    
    void terimaData();

signals:

    void buff();

private:
    qreal nilai =0.0;
    qreal m_sholder,m_elbow,m_wrist,
            m_turntable,m_flipper =0;


};

#endif // SERIAL_H
