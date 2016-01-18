#include <QtGui/QGuiApplication>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QtQuick>
#include "qtquick2applicationviewer.h"
#include "helpcpp.h"
#include "root.h"
QtQuick2ApplicationViewer* m_view;

void handle_full_screen(bool isFullScreen)
{
    if(m_view)
    {
        if(isFullScreen)
        {
            m_view->showFullScreen();
        }
        else
        {
            m_view->showExpanded();
        }
    }
}


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QtQuick2ApplicationViewer viewer;
    m_view = &viewer;
    qmlRegisterType<HelpCpp>("HelpCpp", 1, 0, "HelpCpp");
//    HelpCpp helpcpp;
//    helpcpp.setView(viewer.getView());
//    HelpCpp::setView(viewer.getView());
    viewer.setMainQmlFile(QStringLiteral("qml/qt_player/player.qml"));
    viewer.showExpanded();




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

    return app.exec();
}
