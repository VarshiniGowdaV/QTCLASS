#include "Calculator.h"

CalculatorBackend::CalculatorBackend(QObject *parent) : QObject(parent)
{
    m_buttons = {
        "7", "8", "9", "/",
        "4", "5", "6", "*",
        "1", "2", "3", "-",
        "0", ".", "=", "+",
        "C",           "←"
    };

    m_displayText = "0";
}

QStringList CalculatorBackend::buttons() const
{
    return m_buttons;
}

void CalculatorBackend::handleButtonClick(const QString &button)
{
    if (button == "C") {
        m_displayText = "0";
    } else if (button == "←") {
        if (m_displayText.length() > 1) {
            m_displayText.chop(1);
        } else {
            m_displayText = "0";
        }
    } else if (button == "=") {
        QString expression = m_displayText;
        if (expression.contains("+")) {
            QStringList parts = expression.split("+");
            double result = 0;
            bool ok;
            for (const QString &part : parts) {
                double num = part.toDouble(&ok);
                if (ok) {
                    result += num;
                } else {
                    m_displayText = "Error";
                    emit displayChanged(m_displayText);
                    return;
                }
            }
            m_displayText = QString::number(result);
        }
    } else {
        if (m_displayText == "0" && button != ".") {
            m_displayText = button;
        } else {
            m_displayText += button;
        }
    }
    emit displayChanged(m_displayText);
}
