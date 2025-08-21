#include "Phonebook.h"

Contact::Contact() {}

Contact::Contact(QString name, QString number)
{
    m_contactName = name;
    m_contactNumber = number;
}

Contact::~Contact()
{

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
