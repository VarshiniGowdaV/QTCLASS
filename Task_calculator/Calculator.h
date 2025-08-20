#ifndef CALCULATORBACKEND_H
#define CALCULATORBACKEND_H

#include <QObject>
#include <QStringList>

class CalculatorBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList buttons READ buttons CONSTANT)

public:
    explicit CalculatorBackend(QObject *parent = nullptr);

    QStringList buttons() const;

public slots:
    void handleButtonClick(const QString &button);

signals:
    void displayChanged(const QString &displayText);

private:
    QStringList m_buttons;
    QString m_displayText;
};

#endif // CALCULATORBACKEND_H
