#include "udpclient.h"
#include <QtDebug>

UdpClient* UdpClient::instances = nullptr;

UdpClient::UdpClient(QObject *parent):
    QUdpSocket(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(45454, QUdpSocket::ShareAddress);
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
    while (socket->hasPendingDatagrams()) {
        datagram.resize(int(socket->pendingDatagramSize()));
        socket->readDatagram(datagram.data(), datagram.size());

    }
        QDataStream in(&datagram, QIODevice::ReadOnly);
        //in.setVersion(QDataStream::Qt_5_11);
        in>>head1>>head2>>dataType>>dataSize;
        //qDebug()<<static_cast<char>(head1)<<static_cast<char>(head2);
        if(static_cast<char>(head1)=='R' && static_cast<char>(head2)=='H' && dataType==false){
            if(dataSize==5){
                in>>TT>>SH>>EL>>WR>>FL>>vcheckSum1;
                XOR = TT^SH^EL^WR^FL;
                if(XOR==vcheckSum1){
                    vTurntable=TT;
                    vSholder=SH;
                    vElbow=EL;
                    vWrist=WR;
                    vFlipper=FL;
                    ++data1Count;
                }

            }
            //qDebug()<<"data1"<<vTurntable<<" "<<vSholder<<" "<<vSholder<<" "<<vElbow<<" "<<vWrist<<" "<<vFlipper;

        }
        else if (static_cast<char>(head1)=='R' && static_cast<char>(head2)=='H' && dataType==true) {
            if(dataSize==2){
                in>>BAT>>COM>>vcheckSum2;
                XOR = BAT^COM;
                if(XOR==vcheckSum2){
                    vBattery=BAT;
                    vCompass=COM;
                    ++data2Count;
                }
            }
                    //qDebug()<<"data2"<<vBattery<<" "<<vCompass;
        }

       ++allDataCount;

    //qDebug()<<"Data ke: "<<hitungan<<", "<<datagram.size();
        qDebug()<<"Update paket data 1 = "<<data1Count;
        qDebug()<<"Update paket data 2 diterima = "<<data2Count;
        qDebug()<<"Total update paket data ="<<allDataCount<<"\n";
        emit signal();
}
