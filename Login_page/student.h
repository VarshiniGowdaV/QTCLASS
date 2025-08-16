#ifndef STUDENT_H
#define STUDENT_H

#include <qobject.h>

class Student: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString userName READ getUserName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString fatherName READ getFatherName WRITE setFatherName NOTIFY fatherNameChanged FINAL)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwordChanged FINAL)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail NOTIFY emailChanged FINAL)
    Q_PROPERTY(QString phoneNumber READ getPhoneNumber WRITE setPhoneNumber NOTIFY phoneNumberChanged FINAL)
    Q_PROPERTY(QString confirmPassword READ getConfirmPassword WRITE setConfirmPassword NOTIFY confirmPasswordChanged FINAL)

public:
    explicit Student(QObject *parent = nullptr);
    void extracted();
    ~Student();

    QString getUserName() const;
    void setUserName(const QString &newUserName);

    QString getFatherName() const;
    void setFatherName(const QString &newFatherName);

    QString getPassword() const;
    void setPassword(const QString &newPassword);

    QString getEmail() const;
    void setEmail(const QString &newEmail);

    QString getPhoneNumber() const;
    void setPhoneNumber(QString newPhoneNumber);

    QString getConfirmPassword() const;
    void setConfirmPassword(const QString &newConfirmPassword);

public slots:
    void onUserNameChanged();
    void onFatherNameChanged();
    void onPasswordChanged();
    void onEmailChanged();
    void onPhoneNumberChanged();
    void onConfirmPasswordChanged();

signals:
    void userNameChanged();
    void fatherNameChanged();
    void passwordChanged();
    void emailChanged();
    void phoneNumberChanged();
    void confirmPasswordChanged();

private:
    QString m_userName;
    QString m_fatherName;
    QString m_password;
    QString m_confirmPassword;
    QString m_email;
    QString m_phoneNumber;
};

#endif // STUDENT_H
