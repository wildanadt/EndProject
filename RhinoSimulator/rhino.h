#ifndef RHINO_H
#define RHINO_H

#include <QWidget>
#include <QPainterPath>
#include <QBoxLayout>

#include "dialog.h"
#include "serial.h"

class Rhino : public QWidget
{
    Q_OBJECT

public:

    Rhino();

private:

    void setupGambar();

    QList<QPainterPath> gambaran;
    RenderArea *render;
    Serial *serial;

};

#endif // RHINO_H
