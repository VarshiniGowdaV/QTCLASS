#ifndef STUDENTDETAILS_H
#define STUDENTDETAILS_H

#include <QObject>
#include <QList>

class StudentDetails : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString phone READ phone WRITE setPhone NOTIFY phoneChanged)
    Q_PROPERTY(QString father READ father WRITE setFather NOTIFY fatherChanged)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString confirmPassword READ confirmPassword WRITE setConfirmPassword NOTIFY confirmPasswordChanged)

public:
    explicit StudentDetails(QObject *parent = nullptr);

    QString name() const;
    QString phone() const;
    QString father() const;
    QString username() const;
    QString password() const;
    QString confirmPassword() const;

    void setName(const QString &name);
    void setPhone(const QString &phone);
    void setFather(const QString &father);
    void setUsername(const QString &username);
    void setPassword(const QString &password);
    void setConfirmPassword(const QString &confirmPassword);

    Q_INVOKABLE bool login(const QString &username, const QString &password);
    Q_INVOKABLE QString signup();

signals:
    void nameChanged();
    void phoneChanged();
    void fatherChanged();
    void usernameChanged();
    void passwordChanged();
    void confirmPasswordChanged();

private:
    QString m_name;
    QString m_phone;
    QString m_father;
    QString m_username;
    QString m_password;
    QString m_confirmPassword;

    // static QList<StudentDetails*> studentList;

    QString validateInput() const;
};

#endif // STUDENTDETAILS_H



