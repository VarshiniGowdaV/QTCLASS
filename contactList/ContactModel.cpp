#include "ContactModel.h"
#include <QDebug>
ContactModel::ContactModel(QObject *parent)
    : QObject{parent}
{
    m_contactList.push_back(new Contact("Rahul Sharma", "9876543210"));
    m_contactList.push_back(new Contact("Priya Mehta", "9876501234"));
    m_contactList.push_back(new Contact("Amit Verma", "9812345678"));
    m_contactList.push_back(new Contact("Sneha Kapoor", "9123456789"));
    m_contactList.push_back(new Contact("Vikram Singh", "9098765432"));
    m_contactList.push_back(new Contact("Anjali Gupta", "9001122334"));
    m_contactList.push_back(new Contact("Ravi Kumar", "9823456780"));
    m_contactList.push_back(new Contact("Neha Reddy", "9123987654"));
    m_contactList.push_back(new Contact("Arjun Nair", "9345678901"));
    m_contactList.push_back(new Contact("Kiran Das", "9898989898"));
    qDebug()<<"Size in constructor :"<<m_contactList.size();

}

ContactModel::~ContactModel()
{

}

QList<Contact *> ContactModel::getContactList() const
{
    return m_contactList;
}

void ContactModel::setContactList(const QList<Contact *> &newContactList)
{
    if (m_contactList == newContactList)
        return;
    m_contactList = newContactList;
    emit contactListChanged();
}

int ContactModel::getSize()
{
    return m_contactList.size();
}

void ContactModel::addNumberButtonClicked()
{
    m_contactList.push_back(new Contact("Siddharth Rao", "9876001122"));
    m_contactList.push_back(new Contact("Pooja Iyer", "9865321478"));
    m_contactList.push_back(new Contact("Karthik Menon", "9890456123"));
    m_contactList.push_back(new Contact("Divya Patel", "9811765432"));
    m_contactList.push_back(new Contact("Manoj Joshi", "9123678543"));
    m_contactList.push_back(new Contact("Ritika Malhotra", "9009988776"));
    m_contactList.push_back(new Contact("Harshvardhan Reddy", "9933445566"));
    m_contactList.push_back(new Contact("Meera Chawla", "9911223344"));
    m_contactList.push_back(new Contact("Abhishek Sinha", "9807654321"));
    m_contactList.push_back(new Contact("Tanvi Desai", "9797979797"));

    qDebug()<<"Size in function :"<<m_contactList.size();
    emit contactListChanged();

}
