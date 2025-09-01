#include "Call_History.h"

CallHistory::CallHistory(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "CallHistory constructed";
}

CallHistory::~CallHistory()
{
    qDebug() << "CallHistory destroyed";
}

Contact* CallHistory::createContactData()
{
    return new Contact(QString(), QString(), QString(), QString(), false, false, QString(), nullptr);
}

void CallHistory::insertContactData(Contact *prototype)
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

Contact* CallHistory::getContactData(int index) const
{
    return ContactDataModel::getContactData(index);
}

int CallHistory::count() const
{
    return ContactDataModel::count();
}
