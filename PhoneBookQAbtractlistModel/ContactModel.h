#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include "Contact.h"
#include <QList>
#include <QAbstractListModel>

class ContactModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ContactModel(QObject *parent = nullptr);
    ~ContactModel();

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    enum ContactRoles {
        CONTACTNAME = 1,
        CONTACTNUMBER
    };

    Q_INVOKABLE bool addContact(const QString &contactName, const QString &contactNumber);

signals:
    void contactListChanged();

private:
    QList<Contact*> m_contactList;
};

#endif // CONTACTMODEL_H
