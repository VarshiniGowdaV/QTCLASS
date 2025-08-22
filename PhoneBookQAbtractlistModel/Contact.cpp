#include "Contact.h"

Contact::Contact(const QString &name, const QString &phone, QObject *parent)
    : QObject(parent), m_contactName(name), m_phoneNumber(phone)
{
}

Contact::~Contact()
{
}

QString Contact::contactName() const
{
    return m_contactName;
}

void Contact::setContactName(const QString &newContactName)
{
    if (m_contactName != newContactName) {
        m_contactName = newContactName;
        emit contactNameChanged();
    }
}

QString Contact::phoneNumber() const
{
    return m_phoneNumber;
}

void Contact::setPhoneNumber(const QString &newPhoneNumber)
{
    if (m_phoneNumber != newPhoneNumber) {
        m_phoneNumber = newPhoneNumber;
        emit phoneNumberChanged();
    }
}
