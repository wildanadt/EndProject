#ifndef UDPCLIENT_H
#define UDPCLIENT_H

#include <QObject>
#include <QtWidgets>
#include <QUdpSocket>
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

    // QUdpSocket *udpSocket = nullptr;
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
    qreal vSholder, vElbow, vWrist, vFlipper, vBattery, vCompass =0;
    qreal hitungan;


};

#endif // UDPCLIENT_H