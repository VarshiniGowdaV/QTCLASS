#include "ContactDataModel.h"
#include <QDebug>

ContactDataModel::ContactDataModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

ContactDataModel::~ContactDataModel()
{
    qDeleteAll(m_contacts);
    m_contacts.clear();
}

int ContactDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_contacts.count();
}

QVariant ContactDataModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_contacts.count())
        return QVariant();

    Contact *c = m_contacts.at(index.row());
    if (!c) return QVariant();

    switch (role) {
    case NameRole: return c->name();
    case NumberRole: return c->number();
    case ImageRole: return c->image();
    case CallTimeRole: return c->callTime();
    case IsIncomingRole: return c->isIncoming();
    case IsOutgoingRole: return c->isOutgoing();
    case ShortMessageRole: return c->shortMessage();
    default: return QVariant();
    }
}

QHash<int, QByteArray> ContactDataModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    roles[ImageRole] = "image";
    roles[CallTimeRole] = "callTime";
    roles[IsIncomingRole] = "isIncoming";
    roles[IsOutgoingRole] = "isOutgoing";
    roles[ShortMessageRole] = "shortMessage";
    return roles;
}


void ContactDataModel::insertContactData(Contact *contact)
{
    if (!contact) return;
    beginInsertRows(QModelIndex(), m_contacts.size(), m_contacts.size());
    contact->setParent(this);
    m_contacts.append(contact);
    endInsertRows();
}

Contact* ContactDataModel::getContactData(int index) const
{
    if (index < 0 || index >= m_contacts.count()) return nullptr;
    return m_contacts.at(index);
}

int ContactDataModel::count() const
{
    return m_contacts.count();
}
