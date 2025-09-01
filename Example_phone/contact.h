#ifndef CONTACT_H
#define CONTACT_H

#include <QObject>

class Contact : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString contactName READ getContactName WRITE setContactName NOTIFY contactNameChanged FINAL)
    Q_PROPERTY(QString contactNumber READ getContactNumber WRITE setContactNumber NOTIFY contactNumberChanged FINAL)
public:
    explicit Contact(QObject *parent = nullptr);
    ~Contact ();

    QString getContactName() const;
    void setContactName(const QString &newContactName);

    QString getContactNumber() const;
    void setContactNumber(const QString &newContactNumber);

signals:

    void contactNameChanged();
    void contactNumberChanged();

private:
    QString m_contactName;
    QString m_contactNumber;
};

#endif // CONTACT_H
