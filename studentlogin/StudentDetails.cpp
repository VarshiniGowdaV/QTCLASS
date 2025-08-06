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



// #include "StudentDetails.h"
// #include <QRegularExpression>
// #include <QDebug>

// QList<StudentDetails*> StudentDetails::studentList;

// StudentDetails::StudentDetails(QObject *parent)
//     : QObject(parent)
// {
// }

// QString StudentDetails::getname() const { return m_name; }
// QString StudentDetails::getphone() const { return m_phone; }
// QString StudentDetails::getfather() const { return m_father; }
// QString StudentDetails::getusername() const { return m_username; }
// QString StudentDetails::getpassword() const { return m_password; }
// QString StudentDetails::getconfirmPassword() const { return m_confirmPassword; }

// void StudentDetails::setName(const QString &name)
// {
//     if (name != m_name) {
//         m_name = name;
//         emit nameChanged();
//     }
// }

// void StudentDetails::setPhone(const QString &phone)
// {
//     if (phone != m_phone) {
//         m_phone = phone;
//         emit phoneChanged();
//     }
// }

// void StudentDetails::setFather(const QString &father)
// {
//     if (father != m_father) {
//         m_father = father;
//         emit fatherChanged();
//     }
// }

// void StudentDetails::setUsername(const QString &username)
// {
//     if (username != m_username) {
//         m_username = username;
//         emit usernameChanged();
//     }
// }

// void StudentDetails::setPassword(const QString &password)
// {
//     if (password != m_password) {
//         m_password = password;
//         emit passwordChanged();
//     }
// }

// void StudentDetails::setConfirmPassword(const QString &confirmPassword)
// {
//     if (confirmPassword != m_confirmPassword) {
//         m_confirmPassword = confirmPassword;
//         emit confirmPasswordChanged();
//     }
// }

// QString StudentDetails::validateInput() const
// {
//     QRegularExpression alphaExp("^[A-Za-z ]+$");

//     if (!alphaExp.match(m_name.trimmed()).hasMatch())
//         return "Invalid name. Only alphabets and spaces allowed.";

//     if (!alphaExp.match(m_father.trimmed()).hasMatch())
//         return "Invalid father's name. Only alphabets and spaces allowed.";

//     QRegularExpression phoneExp("^\\d{10}$");
//     if (!phoneExp.match(m_phone.trimmed()).hasMatch())
//         return "Invalid phone number. Must be exactly 10 digits and only numbers.";

//     QRegularExpression emailExp("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
//     if (!emailExp.match(m_username.trimmed()).hasMatch())
//         return "Invalid email format.";

//     if (m_password.trimmed() != m_confirmPassword.trimmed())
//         return "Password is not matching!";
//     return "";
// }

// bool StudentDetails::signup()
// {
//     QString validationError = validateInput();
//     if (!validationError.isEmpty()) {
//         qWarning() << "Signup failed:" << validationError;
//         return false;
//     }

//     for (StudentDetails* student : studentList) {
//         if (student->getusername() == m_username) {
//             qWarning() << "Username already exists!";
//             return false;
//         }
//     }

//     StudentDetails* newStudent = new StudentDetails();
//     newStudent->setName(m_name);
//     newStudent->setPhone(m_phone);
//     newStudent->setFather(m_father);
//     newStudent->setUsername(m_username);
//     newStudent->setPassword(m_password);
//     newStudent->setConfirmPassword(m_confirmPassword);

//     studentList.append(newStudent);
//     qDebug() << "Signup successful for user:" << m_username;
//     return true;
// }

// bool StudentDetails::login(const QString &username, const QString &password)
// {
//     for (StudentDetails* student : studentList) {
//         if (student->getusername() == username && student->getpassword() == password) {
//             qDebug() << "Login successful for user:" << username;
//             return true;
//         }
//     }

//     qWarning() << "Login failed for user:" << username;
//     return false;
// }



