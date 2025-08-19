

#ifndef BACKENDOPERATIONS_H
#define BACKENDOPERATIONS_H

#include <QObject>
#include <QString>
#include <QVariantList>

class BackendOperations : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText NOTIFY displayTextChanged)
    Q_PROPERTY(QVariantList buttons READ buttons CONSTANT)

public:
    explicit BackendOperations(QObject *parent = nullptr);

    QString displayText() const { return m_displayText; }
    QVariantList buttons() const { return m_buttons; }

    Q_INVOKABLE void handleButtonClick(const QString &text);

signals:
    void displayTextChanged();

private:
    QString m_displayText;
    QVariantList m_buttons;

    bool endsWithOperator(const QString &s) const;
    bool isOperator(QChar c) const;
    void calculateResult();
};

#endif // BACKENDOPERATIONS_H
