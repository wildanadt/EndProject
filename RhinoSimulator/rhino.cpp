
#include <QDebug>

#include "rhino.h"
#include <QLayout>
#include <QObject>
#include <QScrollArea>
#include <QLabel>
#include <QPushButton>
#include "serial.h"

Rhino::Rhino(){
    QHBoxLayout *layout = new QHBoxLayout();
    render = new RenderArea;
    serial = new Serial;
    render->setFocus();

    layout->addWidget(render);
    setLayout(layout);
    resize(1500,800);
    setupGambar();

    connect(serial,SIGNAL(readyRead()),serial,SLOT(terimaData()));
    connect(serial,SIGNAL(buff2(QString)),render,SLOT(datas(QString)));

    if(gambaran[8].contains(gambaran[3])){
        qDebug()<<"Masuukkkkkkkk";
    }
}

void Rhino::setupGambar(){
    QPointF center(0,0);
    QPointF elbowcen(-120,0);
    QPointF wristcen(-120,-140);
    QPointF flipcen(-53,46.5);
    QPointF flipcen2(-116,46.5);
    QPointF objectcen2(-90,-140);
    QPointF objectcen1(-500,0);
    QPointF buckcen(505,70);

    QPainterPath object1;
    object1.addEllipse(objectcen1,10,10);

    QPainterPath object2;
    object2.addEllipse(objectcen2,10,10);

    QPainterPath bucket;
    bucket.setFillRule(Qt::WindingFill);
    bucket.moveTo(buckcen);
    bucket.lineTo(515,10);
    bucket.lineTo(450,10);
    bucket.lineTo(460,70);

    QPainterPath wrist;
    wrist.setFillRule(Qt::WindingFill);
    wrist.addEllipse(wristcen,8,8);
    wrist.moveTo(wristcen);
    wrist.lineTo(-120,-136);
    wrist.lineTo(-270,-136);
    wrist.lineTo(-270,-144);
    wrist.lineTo(-120,-144);
    wrist.lineTo(wristcen);
    wrist.addEllipse(wristcen,10,10);
    wrist.moveTo(wristcen);
    wrist.lineTo(-105,-155);
    wrist.lineTo(-80,-155);
    wrist.lineTo(-80,-150);
    wrist.lineTo(-100,-150);
    wrist.lineTo(-104,-140);
    wrist.lineTo(-100,-130);
    wrist.lineTo(-80,-130);
    wrist.lineTo(-80,-125);
    wrist.lineTo(-105,-125);
    wrist.lineTo(wristcen);
    wrist.closeSubpath();

    QPainterPath elbow;
    elbow.setFillRule(wrist.fillRule());
    elbow.addEllipse(elbowcen,8,8);
    elbow.moveTo(elbowcen);
    elbow.lineTo(-124,0);
    elbow.lineTo(-124,-140);
    elbow.lineTo(-116,-140);
    elbow.lineTo(-116,0);
    elbow.lineTo(elbowcen);
    elbow.closeSubpath();

    QPainterPath shoulder;
    shoulder.setFillRule(wrist.fillRule());
    shoulder.addEllipse(center,10,10);
    shoulder.moveTo(center);
    shoulder.lineTo(0,4);
    shoulder.lineTo(-120,4);
    shoulder.lineTo(-120,-4);
    shoulder.lineTo(0,-4);
    shoulder.lineTo(0,0);
    shoulder.closeSubpath();

    QPainterPath flipper;
    flipper.setFillRule(wrist.fillRule());
    flipper.addEllipse(flipcen, 25, 25);
    flipper.moveTo(-116,46.5);
    flipper.addEllipse(flipcen2,10,10);
    flipper.moveTo(-116,36.5);
    flipper.lineTo(-53, 21.5);
    flipper.lineTo(-53,71.5);
    flipper.lineTo(-116,56.5);
    flipper.lineTo(-116,36.5);
    flipper.closeSubpath();

    QPainterPath chasis;
    chasis.setFillRule(wrist.fillRule());
    chasis.moveTo(center);
    chasis.lineTo(5,0);
    chasis.lineTo(5,13);
    chasis.lineTo(20,13);
    chasis.lineTo(31,23);
    chasis.lineTo(110,23);
    chasis.lineTo(110,69);

    chasis.lineTo(-50,69);
    chasis.lineTo(-50,23);

    chasis.lineTo(-27,23);
    chasis.lineTo(-15,13);
    chasis.lineTo(-5,13);
    chasis.lineTo(-5,0);
    chasis.lineTo(center);
    chasis.boundingRect();
    chasis.closeSubpath();

    QPainterPath wheel;
    wheel.addEllipse(QPointF(117,46),25,25);
    wheel.moveTo(117,21.5);
    wheel.lineTo(-52,21.5);
    wheel.moveTo(117, 70.5);
    wheel.lineTo(-52, 70.5);
    wheel.moveTo(117,22);
    wheel.lineTo(-52,22);
    wheel.moveTo(117, 70);
    wheel.lineTo(-52, 70);

    gambaran.append(chasis);
    gambaran.append(shoulder);
    gambaran.append(elbow);
    gambaran.append(wrist);
    gambaran.append(flipper);
    gambaran.append(wheel);
    gambaran.append(object1);
    gambaran.append(object2);
    gambaran.append(bucket);

    qDebug()<<object1;

    for(int i=0;i<gambaran.length();i++){
        render->setGambar(gambaran[i]);
    }
}
