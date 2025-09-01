#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ContactModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ContactModel contactModel;
    engine.rootContext()->setContextProperty("contactModel", &contactModel);

    const QUrl url(u"qrc:/PhoneBookQAbtractlistModel/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
