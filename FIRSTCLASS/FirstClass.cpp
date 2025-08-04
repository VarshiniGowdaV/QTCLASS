#include "FirstClass.h"

FirstClass::FirstClass(QObject *parent)
    : QObject{parent}
{
}
FirstClass::~FirstClass()
{
    qDebug()<<"FirstClass destructer called ";
}
QString FirstClass::getapplictionName() const
{
    return m_applictionName;
}

void FirstClass::setApplictionName(const QString &newApplictionName)
{
    m_applictionName = newApplictionName;
    emit applictionName();
}
void FirstClass::applictionName()
{

    qDebug()<<" ApplicationName function called";
}
