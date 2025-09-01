#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Call_History.h"
#include "PhoneBook.h"
#include "Whats_App.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CallHistory callHistory;
    PhoneBook phoneBook;
    WhatsApp whatsapp;

    ContactDataModel * model  = new PhoneBook();
    ContactDataModel * model1 = new CallHistory();
    ContactDataModel *model2 = new WhatsApp();

    engine.rootContext()->setContextProperty("callHistoryModel", &callHistory);
    engine.rootContext()->setContextProperty("phoneBookModel", &phoneBook);
    engine.rootContext()->setContextProperty("whatsappModel", &whatsapp);

    const QUrl url(QStringLiteral("qrc:/contact_numbers/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
