
#include "contactmodelmanager.h"
#include "PhoneBook.h"
#include "Call_History.h"
#include "Whats_App.h"
#include "csvloader.h"
#include <QDebug>

ContactModelManager::ContactModelManager(QObject *parent)
    : QObject(parent),
    m_contactModel(nullptr)
{
}

ContactModelManager::~ContactModelManager()
{
    if (m_contactModel) {
        delete m_contactModel;
        m_contactModel = nullptr;
    }
}

ContactDataModel* ContactModelManager::contactModel() const
{
    return m_contactModel;
}

void ContactModelManager::setModel(ContactDataModel* model)
{
    if (m_contactModel) {
        delete m_contactModel;
        m_contactModel = nullptr;
    }
    m_contactModel = model;
    if (m_contactModel) {
        m_contactModel->setParent(this);
    }
    emit contactModelChanged();
}

void ContactModelManager::createPhoneBook()
{
    PhoneBook* m = new PhoneBook(nullptr);
    setModel(m);

    QList<Contact*> contacts = CsvLoader::loadContacts("phonebook.csv", m);
    for (Contact* c : contacts) {
        m->insertContactData(c);
    }
}

void ContactModelManager::createCallHistory()
{
    CallHistory* m = new CallHistory(nullptr);
    setModel(m);

    QList<Contact*> contacts = CsvLoader::loadContacts("callhistory.csv", m);
    for (Contact* c : contacts) {
        m->insertContactData(c);
    }
}

void ContactModelManager::createWhatsApp()
{
    WhatsApp* m = new WhatsApp(nullptr);
    setModel(m);

    QList<Contact*> contacts = CsvLoader::loadContacts("whatsapp.csv", m);
    for (Contact* c : contacts) {
        m->insertContactData(c);
    }
}

void ContactModelManager::addContact(const QString &name, const QString &number, const QString &image,
                                     const QString &callTime, bool isIncoming,
                                     bool isOutgoing, const QString &shortMessage)
{
    if (!m_contactModel) {
        createPhoneBook();
    }
    m_contactModel->insertContactData(new Contact(name, number, image, callTime,
                                                  isIncoming, isOutgoing, shortMessage));
}
