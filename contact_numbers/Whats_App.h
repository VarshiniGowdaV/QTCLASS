#ifndef WHATSAPP_H
#define WHATSAPP_H
#include "ContactDataModel.h"
#include <QDebug>

class WhatsApp : public ContactDataModel
{
    Q_OBJECT
public:
    explicit WhatsApp(QObject *parent = nullptr);
    ~WhatsApp();

    Contact* createContactData() override;
    void insertContactData(Contact *prototype) override;
    Contact* getContactData(int index) const override;
    int count() const override;
};

#endif // WHATSAPP_H
