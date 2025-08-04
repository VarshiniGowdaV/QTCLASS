// #include "LoginHandler.h"

// LoginHandler::LoginHandler(QObject *parent)
//     : QObject{parent}
// {
//     qDebug()<<Q_FUNC_INFO;

// }

// QString LoginHandler::getpassword() const
// {
//     return m_password;
// }

// void LoginHandler::setPassword(const QString &newPassword)
// {
//     if (m_password == newPassword)
//         return;
//     m_password = newPassword;
//     emit passwordChanged();
// }

// QString LoginHandler::getusername() const
// {
//     return m_username;
// }

// void LoginHandler::setUsername(const QString &newUsername)
// {
//     if (m_username == newUsername)
//         return;
//     m_username = newUsername;
//     emit usernameChanged();
// }
// void LoginHandler::usernameChanged()
// {
//     qDebug()<<Q_FUNC_INFO<<m_username;
// }
// void LoginHandler::passwordChanged()
// {
//     qDebug()<<Q_FUNC_INFO<<m_password;
// }
