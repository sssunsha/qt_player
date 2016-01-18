# Add more folders to ship with the application, here
folder_01.source = qml/qt_player
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    helpcpp.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    qt_player.qrc

OTHER_FILES += \
    image/pause.png \
    image/play.png

HEADERS += \
    helpcpp.h \
    root.h
