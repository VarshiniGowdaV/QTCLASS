#ifndef PHONEBOOK_H
#define PHONEBOOK_H
#include "ContactDataModel.h"
#include <QDebug>

class PhoneBook : public ContactDataModel
{
    Q_OBJECT
public:
    explicit PhoneBook(QObject *parent = nullptr);
    ~PhoneBook();

    Contact* createContactData() override;
    void insertContactData(Contact *prototype) override;
    Contact* getContactData(int index) const override;
    int count() const override;
};

#endif // PHONEBOOK_H
