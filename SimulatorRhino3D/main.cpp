#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <Qt3DQuick/QQmlAspectEngine>

#include <QGuiApplication>
#include <QtQml>
#include <Qt3DCore>

#include <QQmlContext>
#include <QQuickView>

#include "serial.h"
#include "udpclient.h"

static QObject *singletonTypeProvider(QQmlEngine *, QJSEngine *){
    return Serial::getGetInstance();
}

static QObject *singletonUdp(QQmlEngine *, QJSEngine *){
    return UdpClient::getInstance();
}

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    Qt3DExtras::Quick::Qt3DQuickWindow view;

   // QQuickView view;
    //view.resize(800,600);
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    Serial *configPointer =  Serial::getGetInstance();
    UdpClient *configUdp = UdpClient::getInstance();

    qmlRegisterType<Qt3DCore::QTransform>("io.qt.transform.trans",1,0,"Trans");
    //qmlRegisterType<Serial>("io.qt.serial",1, 0, "Serial");
    qmlRegisterSingletonType<Serial>("Serial", 1, 0, "Serial", singletonTypeProvider);
    qmlRegisterSingletonType<UdpClient>("UdpClient", 1, 0, "UdpClient", singletonUdp);

    QObject::connect(configUdp, SIGNAL(readyRead()), configUdp, SLOT(processPendingDatagrams()));
    QObject::connect(configPointer, SIGNAL(readyRead()), configPointer, SLOT(terimaData()));

    //object.engine()->qmlEngine()->rootContext()->setContextProperty("_window", &view);
    // Expose the window as a context property so we can set the aspect ratio
    view.engine()->qmlEngine()->rootContext()->setContextProperty("_window", &view);
    //view.rootContext()->setContextProperty("_window", &view);

    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    return app.exec();
}
