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
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_11);
    out<<vFlipper<<vTurntable<<vSholder<<vElbow<<vWrist<<vBattery<<vCompass;
    udpSocket->writeDatagram(datagram, QHostAddress::Broadcast,45454);

    pesan++;

    qDebug()<<"Data ke: "<<pesan;
}

void UdpServer::on_Turntable1_pressed(){
    vTurntable++;
    sendData();
}

void UdpServer::on_Turntable2_pressed(){
    vTurntable--;
    sendData();
}

void UdpServer::on_Sholder1_pressed(){
    vSholder++;
    sendData();
}

void UdpServer::on_Sholder2_pressed(){
    vSholder--;
    sendData();
}

void UdpServer::on_Elbow1_pressed(){
    vElbow++;
    sendData();
}

void UdpServer::on_Elbow2_pressed(){
    vElbow--;
    sendData();
}

void UdpServer::on_Wrist1_pressed(){
    vWrist++;
    sendData();
}

void UdpServer::on_Wrist2_pressed(){
    vWrist--;
    sendData();
}

void UdpServer::on_Flipper1_pressed(){
    vFlipper++;
    sendData();
}

void UdpServer::on_Flipper2_pressed(){
    vFlipper--;
    sendData();
}

void UdpServer::on_dial_valueChanged(int value)
{
    vCompass = value;
    sendData();
    qDebug()<<"Compass: "<<value;
}

void UdpServer::on_horizontalSlider_valueChanged(int value)
{
    vBattery = value;
    sendData();
    qDebug()<<"Battery: "<<value;
}
