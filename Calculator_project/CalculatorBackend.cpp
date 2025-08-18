#include "CalculatorBackend.h"
#include <QJSEngine>
#include <QJSValue>

CalculatorBackend::CalculatorBackend(QObject *parent)
    : QObject(parent), m_displayText("")
{
}

QString CalculatorBackend::displayText() const
{
    return m_displayText;
}

void CalculatorBackend::setDisplayText(const QString &text)
{
    if (m_displayText != text) {
        m_displayText = text;
        emit displayTextChanged();
    }
}

void CalculatorBackend::handleButtonClick(const QString &label)
{
    if (label == "AC") {
        setDisplayText("");
    }
    else if (label == "←") {
        if (!m_displayText.isEmpty())
            setDisplayText(m_displayText.left(m_displayText.length() - 1));
    }
    else if (label == "=") {
        QJSEngine engine;
        QString expression = m_displayText;
        expression.replace("×", "*");
        expression.replace("÷", "/");

        QJSValue result = engine.evaluate(expression);
        if (!result.isError()) {
            QString res = result.toString();
            m_history.append(expression + " = " + res);
            emit historyChanged(); // NEW
            setDisplayText(res);
        } else {
            setDisplayText("Error");
        }
    }
    else {
        setDisplayText(m_displayText + label);
    }
}

void CalculatorBackend::clearHistory()
{
    m_history.clear();
    emit historyChanged();
}


