QT += quick quickcontrols2 qml widgets network 3dquick 3danimation 3dquickextras 3dcore 3drender 3dinput 3dlogic 3dextras
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    udpclient.cpp \
    radialbar.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = /home/wildanadt/Qt/5.12.0/gcc_64/qml
#QML_IMPORT_PATH = /home/wildanadt/Qt/5.12.0/android_armv7/qml
# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    obj/ball.obj \
    obj/base.obj \
    obj/elbow.obj \
    obj/flipper.obj \
    obj/roda.obj \
    obj/sholder.obj \
    obj/turntable.obj \
    obj/untitled.obj \
    obj/wrist.obj \
    qtquickcontrols2.conf \
    ObjectRhino.qml \
    main.qml \
    main.qml \
    MainGUI.qml \
    mainGUI2.qml \
    ObjectRhino.qml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/.gradle/4.6/fileChanges/last-build.bin \
    android/.gradle/4.6/fileHashes/fileHashes.lock \
    android/.gradle/4.6/taskHistory/taskHistory.lock \
    android/.gradle/buildOutputCleanup/buildOutputCleanup.lock \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/.gradle/buildOutputCleanup/cache.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/AndroidManifest(bu).xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

HEADERS += \
    udpclient.h \
    radialbar.h

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
