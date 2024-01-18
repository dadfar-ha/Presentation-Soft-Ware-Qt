QT += quick
QT += serialport
QT += widgets
QT += quick widgets core gui
QT += datavisualization charts
QT += serialport network
QT += concurrent
QT += svg
CONFIG += c++20
QT += quickcontrols2
QT += sql
QT += network
QT += charts

win32:RC_ICONS =  $$PWD/icons/Presentation.ico
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        plotinfo.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    plotinfo.h
