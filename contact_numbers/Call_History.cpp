#include "Call_History.h"
#include <iostream>

CallHistory::CallHistory(QObject *parent)
    : ContactDataModel(parent)
{
}

CallHistory::~CallHistory() {}

int CallHistory::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) return 0;
    return m_contactList.size();
}

QVariant CallHistory::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_contactList.size()) return QVariant();
    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case NameRole: return contact->contactName();
    case NumberRole: return contact->contactNumber();
    case ImageRole: return contact->image();
    case CallTimeRole: return contact->callTime();
    case IncomingRole: return contact->isIncoming();
    case OutgoingRole: return contact->isOutgoing();
    default: return QVariant();
    }
}

QHash<int, QByteArray> CallHistory::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "contactName";
    roles[NumberRole] = "contactNumber";
    roles[ImageRole] = "image";
    roles[CallTimeRole] = "callTime";
    roles[IncomingRole] = "isIncoming";
    roles[OutgoingRole] = "isOutgoing";
    return roles;
}

void CallHistory::createContactData()
{
    std::string name, number, image, callTime, incoming, outgoing;
    std::cout << "Enter Caller Name: ";
    std::getline(std::cin, name);
    std::cout << "Enter Caller Number: ";
    std::getline(std::cin, number);
    std::cout << "Enter Image Path (optional): ";
    std::getline(std::cin, image);
    std::cout << "Enter Call Time: ";
    std::getline(std::cin, callTime);
    std::cout << "Incoming Call? (yes/no): ";
    std::getline(std::cin, incoming);
    std::cout << "Outgoing Call? (yes/no): ";
    std::getline(std::cin, outgoing);

    insertContactData(new Contact(QString::fromStdString(name),
                                  QString::fromStdString(number),
                                  QString::fromStdString(image),
                                  QString::fromStdString(callTime),
                                  QString::fromStdString(incoming),
                                  QString::fromStdString(outgoing)));
}

void CallHistory::addCall(const QString &name,
                          const QString &number,
                          const QString &imagePath,
                          const QString &callTime,
                          const QString &incoming,
                          const QString &outgoing)
{
    insertContactData(new Contact(name, number, imagePath, callTime, incoming, outgoing));
}
