#include "StudentViewModel.h"

StudentViewModel::StudentViewModel(QObject *parent)
    : QAbstractListModel{parent}
{
}
int StudentViewModel::rowCount(const QModelIndex &parent)const
{
    Q_UNUSED(parent)
}
QVariant StudentViewModel::date(const QModelIndex &index,int role)const
{
    const Student * student =studentList.at(index.row());
    switch (role) {
    case STUDENT_NAME:
        return student->getstudentname();
    case PHONE:
        return student->getstudentrollnumber();
    case
    default:
        break;
    }
}
