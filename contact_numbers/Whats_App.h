#ifndef WHATSAPP_H
#define WHATSAPP_H

#include "ContactDataModel.h"

class WhatsApp : public ContactDataModel
{
    Q_OBJECT
public:
    explicit WhatsApp(QObject *parent = nullptr);
    ~WhatsApp() override;

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void createContactData() override;

public slots:
    Q_INVOKABLE void addChat(const QString &name,
                             const QString &number,
                             const QString &imagePath,
                             const QString &lastMessage,
                             const QString &lastMessageTime);
};

#endif // WHATSAPP_H
