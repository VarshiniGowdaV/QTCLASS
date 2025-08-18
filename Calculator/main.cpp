#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Calculator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    CalculatorBackend backend;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.load(QUrl(QStringLiteral("qrc:Calculator/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
