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

// #include "contactmodelmanager.h"
// #include "PhoneBook.h"
// #include "Call_History.h"
// #include "Whats_App.h"
// #include "Contact.h"
// #include <QDebug>

// ContactModelManager::ContactModelManager(QObject *parent)
//     : QObject(parent),
//     m_contactModel(nullptr)
// {
// }

// ContactModelManager::~ContactModelManager()
// {
//     if (m_contactModel) {
//         delete m_contactModel;
//         m_contactModel = nullptr;
//     }
// }

// ContactDataModel* ContactModelManager::contactModel() const
// {
//     return m_contactModel;
// }

// void ContactModelManager::setModel(ContactDataModel* model)
// {
//     if (m_contactModel) {
//         delete m_contactModel;
//         m_contactModel = nullptr;
//     }
//     m_contactModel = model;
//     if (m_contactModel) {
//         m_contactModel->setParent(this);
//     }
//     emit contactModelChanged();
// }

// void ContactModelManager::createPhoneBook()
// {
//     PhoneBook* m = new PhoneBook(nullptr);
//     setModel(m);

//     m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "01:30 PM", true, false, "HII"));
//     m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "10:00 AM", false, true, "See you soon!"));
//     m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "05:15 AM", true, false, "Let's catch up"));
//     m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "04:15 AM", false, true, "Thanks!"));
//     m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "Yesterday", true, false, "Good morning ☀️"));
//     m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, true, "Sure!"));
//     m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "Yesterday", true, false, "Let's meet tomorrow"));
//     m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "Yesterday", false, true, "Happy Birthday 🎉"));
//     m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "Yesterday", true, false, "Where are you?"));
//     m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, true, "On my way!"));
// }

// void ContactModelManager::createCallHistory()
// {
//     CallHistory* m = new CallHistory(nullptr);
//     setModel(m);

//     m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "incoming", true, false, ""));
//     m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "outgoing", false, true, ""));
//     m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "incoming", true, false, ""));
//     m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "outgoing", false, true, ""));
//     m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "incoming", true, false, ""));
//     m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "outgoing", false, true, ""));
//     m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "incoming", true, false, ""));
//     m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "outgoing", false, true, ""));
//     m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "incoming", true, false, ""));
//     m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "outgoing", false, true, ""));
// }

// void ContactModelManager::createWhatsApp()
// {
//     WhatsApp* m = new WhatsApp(nullptr);
//     setModel(m);

//     m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "01:30 PM", false, false, "HII"));
//     m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "10:00 AM", false, false, "See you soon!"));
//     m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "05:15 AM", false, false, "Let's catch up"));
//     m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "04:15 AM", false, false, "Thanks!"));
//     m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "Yesterday", false, false, "Good morning ☀️"));
//     m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, false, "Sure!"));
//     m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "Yesterday", false, false, "Let's meet tomorrow"));
//     m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "Yesterday", false, false, "Happy Birthday 🎉"));
//     m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "Yesterday", false, false, "Where are you?"));
//     m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, false, "On my way!"));
// }

// void ContactModelManager::addContact(const QString &name, const QString &number, const QString &image,
//                                      const QString &callTime, bool isIncoming,
//                                      bool isOutgoing, const QString &shortMessage)
// {
//     if (!m_contactModel) {
//         createPhoneBook();
//     }
//     m_contactModel->insertContactData(new Contact(name, number, image, callTime, isIncoming, isOutgoing, shortMessage));
// }
