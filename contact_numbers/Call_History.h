#ifndef CALLHISTORY_H
#define CALLHISTORY_H
#include "ContactDataModel.h"
#include <QDebug>

class CallHistory : public ContactDataModel
{
    Q_OBJECT
public:
    explicit CallHistory(QObject *parent = nullptr);
    ~CallHistory();

    Contact* createContactData() override;
    void insertContactData(Contact *prototype) override;
    Contact* getContactData(int index) const override;
    int count() const override;
};

#endif
