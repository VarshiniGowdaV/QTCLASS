#include "PhoneBook.h"

PhoneBook::PhoneBook(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "PhoneBook constructed";
}

PhoneBook::~PhoneBook()
{
    qDebug() << "PhoneBook destroyed";
}

Contact* PhoneBook::createContactData()
{
    return new Contact(QString(), QString(), QString(), QString(), false, false, QString(), nullptr);
}

void PhoneBook::insertContactData(Contact *prototype)
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

Contact* PhoneBook::getContactData(int index) const
{
    return ContactDataModel::getContactData(index);
}

int PhoneBook::count() const
{
    return ContactDataModel::count();
}
