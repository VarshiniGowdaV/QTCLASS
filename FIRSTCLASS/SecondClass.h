#ifndef SECONDCLASS_H
#define SECONDCLASS_H

#include <QObject>
#include "FirstClass.h"
class SecondClass : public QObject
{
    Q_OBJECT
private:
    FirstClass m_firstclass;
public:

    explicit SecondClass(QObject *parent = nullptr);
    ~SecondClass();


signals:
    void applicationChange();
};

#endif // SECONDCLASS_H
