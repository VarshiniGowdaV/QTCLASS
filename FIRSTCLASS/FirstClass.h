#ifndef FIRSTCLASS_H
#define FIRSTCLASS_H

#include <QObject>
#include <QDebug>
class FirstClass : public QObject
{
    Q_OBJECT
public:
    explicit FirstClass(QObject *parent = nullptr);
    ~FirstClass();
    QString getapplictionName() const;
    void setApplictionName(const QString &newApplictionName);

private:
    QString m_applictionName;
signals:
    void applictionName();

};

#endif // FIRSTCLASS_H
