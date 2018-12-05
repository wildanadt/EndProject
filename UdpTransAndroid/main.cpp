#include "udpserver.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    UdpServer w;
    w.showMaximized();

    return a.exec();
}
