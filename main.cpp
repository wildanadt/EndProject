#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickItem>
#include <QScreen>
//#include <FelgoApplication>


#include "udpclient.h"
#include "radialbar.h"

static QObject *singletonUdp(QQmlEngine *, QJSEngine *){
    return UdpClient::getInstance();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<RadialBar>("CustomControls", 1, 0, "RadialBar");
    qmlRegisterSingletonType(QUrl("qrc:/ScreenScale.qml"), "Scale", 1, 0, "Scaling");
    UdpClient *configUdp = UdpClient::getInstance();
    qmlRegisterSingletonType<UdpClient>("UdpClient", 1, 0, "UdpClient", singletonUdp);
    QObject::connect(configUdp, SIGNAL(readyRead()), configUdp, SLOT(processPendingDatagrams()));

//    QQuickView view;

//    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.setSource(QUrl("qrc:/main.qml"));
//    view.resize(500,500);
//    view.setWidth(800);
//    //view.showMaximized();


    QSurfaceFormat format;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(3, 2);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
    format.setDepthBufferSize(24);
    format.setStencilBufferSize(8);
    format.setSamples(4);
    QSurfaceFormat::setDefaultFormat(format);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
