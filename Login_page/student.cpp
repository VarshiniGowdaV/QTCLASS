#include "student.h"
#include <qdebug.h>

Student::Student(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO;
    connect(this,&Student::userNameChanged,this,&Student::onUserNameChanged);
    connect(this,&Student::phoneNumberChanged,this,&Student::onPhoneNumberChanged);
    connect(this,&Student::fatherNameChanged,this,&Student::onFatherNameChanged);
    connect(this,&Student::emailChanged,this,&Student::onEmailChanged);
    connect(this,&Student::passwordChanged,this,&Student::onPasswordChanged);
    connect(this,&Student::confirmPasswordChanged,this,&Student::onConfirmPasswordChanged);
}

Student::~Student()
{
    // qDebug()<<Q_FUNC_INFO;
    // for (Student* s : std::as_const(m_studentList)) {
    //     delete s;
    // }
    // m_studentList.clear();
}

QString Student::getUserName() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_userName;
}

void Student::setUserName(const QString &newUserName)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString Student::getFatherName() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_fatherName;
}

void Student::setFatherName(const QString &newFatherName)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_fatherName == newFatherName)
        return;
    m_fatherName = newFatherName;
    emit fatherNameChanged();
}

QString Student::getPassword() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_password;
}

void Student::setPassword(const QString &newPassword)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

QString Student::getEmail() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_email;
}

void Student::setEmail(const QString &newEmail)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString Student::getPhoneNumber() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_phoneNumber;
}

void Student::setPhoneNumber(QString newMobileNumber)
{
    qDebug()<<Q_FUNC_INFO;

    if (m_phoneNumber == newMobileNumber)
        return;
    m_phoneNumber = newMobileNumber;
    emit phoneNumberChanged();
}


QString Student::getConfirmPassword() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_confirmPassword;
}

void Student::setConfirmPassword(const QString &newConfirmPassword)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_confirmPassword == newConfirmPassword)
        return;
    m_confirmPassword = newConfirmPassword;
    emit confirmPasswordChanged();
}


void Student::onUserNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"UserName: "<<m_userName;

}

void Student::onFatherNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"FatherName: "<<m_fatherName;

}


void Student::onPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Password: "<<m_password;

}

void Student::onEmailChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Email: "<<m_email;

}

void Student::onPhoneNumberChanged()
{
    qDebug()<<Q_FUNC_INFO<<"MobileNumber: "<<m_phoneNumber;

}

void Student::onConfirmPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"ConfirmPassword: "<<m_confirmPassword;
}
