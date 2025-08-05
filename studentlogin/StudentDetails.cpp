#include "StudentDetails.h"

StudentDetails::StudentDetails(QObject *parent)
    : QObject(parent)
{
}

QString StudentDetails::name() const { return m_name; }
QString StudentDetails::phone() const { return m_phone; }
QString StudentDetails::father() const { return m_father; }
QString StudentDetails::username() const { return m_username; }
QString StudentDetails::password() const { return m_password; }

void StudentDetails::setName(const QString &name)
{
    if (name != m_name) {
        m_name = name;
        emit nameChanged();
    }
}

void StudentDetails::setPhone(const QString &phone)
{
    if (phone != m_phone) {
        m_phone = phone;
        emit phoneChanged();
    }
}

void StudentDetails::setFather(const QString &father)
{
    if (father != m_father) {
        m_father = father;
        emit fatherChanged();
    }
}

void StudentDetails::setUsername(const QString &username)
{
    if (username != m_username) {
        m_username = username;
        emit usernameChanged();
    }
}

void StudentDetails::setPassword(const QString &password)
{
    if (password != m_password) {
        m_password = password;
        emit passwordChanged();
    }
}

bool StudentDetails::login(const QString &username, const QString &password)
{
    return (username == m_username && password == m_password);
}

bool StudentDetails::signup()
{
    return true;
}
