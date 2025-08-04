#ifndef STUDENT_H
#define STUDENT_H

#include <QString>

class Student {
public:
    Student(const QString& username, const QString& password);
    QString getUsername() const;
    QString getPassword() const;

private:
    QString m_username;
    QString m_password;
};

#endif // STUDENT_H
