#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ContactModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Create a ContactModel instance
    ContactModel contactModel;

    // Expose it to QML
    engine.rootContext()->setContextProperty("contactModel", &contactModel);

    const QUrl url(QStringLiteral("qrc:/PhoneBookQAbtractlistModel/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
