#include "udpclient.h"

#include <QtDebug>

UdpClient* UdpClient::instances = nullptr;

UdpClient::UdpClient(QObject *parent):
    QUdpSocket(parent)
{
    UdpClient::bind(45454, QUdpSocket::ShareAddress);
}

UdpClient *UdpClient::getInstance(){
    if ( instances == nullptr)
        instances = new UdpClient;
    return instances;
}

qreal UdpClient::dataTurntable(){
    return vTurntable;
}

qreal UdpClient::dataSholder(){
    return vSholder;
}

qreal UdpClient::dataElbow(){
    return vElbow;
}

qreal UdpClient::dataWrist(){
    return  vWrist;
}
qreal UdpClient::dataFlipper(){
    return vFlipper;
}

qreal UdpClient::dataCompass()
{
    return vCompass;
}

qreal UdpClient::dataBattery()
{
    return vBattery;
}

void UdpClient::processPendingDatagrams()
{
    while (UdpClient::hasPendingDatagrams()) {
        datagram.resize(int(UdpClient::pendingDatagramSize()));
        UdpClient::readDatagram(datagram.data(), datagram.size());

    }
    QDataStream in(&datagram, QIODevice::ReadOnly);
    in.setVersion(QDataStream::Qt_5_11);
    in>>vFlipper>>vTurntable>>vSholder>>vElbow>>vWrist>>vBattery>>vCompass;

    emit signal();
    hitungan++;
    qDebug()<<"Data ke: "<<hitungan<<", "<<datagram.size();

}
