#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QObject>
#include "Phonebook.h"


class ContactModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<Contact *> contactList READ getContactList WRITE setContactList NOTIFY contactListChanged FINAL)
public:
    explicit ContactModel(QObject *parent = nullptr);
    ~ContactModel();
    QList<Contact *> getContactList() const;
    void setContactList(const QList<Contact *> &newContactList);
    Q_INVOKABLE int getSize();
    Q_INVOKABLE void addNumberButtonClicked();

signals:
    void contactListChanged();

private:
    Contact *m_contact;
    QList<Contact*>m_contactList;

};

#endif // CONTACTMODEL_H
