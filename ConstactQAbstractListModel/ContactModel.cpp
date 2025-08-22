#include "ContactModel.h"
#include "Contact.h"
#include <QDebug>

ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Optional: Add some default contacts
    m_contacts.append(new Contact("Alice", "9876543210"));
    m_contacts.append(new Contact("Bob", "9123456780"));
    m_contacts.append(new Contact("Charlie", "9988776655"));
}

ContactModel::~ContactModel()
{
    clearContacts();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_contacts.count();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_contacts.size())
        return QVariant();

    Contact *contact = m_contacts.at(index.row());
    switch (role) {
    case NameRole:
        return contact->getContactName();
    case NumberRole:
        return contact->getContactNumber();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    return roles;
}

bool ContactModel::addContact(const QString &name, const QString &number)
{
    if (name.trimmed().isEmpty() || number.trimmed().isEmpty()) {
        qWarning() << "Cannot add empty contact.";
        return false;
    }

    beginInsertRows(QModelIndex(), m_contacts.size(), m_contacts.size());
    m_contacts.append(new Contact(name, number));
    endInsertRows();

    return true;
}

void ContactModel::clearContacts()
{
    beginResetModel();
    qDeleteAll(m_contacts);
    m_contacts.clear();
    endResetModel();
}

QList<Contact *> ContactModel::getcontacts() const
{
    return m_contacts;
}

void ContactModel::setContacts(const QList<Contact *> &newContacts)
{
    beginResetModel();
    qDeleteAll(m_contacts);
    m_contacts = newContacts;
    endResetModel();
}
