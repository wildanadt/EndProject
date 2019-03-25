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
                }
            }
                    //qDebug()<<"data2"<<vBattery<<" "<<vCompass;
        }

        else {
            return;
        }

    emit signal();
    hitungan++;
    //qDebug()<<"Data ke: "<<hitungan<<", "<<datagram.size();
}
