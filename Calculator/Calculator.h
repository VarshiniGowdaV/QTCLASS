#ifndef CALCULATORBACKEND_H
#define CALCULATORBACKEND_H

#include <QObject>
#include <QString>
#include <QStringList>
#include <QList>
#include <QVariantMap>

class CalculatorBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText WRITE setDisplayText NOTIFY displayTextChanged)
    Q_PROPERTY(QList<QVariantMap> buttons READ buttons CONSTANT)

public:
    explicit CalculatorBackend(QObject *parent = nullptr);

    QString displayText() const;
    void setDisplayText(const QString &text);

    QList<QVariantMap> buttons() const;

public slots:
    void handleButtonClick(const QString &label);

signals:
    void displayTextChanged();

private:
    struct CalcButton {
        QString text;
        QString color;
    };

    QString m_displayText;
    QList<CalcButton> m_buttons;
};

#endif // CALCULATORBACKEND_H
