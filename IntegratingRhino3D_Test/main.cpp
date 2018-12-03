#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "Backend.h"
#include "serial.h"

static QObject *singletonTypeProvider(QQmlEngine *, QJSEngine *){
    return Serial::getGetInstance();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterSingletonType<Serial>("Serial", 1, 0, "Serial", singletonTypeProvider);

   qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");

   // Serial *serial = new Serial;



    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
