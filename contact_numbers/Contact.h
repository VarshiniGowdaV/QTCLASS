#ifndef CONTACT_H
#define CONTACT_H
#include <QObject>
#include <QString>

class Contact : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString number READ number WRITE setNumber NOTIFY numberChanged)
    Q_PROPERTY(QString image READ image WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(QString callTime READ callTime WRITE setCallTime NOTIFY callTimeChanged)
    Q_PROPERTY(bool isIncoming READ isIncoming WRITE setIsIncoming NOTIFY isIncomingChanged)
    Q_PROPERTY(bool isOutgoing READ isOutgoing WRITE setIsOutgoing NOTIFY isOutgoingChanged)
    Q_PROPERTY(QString shortMessage READ shortMessage WRITE setShortMessage NOTIFY shortMessageChanged)

public:
    explicit Contact(const QString &name = QString(),
                     const QString &number = QString(),
                     const QString &image = QString(),
                     const QString &callTime = QString(),
                     bool isIncoming = false,
                     bool isOutgoing = false,
                     const QString &shortMessage = QString(),
                     QObject *parent = nullptr);

    QString name() const;
    QString number() const;
    QString image() const;
    QString callTime() const;
    bool isIncoming() const;
    bool isOutgoing() const;
    QString shortMessage() const;

public slots:
    void setName(const QString &name);
    void setNumber(const QString &number);
    void setImage(const QString &image);
    void setCallTime(const QString &time);
    void setIsIncoming(bool incoming);
    void setIsOutgoing(bool outgoing);
    void setShortMessage(const QString &msg);

signals:
    void nameChanged();
    void numberChanged();
    void imageChanged();
    void callTimeChanged();
    void isIncomingChanged();
    void isOutgoingChanged();
    void shortMessageChanged();

private:
    QString m_name;
    QString m_number;
    QString m_image;
    QString m_callTime;
    bool m_isIncoming;
    bool m_isOutgoing;
    QString m_shortMessage;
};

#endif
