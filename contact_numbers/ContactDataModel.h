#ifndef CONTACTDATAMODEL_H
#define CONTACTDATAMODEL_H
#include <QAbstractListModel>
#include "Contact.h"

class ContactDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ContactRoles {
        NameRole =1,
        NumberRole,
        ImageRole,
        CallTimeRole,
        IsIncomingRole,
        IsOutgoingRole,
        ShortMessageRole
    };

    explicit ContactDataModel(QObject *parent = nullptr);
    virtual ~ContactDataModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    virtual Contact* createContactData() = 0;
    virtual void insertContactData(Contact *prototype);
    virtual Contact* getContactData(int index) const;
    virtual int count() const;

protected:
    QList<Contact*> m_contacts;
};

#endif
