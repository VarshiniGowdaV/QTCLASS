#include "Calculator.h"
#include <QJSEngine>
#include <QJSValue>

CalculatorBackend::CalculatorBackend(QObject *parent)
    : QObject(parent), m_displayText("0")
{
    m_buttons = {
        {"AC"}, {"%"}, {"←"}, {"+"},
        {"7"}, {"8"}, {"9"}, {"×"},
        {"4"}, {"5"}, {"6"}, {"-"},
        {"1"}, {"2"}, {"3"}, {"+"},
        {"00"}, {"0"}, {"."}, {"="}
    };
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

QList<QVariantMap> CalculatorBackend::buttons() const
{
    QList<QVariantMap> list;
    for (const CalcButton &b : m_buttons) {
        QVariantMap map;
        map["text"] = b.text;
        map["color"] = b.color;
        list.append(map);
    }
    return list;
}
void CalculatorBackend::handleButtonClick(const QString &label)
{
    if (label == "AC") {
        // Clear everything
        setDisplayText("0");

    } else if (label == "←") {
        // Backspace: remove the last digit
        if (!m_displayText.isEmpty() && m_displayText != "0") {
            if (m_displayText.length() > 1) {
                setDisplayText(m_displayText.left(m_displayText.length() - 1));
            } else {
                setDisplayText("0");
            }
        } else {
            setDisplayText("0");
        }

    } else if (label == "=") {
        // Evaluate the expression
        QString expr = m_displayText;
        expr.replace("×", "*").replace("÷", "/");

        QJSEngine engine;
        QJSValue result = engine.evaluate(expr);

        if (result.isError()) {
            setDisplayText("Error");
        } else {
            setDisplayText(result.toString());
        }

    } else {
        // Append numbers/operators
        if (m_displayText == "0") {
            setDisplayText(label);
        } else {
            setDisplayText(m_displayText + label);
        }
    }
}

// void CalculatorBackend::handleButtonClick(const QString &label)
// {
//     if (label == "AC") {
//         setDisplayText("0");
//     } else if (label == "←") {
//         if (m_displayText.length() > 1) {
//             setDisplayText(m_displayText.left(m_displayText.length() - 1));
//         } else {
//             setDisplayText("0");
//         }
//     } else if (label == "=") {
//         QString expr = m_displayText;
//         expr.replace("×", "*").replace("÷", "/");

//         QJSEngine engine;
//         QJSValue result = engine.evaluate(expr);

//         if (result.isError()) {
//             setDisplayText("Error");
//         } else {
//             setDisplayText(result.toString());
//         }
//     } else {
//         if (m_displayText == "0") {
//             setDisplayText(label);
//         } else {
//             setDisplayText(m_displayText + label);
//         }
//     }
// }
