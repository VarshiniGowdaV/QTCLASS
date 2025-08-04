#include "Student.h"

Student::Student(const QString& username, const QString& password)
    : m_username(username), m_password(password) {}

QString Student::getUsername() const {
    return m_username;
}

QString Student::getPassword() const {
    return m_password;
}
