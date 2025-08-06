#include "Backend.h"

Backend::Backend(QObject *parent)
    : QObject(parent) {}

bool Backend::registerStudent(const QString& username, const QString& password) {
    for (const Student& s : students) {
        if (s.getUsername() == username)
            return false; // Already exists
    }
    students.append(Student(username, password));
    return true;
}

bool Backend::loginStudent(const QString& username, const QString& password) {
    for (const Student& s : students) {
        if (s.getUsername() == username && s.getPassword() == password)
            return true;
    }
    return false;
}
