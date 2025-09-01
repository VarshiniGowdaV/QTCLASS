#ifndef CONTACTDATAMODEL_H
#define CONTACTDATAMODEL_H

#include "contact.h"
#include <QAbstractListModel>
#include <QList>

class ContactDataModel: public QAbstractListModel
{
    Q_OBJECT
public:
    ContactDataModel();
    ~ContactDataModel();

    // QAbstractItemModel interface
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addContact(QString name, QString number);

    enum contactDataModel {
        NAME = 1,
        PHONE_NUMBER
    };


private:
    QList<Contact* > m_contactList;
};

#endif // CONTACTDATAMODEL_H
