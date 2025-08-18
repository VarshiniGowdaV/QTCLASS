#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QList>
#include "Student.h"

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE bool registerStudent(const QString& username, const QString& password);
    Q_INVOKABLE bool loginStudent(const QString& username, const QString& password);

private:
    QList<Student> students;
};

#endif // BACKEND_H
