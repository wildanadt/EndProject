#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>

#include <Qt3DCore>
#include "udpclient.h"


static QObject *singletonUdp(QQmlEngine *, QJSEngine *){
    return UdpClient::getInstance();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);



    QQuickView view;

    UdpClient *configUdp = UdpClient::getInstance();
    QObject::connect(configUdp, SIGNAL(readyRead()), configUdp, SLOT(processPendingDatagrams()));

    qmlRegisterType<Qt3DCore::QTransform>("io.qt.transform",1,0,"Transform");
    qmlRegisterSingletonType<UdpClient>("UdpClient", 1, 0, "UdpClient", singletonUdp);
    view.resize(500, 500);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/main.qml"));
    view.showMaximized();

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
