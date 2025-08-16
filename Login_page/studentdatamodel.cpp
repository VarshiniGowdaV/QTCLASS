#include "studentdatamodel.h"

StudentDataModel::StudentDataModel()
{
    qDebug()<<Q_FUNC_INFO;
}

StudentDataModel::~StudentDataModel()
{
    qDebug()<<Q_FUNC_INFO;
    for (Student* s : std::as_const(m_studentList)) {
        delete s;
    }
    m_studentList.clear();
}


bool StudentDataModel::addStudent(const QString &studentName, const QString &phoneNumber, const QString &fatherName, const QString &email, const QString &password, const QString &confirmPassword)
{
    qDebug()<<Q_FUNC_INFO;

    Student* newStudent = new Student(this);
    newStudent->setUserName("Darshan Gowda R");
    newStudent->setPhoneNumber("1234567899");
    newStudent->setFatherName("Ramesh N");
    newStudent->setEmail("darshangowda@gmail.com");
    newStudent->setPassword("Darshangowda@2002");
    newStudent->setConfirmPassword("Darshangowda@2002");

    // if (studentName.isEmpty() || phoneNumber.isEmpty() || fatherName.isEmpty() || email.isEmpty() ||
    //     password.isEmpty() || confirmPassword.isEmpty()) {
    //     qDebug() << "No Empty Fields are Allowed";
    //     return false;
    // }

    // if (password.length() < 8) {
    //     qDebug() << "Password must be at least 8 characters long";
    //     return false;
    // }

    // if (password != confirmPassword) {
    //     qDebug() << "Passwords do not match";
    //     return false;
    // }

    // Student* newStudent = new Student(this);
    // newStudent->setUserName(studentName);
    // newStudent->setPhoneNumber(phoneNumber);
    // newStudent->setFatherName(fatherName);
    // newStudent->setEmail(email);
    // newStudent->setPassword(password);
    // newStudent->setConfirmPassword(confirmPassword);

    m_studentList.append(newStudent);

    emit registrationSuccess();
    qDebug() << "Student added Total students:" << m_studentList.size();
    return true;
}

bool StudentDataModel::checkLoginInfo(const QString &email, const QString &password)
{
    qDebug()<<Q_FUNC_INFO;

    for (Student* s : std::as_const(m_studentList)) {
        if(s->getEmail() == email && s->getPassword() == password){
            qDebug() << "Login Successfull.";
            emit loginSuccess();
            return true;
        }
    }
    qDebug() << "Login failed or Invalid User";
    return false;
}


int StudentDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_studentList.size();
}

QVariant StudentDataModel::data(const QModelIndex &index, int role) const
{
    const Student* student = m_studentList.at(index.row());

    switch (role) {
    case USER_NAME:
        return student->getUserName();
    case PHONE_NUMBER:
        return student->getPhoneNumber();
    case FATHER_NAME:
        return student->getFatherName();
    case EMAIL:
        return student->getEmail();
    case PASSWORD:
        return student->getPassword();
    case CONFIRM_PASSWORD:
        return student->getConfirmPassword();
    default:
        return QVariant();
    }
    return QVariant();
}

QHash<int, QByteArray> StudentDataModel::roleNames() const
{
    QHash<int, QByteArray> l_roleNames;
    l_roleNames.insert(USER_NAME, "userName");
    l_roleNames.insert(PHONE_NUMBER, "phoneNumber");
    l_roleNames.insert(FATHER_NAME, "fatherName");
    l_roleNames.insert(EMAIL, "email");
    l_roleNames.insert(PASSWORD, "password");
    l_roleNames.insert(CONFIRM_PASSWORD, "confirmPassword");
    return l_roleNames;
}
