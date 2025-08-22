#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
#include <QString>
#include <QList>
#include "Contact.h"
class ContactModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ContactModel(QObject *parent = nullptr);
    ~ContactModel() override;

    enum ContactRoles {
        NameRole = 1,
        NumberRole
    };

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role ) const override ;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE bool addContact(const QString &name, const QString &number);
    Q_INVOKABLE void clearContacts();

    QList<Contact *> getcontacts() const;
    void setContacts(const QList<Contact *> &newContacts);

private:
    QList<Contact*> m_contacts;
};

#endif // CONTACTMODEL_H



