#ifndef CALLHISTORY_H
#define CALLHISTORY_H

#include "ContactDataModel.h"

class CallHistory : public ContactDataModel
{
    Q_OBJECT
public:
    explicit CallHistory(QObject *parent = nullptr);
    ~CallHistory() override;

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void createContactData() override;

public slots:
    Q_INVOKABLE void addCall(const QString &name,
                             const QString &number,
                             const QString &imagePath,
                             const QString &callTime,
                             const QString &incoming,
                             const QString &outgoing);
};

#endif // CALLHISTORY_H
