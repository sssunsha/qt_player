#include <QtGui/QGuiApplication>
#include <QQmlEngine>
#include <QQmlComponent>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    QtQuick2ApplicationViewer viewer;

QtQuick2ApplicationViewer *v = new QtQuick2ApplicationViewer();
//    viewer.setMainQmlFile(QStringLiteral("qml/qt_player/main.qml"));
//      viewer.setMainQmlFile(QStringLiteral("qml/qt_player/test.qml"));
//      viewer.setMainQmlFile(QStringLiteral("qml/qt_player/animation.qml"));
//    viewer.setMainQmlFile(QStringLiteral("qml/qt_player/draw.qml"));
//    viewer.setMainQmlFile(QStringLiteral("qml/qt_player/Particle.qml"));
//      viewer.setMainQmlFile(QStringLiteral("qml/qt_player/loader.qml"));
//    viewer.setMainQmlFile(QStringLiteral("qml/qt_player/player.qml"));
    v->setMainQmlFile(QStringLiteral("qml/qt_player/player.qml"));
    v->showExpanded();

//    viewer.showExpanded();
//    viewer.showFullScreen();

//    QQmlEngine engine;
//    QQmlComponent component(&engine, "qml/qt_player/MyItem.qml");
//    QObject *object = component.create();

//    QVariant returnedValue;
//    QVariant msg = "Hello from C++";
//    QMetaObject::invokeMethod(object, "myQmlFunction",
//        Q_RETURN_ARG(QVariant, returnedValue),
//        Q_ARG(QVariant, msg));

//    qDebug() << "QML function returned:" << returnedValue.toString();
//    delete object;

    app.exec();
    delete v;
    v = NULL;
    return 0;
}
