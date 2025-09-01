#include "ContactDataModel.h"
#include <QDebug>

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

    beginInsertRows(QModelIndex(), m_contactList.size(), m_contactList.size());
    m_contactList.append(contact);
    endInsertRows();
    qDebug() << "Contact inserted:" << contact->contactName()
             << contact->contactNumber();
}

Contact* ContactDataModel::getContactData(int index) const
{
    if (index < 0 || index >= m_contactList.size())
        return nullptr;

    return m_contactList.at(index);
}
