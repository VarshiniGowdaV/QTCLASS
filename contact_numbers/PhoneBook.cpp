#include "PhoneBook.h"
#include <iostream>

PhoneBook::PhoneBook(QObject *parent)
    : ContactDataModel(parent)
{
}

PhoneBook::~PhoneBook() {}

int PhoneBook::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) return 0;
    return m_contactList.size();
}

QVariant PhoneBook::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_contactList.size()) return QVariant();
    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case NameRole: return contact->contactName();
    case NumberRole: return contact->contactNumber();
    case ImageRole: return contact->image();
    default: return QVariant();
    }
}

QHash<int, QByteArray> PhoneBook::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "contactName";
    roles[NumberRole] = "contactNumber";
    roles[ImageRole] = "image";
    return roles;
}

void PhoneBook::createContactData()
{
    std::string name, number, image;
    std::cout << "Enter Contact Name: ";
    std::getline(std::cin, name);
    std::cout << "Enter Contact Number: ";
    std::getline(std::cin, number);
    std::cout << "Enter Image Path (optional): ";
    std::getline(std::cin, image);

    insertContactData(new Contact(QString::fromStdString(name),
                                  QString::fromStdString(number),
                                  QString::fromStdString(image)));
}

void PhoneBook::addContact(const QString &name,
                           const QString &number,
                           const QString &imagePath)
{
    insertContactData(new Contact(name, number, imagePath));
}
