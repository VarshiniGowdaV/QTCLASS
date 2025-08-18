// #include "backend.h"
// #include <QDebug>

// Backend::Backend(QObject *parent)
//     : QObject(parent)
// {}

// void Backend::submitClicked(const QString &name, const QString &phone,
//                             const QString &father, const QString &email,
//                             const QString &password, const QString &confirmPassword)
// {
//     Student student;
//     student.studentName = name;
//     student.studentPhoneNumber = phone;
//     student.fatherName = father;
//     student.userNameEmail = email;
//     student.password = password;
//     student.confirmPassword = confirmPassword;

//     student.printDetails();

//     if (password != confirmPassword)
//     {
//         qDebug() << " Passwords do not match!";
//     }
//     else
//     {
//         qDebug() << "Registration successful.";
//     }
// }

// void Backend::cancelClicked()
// {
//     qDebug() << "Cancelled!";
// }
