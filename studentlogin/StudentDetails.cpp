#include "StudentDetails.h"
#include <QRegularExpression>
#include <QDebug>

QList<StudentDetails*> StudentDetails::studentList;

StudentDetails::StudentDetails(QObject *parent)
    : QObject(parent)
{
}

QString StudentDetails::name() const { return m_name; }
QString StudentDetails::phone() const { return m_phone; }
QString StudentDetails::father() const { return m_father; }
QString StudentDetails::username() const { return m_username; }
QString StudentDetails::password() const { return m_password; }
QString StudentDetails::confirmPassword() const { return m_confirmPassword; }

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

void StudentDetails::setConfirmPassword(const QString &confirmPassword)
{
    if (confirmPassword != m_confirmPassword) {
        m_confirmPassword = confirmPassword;
        emit confirmPasswordChanged();
    }
}

bool StudentDetails::login(const QString &username, const QString &password)
{
    for (StudentDetails* student : studentList) {
        if (student->username() == username && student->password() == password) {
            return true;
        }
    }
    return false;
}

QString StudentDetails::signup()
{
    QString error = validateInput();
    if (!error.isEmpty())
        return error;

    // Add to list
    StudentDetails* newStudent = new StudentDetails;
    newStudent->setName(m_name);
    newStudent->setPhone(m_phone);
    newStudent->setFather(m_father);
    newStudent->setUsername(m_username);
    newStudent->setPassword(m_password);
    studentList.append(newStudent);

    return "";
}

QString StudentDetails::validateInput() const
{
    QRegularExpression alphaRegex("^[A-Za-z]+$");
    QRegularExpression phoneRegex("^\\d{10}$");
    QRegularExpression emailRegex("^[\\w-\\.]+@[\\w-]+\\.[a-z]{2,10}$");

    if (!alphaRegex.match(m_name).hasMatch())
        return "Invalid name: only alphabets allowed";

    if (!alphaRegex.match(m_father).hasMatch())
        return "Invalid father name: only alphabets allowed";

    if (!phoneRegex.match(m_phone).hasMatch())
        return "Phone number must be 10 digits";

    if (!emailRegex.match(m_username).hasMatch())
        return "Invalid email format";

    if (m_password != m_confirmPassword)
        return "Password and confirm password do not match";

    return "";
}



