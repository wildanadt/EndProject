QT +=  quickwidgets 3dquickextras 3dcore 3drender 3dinput 3dlogic 3dextras qml quick 3dquick 3danimation network serialport widgets
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    serial.cpp \
    linker.cpp \
    udpclient.cpp

RESOURCES += qml.qrc

QT += 3dextras
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = /home/wildanadt/Qt/5.11.2/gcc_64/qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../../Model3D_Robot/modifed/base.obj \
    ../../Model3D_Robot/modifed/flipper.obj \
    ../../Model3D_Robot/modifed/roda.obj \
    ../../Model3D_Robot/modifed/turntable.obj

HEADERS += \
    serial.h \
    linker.h \
    udpclient.h
