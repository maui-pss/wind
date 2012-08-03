
#include <QApplication>

#include "factory.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    WidgetFactory gallery;
    gallery.show();

    return app.exec();
}
