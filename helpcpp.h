#ifndef HELPCPP_H
#define HELPCPP_H
#include <QObject>
#include "qtquick2applicationviewer.h"

class HelpCpp : public QObject
{
    Q_OBJECT
public:
    explicit HelpCpp(QObject *parent = 0);
    Q_INVOKABLE void printMessage(QString txt);
    Q_INVOKABLE void handleFullScreen(bool isFullScreen);
    void setView(QtQuick2ApplicationViewer* v);


signals:

public slots:

private:

};

#endif // HELPCPP_H

