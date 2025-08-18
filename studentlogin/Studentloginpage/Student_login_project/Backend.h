#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QList>
#include "Student.h"

class Backend : public QObject {
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE bool registerStudent(const QString &name, const QString &phone,
                                     const QString &father, const QString &email,
                                     const QString &password, const QString &confirmPassword);

    Q_INVOKABLE bool login(const QString &username, const QString &password);

private:
    QList<Student> studentList;
};

#endif // BACKEND_H
