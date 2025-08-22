#ifndef CONTACT_H
#define CONTACT_H

#include <QObject>

class Contact : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString contactName READ contactName WRITE setContactName NOTIFY contactNameChanged FINAL)
    Q_PROPERTY(QString phoneNumber READ phoneNumber WRITE setPhoneNumber NOTIFY phoneNumberChanged FINAL)

public:
    explicit Contact(const QString &name = "", const QString &phone = "", QObject *parent = nullptr);
    ~Contact();

    QString contactName() const;
    void setContactName(const QString &newContactName);

    QString phoneNumber() const;
    void setPhoneNumber(const QString &newPhoneNumber);

private:
    QString m_contactName;
    QString m_phoneNumber;

signals:
    void contactNameChanged();
    void phoneNumberChanged();
};

#endif // CONTACT_H
