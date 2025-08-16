#ifndef STUDENTDATAMODEL_H
#define STUDENTDATAMODEL_H

#include <QList>
#include <QAbstractListModel>
#include "student.h"

class StudentDataModel: public QAbstractListModel
{
    Q_OBJECT
public:

    explicit StudentDataModel();
    ~StudentDataModel();

    // QAbstractItemModel interface
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    enum studentDataModel
    {
        USER_NAME = 1,
        PHONE_NUMBER,
        FATHER_NAME,
        EMAIL,
        PASSWORD,
        CONFIRM_PASSWORD
    };

    Q_INVOKABLE bool addStudent(const QString &studentName,const QString &phoneNumbe, const QString &fatherName, const QString &email,
                                const QString &password, const QString &confirmPassword);

    Q_INVOKABLE bool checkLoginInfo(const QString &email, const QString &password);

signals:

    void registrationSuccess();
    void loginSuccess();

private:
    QList<Student*> m_studentList;
};

#endif // STUDENTDATAMODEL_H
