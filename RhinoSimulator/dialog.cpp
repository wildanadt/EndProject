#include "dialog.h"
#include "rhino.h"

#include <QPainter>
#include <QPaintEvent>
#include <QDebug>
#include <QtMath>

RenderArea::RenderArea(QWidget *parent)
    : QWidget(parent)
{



}

void RenderArea::setGambar(const QPainterPath &gambar){
    gmbr.append(gambar);
    update();
}

void RenderArea::datas(QString data){
    if(data.contains("a"))
        flip*=-1;

    if(data.contains("b")){
        if((balik==0) && jTarget<3 && jTarget>-3 && flip!=-1){
            balik=1;
        }
        else if(jBucket<40 && jBucket>-10 && flip!=1)
            balik=0;
    }

    if(data.contains("0"))
        vFlipper-=2;

    if(data.contains("1"))
        vFlipper+=2;

    if(data=="2")
        vWrist = vWrist - 1;

    if(data.contains("3"))
        vWrist = vWrist + 1;

    if(data.contains("4"))
        vElbow = vElbow + 1;

    if(data.contains("5")){
        if(vElbow<=-8)
            vElbow=-8;
        else
            vElbow = vElbow - 1;
    }

    if(data.contains("6"))
        vShoulder = vShoulder - 1;

    if(data.contains("7")){
        if(vShoulder>=0)
            vShoulder=0;
        else
            vShoulder= vShoulder + 1;
    }

    if(data.contains("8"))
        vDir+=5;

    if(data.contains("9"))
        vDir-=5;
    dat=data;    
    update();

    qDebug()<<"Shoulder: "<<vShoulder;
    qDebug()<<"Elbow: "<<vElbow;
    qDebug()<<"Wrist"<<vWrist;
}

void RenderArea::paintEvent(QPaintEvent *e){
    Q_UNUSED(e);
    QPainter painter(this);

    QPointF elbowcen(-120,0);
    QPointF wristcen(-120,-140);
    QPointF flipcen(-53,46.5);

    painter.setRenderHint(QPainter::Antialiasing);
    painter.setBrush(Qt::black);
    painter.setPen(Qt::black);

    QMatrix m;
    m.scale((flip * 1.0), 1.0);
    painter.setMatrix(m);

    painter.translate((flip * width()/2), height()/2);

    painter.save();
    painter.translate(flip*vDir,0);
    painter.fillPath(gmbr[chasis],Qt::gray);
    painter.drawPath(gmbr[wheel]);

    painter.save();
    painter.rotate(vShoulder + 180);
    //painter.rotate(vShoulder);
    painter.fillPath(gmbr[shoulder],Qt::gray);

    painter.translate(elbowcen);
    painter.rotate(vElbow - 255);
    //painter.rotate(vElbow);
    painter.translate(-elbowcen);
    painter.fillPath(gmbr[elbow],Qt::gray);

    painter.translate(wristcen);
    painter.rotate(vWrist + 255);
    painter.translate(-wristcen);
    painter.fillPath(gmbr[wrist],Qt::gray);
    if(balik){
        painter.fillPath(gmbr[object2],Qt::black);
    }
    painter.restore();

    painter.translate(flipcen);
    painter.rotate(vFlipper);//
    painter.translate(-flipcen);
    painter.fillPath(gmbr[flipper],Qt::black);
    painter.restore();

    m.scale((flip * 1.0), 1.0);
    painter.setMatrix(m);

    if(!balik){
        // painter.translate(flip*((-vDir/8)),0);
        painter.save();
        painter.translate(width()/2, height()/2);
        painter.fillPath(gmbr[object1],Qt::black);
        painter.restore();
    }
    painter.translate(width()/2 , height()/2);
    painter.fillPath(gmbr[bucket],Qt::black);

    grab();
}

void RenderArea::grab(){
    deg = vElbow + 15;
    StW = qSqrt(34000 - (33600 * qCos(qDegreesToRadians(deg))));
    sudutA = qRadiansToDegrees(qAcos(-((-5200-(qPow(StW,2)))/(2*140*StW))));
    deg2 = vWrist + 165 - sudutA;
    FtG =qSqrt(((qPow(StW,2))+900)-(2*StW*30 * qCos(qDegreesToRadians(deg2))));

    qDebug()<<FtG;

    AA = 500 + vDir;
    BB = 460 - vDir;

    jTarget = FtG-AA;
    jBucket = FtG-BB;

    qDebug()<<StW<<" : "<<AA<<" ; "<<BB<<" : "<<sudutA + (-vShoulder)<<" : "<<180 - (sudutA + (-vShoulder));

}
