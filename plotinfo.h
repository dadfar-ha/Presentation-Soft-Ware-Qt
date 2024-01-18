#ifndef PLOTINFO_H
#define PLOTINFO_H
#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include <QDebug>
#include <QTimer>
#include <QVariant>
#include <QQuickWindow>
#include <fstream>
#include <sstream>
#include <QDate>
#include <QTime>
#include <iostream>
#include <cmath>
#include <QtCharts>
#include <QFont>
#include <algorithm>

class plotInfo : public QObject
{
    Q_OBJECT
public:
    explicit plotInfo(QObject *parent = nullptr);

    QVector<QPointF> vec2height;
    QLineSeries *heightLineSeries;
    QValueAxis *xAxisheight;
    QValueAxis *yAxisheight;

private:

signals:
    void plotStarts1(QVariant d ,QVariant d2,QVariant d3,QVariant d4,QVariant d5,QVariant d6,QVariant d7,QVariant d8,QVariant d9,QVariant d10);
    void plotStarts2(QVariant d ,QVariant d2,QVariant d3,QVariant d4,QVariant d5,QVariant d6,QVariant d7,QVariant d8,QVariant d9,QVariant d10);
    void plotStarts3(QVariant d ,QVariant d2,QVariant d3,QVariant d4,QVariant d5,QVariant d6,QVariant d7,QVariant d8,QVariant d9,QVariant d10);
    void plotStarts4(QVariant d ,QVariant d2,QVariant d3,QVariant d4,QVariant d5,QVariant d6,QVariant d7,QVariant d8,QVariant d9,QVariant d10);

public slots:
    void StartPlotting1(QVariant d);
    void StartPlotting2(QVariant d);
    void StartPlotting3(QVariant d);
    void StartPlotting4(QVariant d);


};
#endif // PLOTINFO_H
