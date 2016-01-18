#include "helpcpp.h"
#include "root.h"

#include <QDebug>

HelpCpp::HelpCpp(QObject *parent) :
    QObject(parent)
{
}

void HelpCpp::printMessage(QString txt)
{
    qDebug() << "Message from QML: " << txt;
}

void HelpCpp::handleFullScreen(bool isFullScreen){

    handle_full_screen(isFullScreen);
}


void HelpCpp::setView(QtQuick2ApplicationViewer* v)
{
}
