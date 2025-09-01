#include "ContactDataModel.h"
#include <QDebug>
#include <iostream>

ContactDataModel::ContactDataModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

ContactDataModel::~ContactDataModel()
{
    qDeleteAll(m_contactList);
    m_contactList.clear();
}

void ContactDataModel::insertContactData(Contact *contact)
{
    if (!contact)
        return;

    m_contactList.append(contact);
    qDebug() << "Contact inserted:" << contact->getcontactName()
             << contact->getcontactNumber();
}

Contact* ContactDataModel::getContactData(int index) const
{
    if (index < 0 || index >= m_contactList.size())
        return nullptr;

    return m_contactList.at(index);
}

void ContactDataModel::createContactData()
{
    std::string name, number, image, callTime, incoming, outgoing;

    std::cout << "Enter Contact Name: ";
    std::getline(std::cin, name);

    std::cout << "Enter Contact Number: ";
    std::getline(std::cin, number);

    std::cout << "Enter Image Path (optional): ";
    std::getline(std::cin, image);

    std::cout << "Enter Call Time (optional): ";
    std::getline(std::cin, callTime);

    std::cout << "Is Incoming? (yes/no): ";
    std::getline(std::cin, incoming);

    std::cout << "Is Outgoing? (yes/no): ";
    std::getline(std::cin, outgoing);

    Contact *contact = new Contact(QString::fromStdString(name),
                                   QString::fromStdString(number),
                                   QString::fromStdString(image),
                                   QString::fromStdString(callTime),
                                   QString::fromStdString(incoming),
                                   QString::fromStdString(outgoing));
    insertContactData(contact);
}
