#include "plotinfo.h"


plotInfo::plotInfo(QObject *parent)
{

}

void plotInfo::StartPlotting1(QVariant d)
{
    bool flagplot=d.toBool();
    qDebug()<< "flagplot"<<flagplot;
    if(flagplot)
        emit plotStarts1(0.9620,38.32,0.9618,38.34,0.9620,38.35,0.9622,38.37,0.9625,38.42);
}

void plotInfo::StartPlotting2(QVariant d)
{
    bool flagplot=d.toBool();
    if(flagplot)
        emit plotStarts2(0.92172,34.16, 0.92260,34.13 ,0.922310,34.07 ,0.92270,34.14 ,0.9230,34.17);
}

void plotInfo::StartPlotting3(QVariant d)
{
    bool flagplot=d.toBool();
    if(flagplot)
        emit plotStarts3(0,0,1.1,2.1,1.9,3.3,2.1,2.1,2.9,4.9);
}

void plotInfo::StartPlotting4(QVariant d)
{
    bool flagplot=d.toBool();
    if(flagplot)
        emit plotStarts4(0,0,1.1,2.1,1.9,3.3,2.1,2.1,2.9,4.9);
}
