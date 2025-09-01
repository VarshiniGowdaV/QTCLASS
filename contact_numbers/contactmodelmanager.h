#ifndef CONTACTMODELMANAGER_H
#define CONTACTMODELMANAGER_H
#include <QObject>
#include "ContactDataModel.h"

class ContactModelManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(ContactDataModel* contactModel READ contactModel NOTIFY contactModelChanged)
public:
    explicit ContactModelManager(QObject *parent = nullptr);
    ~ContactModelManager();

    Q_INVOKABLE void createPhoneBook();
    Q_INVOKABLE void createCallHistory();
    Q_INVOKABLE void createWhatsApp();

    Q_INVOKABLE void addContact(const QString &name, const QString &number, const QString &image,
                                const QString &callTime = QString(), bool isIncoming = false,
                                bool isOutgoing = false, const QString &shortMessage = QString());

    ContactDataModel* contactModel() const;

signals:
    void contactModelChanged();

private:
    ContactDataModel* m_contactModel;
    void setModel(ContactDataModel* model);
};

#endif // CONTACTMODELMANAGER_H
