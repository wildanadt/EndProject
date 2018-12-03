#include "dialog.h"
#include "rhino.h"
#include <QApplication>

int main(int argc, char *argv[]){
    QApplication a(argc, argv);
    Rhino w;
    w.show();

    return a.exec();
}
