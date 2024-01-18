#include "qquickwindow.h"
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QVariant>
#include <QQmlContext>
#include <QThread>
#include <QQuickStyle>
#include <QGuiApplication>
#include <QIcon>
#include "plotinfo.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);
    app.setOrganizationName("Farateif");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("Accuracy_Check");
    app.setWindowIcon(QIcon(":/icons/Presentation.ico"));

    plotInfo                plott;
    QThread *threadplot= new QThread;
    threadplot->start();
    plott.moveToThread(threadplot);

    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    QObject* topLevel = engine.rootObjects().value(0);
    QQuickWindow* window = qobject_cast<QQuickWindow*>(topLevel);

    QObject::connect( window, SIGNAL(startplot1(QVariant)),&plott, SLOT(StartPlotting1(QVariant)), Qt::QueuedConnection);
    QObject::connect( window, SIGNAL(startplot2(QVariant)),&plott, SLOT(StartPlotting2(QVariant)), Qt::QueuedConnection);
    QObject::connect( window, SIGNAL(startplot3(QVariant)),&plott, SLOT(StartPlotting3(QVariant)), Qt::QueuedConnection);
    QObject::connect( window, SIGNAL(startplot4(QVariant)),&plott, SLOT(StartPlotting4(QVariant)), Qt::QueuedConnection);

    QObject::connect( &plott, SIGNAL(plotStarts1(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)),window, SLOT(winPlot1(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)), Qt::QueuedConnection);
    QObject::connect( &plott, SIGNAL(plotStarts2(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)),window, SLOT(winPlot2(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)), Qt::QueuedConnection);
    QObject::connect( &plott, SIGNAL(plotStarts3(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)),window, SLOT(winPlot3(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)), Qt::QueuedConnection);
    QObject::connect( &plott, SIGNAL(plotStarts4(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)),window, SLOT(winPlot4(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)), Qt::QueuedConnection);

    return app.exec();
}
