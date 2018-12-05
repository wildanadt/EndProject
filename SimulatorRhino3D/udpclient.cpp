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

void UdpClient::processPendingDatagrams()
{
    while (UdpClient::hasPendingDatagrams()) {
        datagram.resize(int(UdpClient::pendingDatagramSize()));
        UdpClient::readDatagram(datagram.data(), datagram.size());

    }
    QString string;
    QDataStream in(&datagram, QIODevice::ReadOnly);
    in.setVersion(QDataStream::Qt_5_11);
    in >> string;

    if (string == "TT++"){
        for(int i=0; i<10; i++){
            vTurntable+=0.1;
            QTimer time;
            time.start(10);
        }

    }

    else if (string == "TT--")
        vTurntable--;

    if (string == "SH++")
        vSholder++;

    else if (string == "SH--")
        vSholder--;

    if (string == "EL++")
        vElbow++;
    else if (string == "EL--")
        vElbow--;

    if (string == "WR++")
        vWrist++;
    else if (string == "WR--")
        vWrist--;

    if (string == "FL++")
        vFlipper++;
    else if (string == "FL--")
        vFlipper--;

    emit signal();
    hitungan++;
    qDebug()<<"Data ke: "<<hitungan<<", "<<datagram.size();

}
