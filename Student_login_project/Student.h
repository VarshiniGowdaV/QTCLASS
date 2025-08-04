#ifndef STUDENT_H
#define STUDENT_H

#include <QString>

class Student {
public:
    QString studentName;
    QString phoneNumber;
    QString fatherName;
    QString email;
    QString password;

    Student(QString name, QString phone, QString father, QString mail, QString pass)
        : studentName(name), phoneNumber(phone), fatherName(father), email(mail), password(pass) {}
};

#endif // STUDENT_H
