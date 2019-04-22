#ifndef UDPCLIENT_H
#define UDPCLIENT_H

#include <QObject>
#include <QtWidgets>
#include <QUdpSocket>
#include <QQuickView>
class UdpClient : public QUdpSocket
{
    static UdpClient* instances;
    Q_OBJECT
    Q_PROPERTY(qreal dataTurntable READ dataTurntable NOTIFY signal)
    Q_PROPERTY(qreal dataSholder READ dataSholder NOTIFY signal)
    Q_PROPERTY(qreal dataElbow READ dataElbow NOTIFY signal)
    Q_PROPERTY(qreal dataWrist READ dataWrist NOTIFY signal)
    Q_PROPERTY(qreal dataFlipper READ dataFlipper NOTIFY signal)
    Q_PROPERTY(qreal dataBattery READ dataBattery NOTIFY signal)
    Q_PROPERTY(qreal dataCompass READ dataCompass NOTIFY signal)
    explicit UdpClient(QObject *parent = nullptr);
public:

    QUdpSocket *socket = nullptr;
    static UdpClient *getInstance();
    qreal dataTurntable();
    qreal dataSholder();
    qreal dataElbow();
    qreal dataWrist();
    qreal dataFlipper();
    qreal dataCompass();
    qreal dataBattery();
private slots:
    void processPendingDatagrams();
signals:
    void signal();
private:
    QByteArray datagram;
    QString robot = "rhino";
    qreal vTurntable =0;
    qint16 vSholder = 0, vElbow = 0, vWrist = 0,
    vFlipper = 0, vBattery = 77, vCompass =0, TT=0, SH=0, EL=0,
    WR=0, FL=0, XOR=0, BAT=0, COM=0, vcheckSum1 = 0,vcheckSum2=0;
    bool dataType = false;
    qint8 dataSize = 0, head1=0, head2=0;
    qreal data1Count=0, data2Count=0, allDataCount=0;
};

#endif // UDPCLIENT_H
