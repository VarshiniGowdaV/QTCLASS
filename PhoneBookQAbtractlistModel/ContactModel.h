#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>

class ContactModel : public QAbstractListModel
{
public:
    explicit ContactModel(QObject *parent = nullptr);
};

#endif // CONTACTMODEL_H
