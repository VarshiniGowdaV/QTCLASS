#include "Contact.h"

Contact::Contact(const QString &name,const QString &number,const QString &image,const QString &callTime,
                 bool isIncoming,bool isOutgoing,const QString &shortMessage,QObject *parent):
    QObject(parent),m_name(name),m_number(number),m_image(image),m_callTime(callTime),m_isIncoming(isIncoming),
    m_isOutgoing(isOutgoing),m_shortMessage(shortMessage)
{

}

QString Contact::name() const
{
    return m_name;
}

QString Contact::number() const
{
    return m_number;
}

QString Contact::image() const
{
    return m_image;
}

QString Contact::callTime() const
{
    return m_callTime;
}

bool Contact::isIncoming() const
{
    return m_isIncoming;
}

bool Contact::isOutgoing() const
{
    return m_isOutgoing;
}

QString Contact::shortMessage() const
{
    return m_shortMessage;
}

void Contact::setName(const QString &name)
{
    if (m_name != name)
    {
        m_name = name;
        emit nameChanged();
    }
}

void Contact::setNumber(const QString &number)
{
    if (m_number != number)
    {
        m_number = number;
        emit numberChanged();
    }
}
void Contact::setImage(const QString &image)
{
    if (m_image != image)
    {
        m_image = image;
        emit imageChanged();
    }
}

void Contact::setCallTime(const QString &time)
{
    if (m_callTime != time)
    {
        m_callTime = time;
        emit callTimeChanged();
    }
}

void Contact::setIsIncoming(bool incoming)
{
    if (m_isIncoming != incoming)
    {
        m_isIncoming = incoming;
        emit isIncomingChanged();
    }
}
void Contact::setIsOutgoing(bool outgoing)
{
    if (m_isOutgoing != outgoing)
    {
        m_isOutgoing = outgoing;
        emit isOutgoingChanged();
    }
}

void Contact::setShortMessage(const QString &msg)
{
    if (m_shortMessage != msg)
    {
        m_shortMessage = msg;
        emit shortMessageChanged();
    }
}
