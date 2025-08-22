#include "ContactModel.h"
#include <QDebug>

ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

ContactModel::~ContactModel()
{
    qDeleteAll(m_contactList);
    m_contactList.clear();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_contactList.count();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_contactList.count())
        return QVariant();

    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case CONTACTNAME:
        return contact->contactName();
    case CONTACTNUMBER:
        return contact->phoneNumber();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[CONTACTNAME] = "contactName";
    roles[CONTACTNUMBER] = "contactNumber";
    return roles;
}

bool ContactModel::addContact(const QString &contactName, const QString &contactNumber)
{
    beginInsertRows(QModelIndex(), m_contactList.count(), m_contactList.count());
    m_contactList.append(new Contact(contactName, contactNumber));
    endInsertRows();

    emit contactListChanged();
    return true;
}
