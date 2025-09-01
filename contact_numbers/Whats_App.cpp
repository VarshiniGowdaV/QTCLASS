#include "Whats_App.h"
#include <iostream>

WhatsApp::WhatsApp(QObject *parent)
    : ContactDataModel(parent)
{
}

WhatsApp::~WhatsApp() {}

int WhatsApp::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) return 0;
    return m_contactList.size();
}

QVariant WhatsApp::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_contactList.size()) return QVariant();
    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case NameRole: return contact->contactName();
    case NumberRole: return contact->contactNumber();
    case ImageRole: return contact->image();
    case CallTimeRole: return contact->callTime();
    case IncomingRole: return contact->isIncoming();
    default: return QVariant();
    }
}

QHash<int, QByteArray> WhatsApp::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "contactName";
    roles[NumberRole] = "contactNumber";
    roles[ImageRole] = "image";
    roles[CallTimeRole] = "lastMessageTime";
    roles[IncomingRole] = "lastMessage";
    return roles;
}

void WhatsApp::createContactData()
{
    std::string name, number, image, lastMessage, lastMessageTime;
    std::cout << "Enter Chat Name: ";
    std::getline(std::cin, name);
    std::cout << "Enter Number: ";
    std::getline(std::cin, number);
    std::cout << "Enter Image Path (optional): ";
    std::getline(std::cin, image);
    std::cout << "Enter Last Message: ";
    std::getline(std::cin, lastMessage);
    std::cout << "Enter Last Message Time: ";
    std::getline(std::cin, lastMessageTime);

    insertContactData(new Contact(QString::fromStdString(name),
                                  QString::fromStdString(number),
                                  QString::fromStdString(image),
                                  QString::fromStdString(lastMessageTime),
                                  QString::fromStdString(lastMessage)));
}

void WhatsApp::addChat(const QString &name,
                       const QString &number,
                       const QString &imagePath,
                       const QString &lastMessage,
                       const QString &lastMessageTime)
{
    insertContactData(new Contact(name, number, imagePath, lastMessageTime, lastMessage));
}
