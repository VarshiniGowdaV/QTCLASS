#ifndef CSVLOADER_H
#define CSVLOADER_H

#include <QString>
#include <QList>
#include "Contact.h"

namespace CsvLoader {
QList<Contact*> loadContacts(const QString &filePath, QObject *parent = nullptr);
}

#endif // CSVLOADER_H
