#include "Contact.h"

Contact::Contact(QObject *parent)
    : QObject(parent)
{
}

Contact::Contact(const QString &name,
                 const QString &number,
                 const QString &imagePath,
                 const QString &callTime,
                 const QString &incoming,
                 const QString &outgoing,
                 QObject *parent)
    : QObject(parent),
    m_contactName(name),
    m_contactNumber(number),
    m_image(imagePath),
    m_callTime(callTime),
    m_isIncoming(incoming),
    m_isOutgoing(outgoing)
{
}

Contact::~Contact()
{
}

void Contact::setContactName(const QString &newContactName)
{
    if (m_contactName != newContactName) {
        m_contactName = newContactName;
        emit contactNameChanged();
    }
}

void Contact::setContactNumber(const QString &newContactNumber)
{
    if (m_contactNumber != newContactNumber) {
        m_contactNumber = newContactNumber;
        emit contactNumberChanged();
    }
}

void Contact::setImage(const QString &newImage)
{
    if (m_image != newImage) {
        m_image = newImage;
        emit imageChanged();
    }
}

void Contact::setCallTime(const QString &newCallTime)
{
    if (m_callTime != newCallTime) {
        m_callTime = newCallTime;
        emit callTimeChanged();
    }
}

void Contact::setIsIncoming(const QString &newIsIncoming)
{
    if (m_isIncoming != newIsIncoming) {
        m_isIncoming = newIsIncoming;
        emit isIncomingChanged();
    }
}

void Contact::setIsOutgoing(const QString &newIsOutgoing)
{
    if (m_isOutgoing != newIsOutgoing) {
        m_isOutgoing = newIsOutgoing;
        emit isOutgoingChanged();
    }
}
