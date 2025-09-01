#ifndef CONTACT_H
#define CONTACT_H

#include <QObject>
#include <QString>

class Contact : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString contactName READ contactName WRITE setContactName NOTIFY contactNameChanged FINAL)
    Q_PROPERTY(QString contactNumber READ contactNumber WRITE setContactNumber NOTIFY contactNumberChanged FINAL)
    Q_PROPERTY(QString image READ image WRITE setImage NOTIFY imageChanged FINAL)
    Q_PROPERTY(QString callTime READ callTime WRITE setCallTime NOTIFY callTimeChanged FINAL)
    Q_PROPERTY(QString isIncoming READ isIncoming WRITE setIsIncoming NOTIFY isIncomingChanged FINAL)
    Q_PROPERTY(QString isOutgoing READ isOutgoing WRITE setIsOutgoing NOTIFY isOutgoingChanged FINAL)

public:
    explicit Contact(QObject *parent = nullptr);
    Contact(const QString &name, const QString &number,
            const QString &imagePath = "",
            const QString &callTime = "",
            const QString &incoming = "",
            const QString &outgoing = "",
            QObject *parent = nullptr);
    ~Contact();

    QString contactName() const { return m_contactName; }
    QString contactNumber() const { return m_contactNumber; }
    QString image() const { return m_image; }
    QString callTime() const { return m_callTime; }
    QString isIncoming() const { return m_isIncoming; }
    QString isOutgoing() const { return m_isOutgoing; }

    void setContactName(const QString &newContactName);
    void setContactNumber(const QString &newContactNumber);
    void setImage(const QString &newImage);
    void setCallTime(const QString &newCallTime);
    void setIsIncoming(const QString &newIsIncoming);
    void setIsOutgoing(const QString &newIsOutgoing);

signals:
    void contactNameChanged();
    void contactNumberChanged();
    void imageChanged();
    void callTimeChanged();
    void isIncomingChanged();
    void isOutgoingChanged();

private:
    QString m_contactName;
    QString m_contactNumber;
    QString m_image;
    QString m_callTime;
    QString m_isIncoming;
    QString m_isOutgoing;
};

#endif // CONTACT_H
