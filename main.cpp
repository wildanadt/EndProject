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
    UdpClient *configUdp = UdpClient::getInstance();
    qmlRegisterSingletonType<UdpClient>("UdpClient", 1, 0, "UdpClient", singletonUdp);
    qmlRegisterType<RadialBar>("CustomControls", 1, 0, "RadialBar");
    qmlRegisterSingletonType(QUrl("qrc:/qml/qml/ScreenScale.qml"), "Scale", 1, 0, "Scaling");
    QSurfaceFormat format;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(3, 0);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
    format.setDepthBufferSize(24);
    format.setStencilBufferSize(8);
    format.setSamples(4);
    QSurfaceFormat::setDefaultFormat(format);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));
    QObject::connect(configUdp->socket, SIGNAL(readyRead()), configUdp, SLOT(processPendingDatagrams()));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
