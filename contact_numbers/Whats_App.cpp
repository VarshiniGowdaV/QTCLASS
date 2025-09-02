#include "Whats_App.h"

WhatsApp::WhatsApp(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "WhatsApp constructed";
}

WhatsApp::~WhatsApp()
{
    qDebug() << "WhatsApp destroyed";
}

Contact* WhatsApp::createContactData()
{
    return new Contact(QString(), QString(), QString(), QString(), false, false, QString(), nullptr);
}

void WhatsApp::insertContactData(Contact *prototype)
{
    Contact *c = createContactData();
    if (prototype) {
        c->setName(prototype->name());
        c->setNumber(prototype->number());
        c->setImage(prototype->image());
        c->setCallTime(prototype->callTime());
        c->setIsIncoming(prototype->isIncoming());
        c->setIsOutgoing(prototype->isOutgoing());
        c->setShortMessage(prototype->shortMessage());
        delete prototype;
    }
    ContactDataModel::insertContactData(c);
}

Contact* WhatsApp::getContactData(int index) const
{
    return ContactDataModel::getContactData(index);
}

int WhatsApp::count() const
{
    return ContactDataModel::count();
}
