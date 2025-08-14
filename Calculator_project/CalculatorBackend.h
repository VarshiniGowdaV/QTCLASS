#ifndef CALCULATORBACKEND_H
#define CALCULATORBACKEND_H

#include <QObject>
#include <QString>

class CalculatorBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText WRITE setDisplayText NOTIFY displayTextChanged)

public:
    explicit CalculatorBackend(QObject *parent = nullptr);

    QString displayText() const;
    void setDisplayText(const QString &text);

    Q_INVOKABLE void handleButtonClick(const QString &label);

signals:
    void displayTextChanged();

private:
    QString m_displayText;
};

#endif // CALCULATORBACKEND_H
