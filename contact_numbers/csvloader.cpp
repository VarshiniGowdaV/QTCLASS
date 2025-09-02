#include "csvloader.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>

QList<Contact*> CsvLoader::loadContacts(const QString &filePath, QObject *parent) {
    QList<Contact*> contacts;
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open CSV:" << filePath;
        return contacts;
    }

    QTextStream in(&file);
    bool firstLine = true;
    while (!in.atEnd()) {
        QString line = in.readLine();
        if (firstLine) {
            firstLine = false;
            continue;
        }

        QStringList parts = line.split(",");
        if (parts.size() < 7) continue;

        QString name = parts[0].trimmed();
        QString number = parts[1].trimmed();
        QString image = parts[2].trimmed();
        QString callTime = parts[3].trimmed();
        bool isIncoming = (parts[4].trimmed().toLower() == "true");
        bool isOutgoing = (parts[5].trimmed().toLower() == "true");
        QString shortMessage = parts[6].trimmed();

        contacts.append(new Contact(name, number, image, callTime, isIncoming, isOutgoing, shortMessage, parent));
    }
    return contacts;
}
