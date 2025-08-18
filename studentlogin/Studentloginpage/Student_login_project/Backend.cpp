#include "Backend.h"
#include <QRegularExpression>

Backend::Backend(QObject *parent) : QObject(parent) {}

bool Backend::registerStudent(const QString &name, const QString &phone,
                              const QString &father, const QString &email,
                              const QString &password, const QString &confirmPassword) {
    if (!QRegularExpression("^[A-Za-z\\s]+$").match(name).hasMatch()) return false;
    if (!QRegularExpression("^\\d{10}$").match(phone).hasMatch()) return false;
    if (!QRegularExpression("^[A-Za-z\\s]+$").match(father).hasMatch()) return false;
    if (!QRegularExpression("^[\\w.-]+@[\\w.-]+\\.\\w+$").match(email).hasMatch()) return false;
    if (password != confirmPassword) return false;

    studentList.append(Student(name, phone, father, email, password));
    return true;
}

bool Backend::login(const QString &username, const QString &password) {
    for (const Student &s : studentList) {
        if (s.email == username && s.password == password)
            return true;
    }
    return false;
}
