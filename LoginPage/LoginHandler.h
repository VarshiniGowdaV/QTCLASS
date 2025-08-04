// #ifndef LOGINHANDLER_H
// #define LOGINHANDLER_H

// #include <QObject>
// #include<QDebug>
// class LoginHandler : public QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(QString getusername READ username WRITE setUsername NOTIFY usernameChanged FINAL)
//     Q_PROPERTY(QString getpassword READ password WRITE setPassword NOTIFY passwordChanged FINAL)

// public:
//     explicit LoginHandler(QObject *parent = nullptr);
//     QString getpassword() const;
//     void setPassword(const QString &newPassword);

//     QString getusername() const;
//     void setUsername(const QString &newUsername);

// private:
//     QString m_username;
//     QString m_password;


// signals:
//     void passwordChanged();
//     void usernameChanged();
// };

// #endif // LOGINHANDLER_H
