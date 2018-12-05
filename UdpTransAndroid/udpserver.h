#ifndef UDPSERVER_H
#define UDPSERVER_H

#include <QWidget>
#include <QUdpSocket>

namespace Ui {
class UdpServer;
}

class UdpServer : public QWidget
{
    Q_OBJECT

public:
    //double Turntable() const;
    explicit UdpServer(QWidget *parent = nullptr);
    ~UdpServer();

private slots:

    void on_Turntable1_pressed();
    void on_Turntable2_pressed();
    void on_Sholder1_pressed();
    void on_Sholder2_pressed();

    void on_Elbow1_pressed();

    void on_Elbow2_pressed();

    void on_Wrist1_pressed();

    void on_Wrist2_pressed();

    void on_Flipper1_pressed();

    void on_Flipper2_pressed();

private:
    QByteArray datagram;
    QDataStream out;
    Ui::UdpServer *ui;
    void sendData();
    QUdpSocket *udpSocket = nullptr;
    qreal pesan = 0;
    qreal vTurntable, vSholder, vElbow, vWrist, vFlipper = 0;
};

#endif // UDPSERVER_H
