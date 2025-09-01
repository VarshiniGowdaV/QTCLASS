#include "contact.h"
#include <QDebug>

Contact::Contact(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO;
}

Contact::~Contact()
{
    qDebug()<<Q_FUNC_INFO;

}

QString Contact::getContactName() const
{
    return m_contactName;
}

void Contact::setContactName(const QString &newContactName)
{
    if (m_contactName == newContactName)
        return;
    m_contactName = newContactName;
    emit contactNameChanged();
}

QString Contact::getContactNumber() const
{
    return m_contactNumber;
}

void Contact::setContactNumber(const QString &newContactNumber)
{
    if (m_contactNumber == newContactNumber)
        return;
    m_contactNumber = newContactNumber;
    emit contactNumberChanged();
}
