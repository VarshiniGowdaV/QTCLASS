#ifndef PHONEBOOK_H
#define PHONEBOOK_H
#include "ContactDataModel.h"

class PhoneBook : public ContactDataModel
{
    Q_OBJECT
public:
    explicit PhoneBook(QObject *parent = nullptr);
    ~PhoneBook() override;

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void createContactData() override;

public slots:
    Q_INVOKABLE void addContact(const QString &name,
                                const QString &number,
                                const QString &imagePath);
};

#endif // PHONEBOOK_H
