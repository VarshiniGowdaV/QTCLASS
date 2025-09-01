#include "contactdatamodel.h"
#include <QDebug>

ContactDataModel::ContactDataModel()
{
    qDebug()<<Q_FUNC_INFO;
}

ContactDataModel::~ContactDataModel()
{
    qDebug()<<Q_FUNC_INFO;
}

int ContactDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_contactList.size();
}

QVariant ContactDataModel::data(const QModelIndex &index, int role) const
{
    const Contact* contact = m_contactList.at(index.row());

    switch (role) {
    case NAME:
        return contact->getContactName();
    case PHONE_NUMBER:
        return contact->getContactNumber();
    default:
        return QVariant();
    }
    return QVariant();
}

QHash<int, QByteArray> ContactDataModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames.insert(NAME,"contactName");
    roleNames.insert(PHONE_NUMBER,"contactNumber");
    return roleNames;
}

void ContactDataModel::addContact(QString name, QString number)
{
    Contact* newcontact = new Contact();

    newcontact->setContactName(name);
    newcontact->setContactNumber(number);

    qDebug()<<name<<number;

    m_contactList.append(newcontact);
    qDebug()<<" Contact Added Successfully: "<< m_contactList.size();
}
