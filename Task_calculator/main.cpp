#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Calculator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CalculatorBackend backend;

    engine.rootContext()->setContextProperty("backend", &backend);

    engine.load(QUrl(QStringLiteral("qrc:Task_calculator/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
