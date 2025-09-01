#ifndef CONTACTDATAMODEL_H
#define CONTACTDATAMODEL_H

#include "Contact.h"
#include <QAbstractListModel>
#include <QList>

class ContactDataModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum ContactRoles {
        NameRole = 1,
        NumberRole,
        ImageRole,
        CallTimeRole,
        IncomingRole,
        OutgoingRole
    };

    explicit ContactDataModel(QObject *parent = nullptr);
    ~ContactDataModel();

    void insertContactData(Contact *contact);
    Contact* getContactData(int index) const;
    virtual void createContactData() = 0;

protected:
    QList<Contact*> m_contactList;
};

#endif // CONTACTDATAMODEL_H
