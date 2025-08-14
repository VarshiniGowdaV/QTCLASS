#ifndef STUDENTVIEWMODEL_H
#define STUDENTVIEWMODEL_H

#include <QAbstractListModel>

class StudentViewModel : public QAbstractListModel
{
    Q_OBJECT
private:
     QList<StudentViewModel*> studentList;

public:
    explicit StudentViewModel(QObject *parent = nullptr);
};

#endif // STUDENTVIEWMODEL_H
