#include "SecondClass.h"

SecondClass::SecondClass(QObject *parent)
    : QObject{parent}
{
    connect(&m_firstclass,&FirstClass::applictionName,this,&SecondClass::applicationChange());
    m_firstclass.applictionName("appliction");
}
SecondClass::~SecondClass()
{
    qDebug()<<"SecondClass destructer called ";

}
void SecondClass::applicationChange()
{
    qDebug()<<"applictionchange function called ";

}
