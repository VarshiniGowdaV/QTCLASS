#ifndef CALCULATORBACKEND_H
#define CALCULATORBACKEND_H

#include <QObject>
#include <QString>
#include <QStringList>

class CalculatorBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText WRITE setDisplayText NOTIFY displayTextChanged)
    Q_PROPERTY(QStringList history READ history NOTIFY historyChanged) // NEW

public:
    explicit CalculatorBackend(QObject *parent = nullptr);

    QString displayText() const;
    void setDisplayText(const QString &text);

    QStringList history() const { return m_history; }

    Q_INVOKABLE void handleButtonClick(const QString &label);
    Q_INVOKABLE void clearHistory();

signals:
    void displayTextChanged();
    void historyChanged();
private:
    QString m_displayText;
    QStringList m_history;
};

#endif // CALCULATORBACKEND_H

