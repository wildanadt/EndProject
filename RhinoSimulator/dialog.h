#ifndef DIALOG_H
#define DIALOG_H

#include <QWidget>

#include <QList>
#include <QPainterPath>
#include <QRect>
#include <QWidget>

QT_BEGIN_NAMESPACE
class QPaintEvent;
QT_END_NAMESPACE

class RenderArea : public QWidget
{
    Q_OBJECT

public:
    RenderArea(QWidget *parent = nullptr);

    // ~RenderArea();

    void setGambar(const QPainterPath &gambar);
    void dataSerial(QString *data);

protected:

private slots:
    void datas(QString data);

    void paintEvent(QPaintEvent *e) override;

private:
    enum {chasis,shoulder,elbow,wrist,flipper,wheel,object1,object2,bucket};

    bool balik=0;
    double deg,StW,sudutA,AA,BB,jTarget,jBucket,deg2,FtG;

    QList<QPainterPath> gmbr;
    QString dat;

    QPainterPath gambar;
    qreal vElbow=0, vShoulder=0, vWrist=0, vFlipper=0, vDir=0;
    int flip = 1;

    void grab();

};

#endif // DIALOG_H
