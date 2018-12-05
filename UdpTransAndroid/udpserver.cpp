#include "udpserver.h"
#include "ui_udpserver.h"

#include <QUdpSocket>
#include <QtDebug>
#include <QApplication>
#include <QDesktopWidget>
#include <QCoreApplication>

UdpServer::UdpServer(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::UdpServer)
{
    ui->setupUi(this);
    udpSocket = new QUdpSocket(this);
}

UdpServer::~UdpServer()
{
    delete ui;
}

void UdpServer::sendData(){
    udpSocket->writeDatagram(datagram, QHostAddress::Broadcast,45454);

    pesan++;

    qDebug()<<"Data ke: "<<pesan;
}


void UdpServer::on_Turntable1_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("TT++");

    sendData();
}

void UdpServer::on_Turntable2_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("TT--");

    sendData();
}

void UdpServer::on_Sholder1_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("SH++");

    sendData();

}

void UdpServer::on_Sholder2_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("SH--");

    sendData();

}

void UdpServer::on_Elbow1_pressed(){
        QDataStream out(&datagram, QIODevice::WriteOnly);
        out.setVersion(QDataStream::Qt_5_11);
        out<<QString("EL++");

        sendData();

}

void UdpServer::on_Elbow2_pressed(){
        QDataStream out(&datagram, QIODevice::WriteOnly);
        out.setVersion(QDataStream::Qt_5_11);
        out<<QString("EL--");

        sendData();
}

void UdpServer::on_Wrist1_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("WR++");

    sendData();

}

void UdpServer::on_Wrist2_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("WR--");

    sendData();
}

void UdpServer::on_Flipper1_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("FL++");

    sendData();

}

void UdpServer::on_Flipper2_pressed(){
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<QString("FL--");

    sendData();
}
