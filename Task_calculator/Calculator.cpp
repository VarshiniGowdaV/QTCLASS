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
    if (button == "C")
    {
        m_displayText = "0";
    }
    else if (button == "←")
    {
        if (m_displayText.#include "Contact.h"

            Contact::Contact() {}

            Contact::Contact(QString name, QString number)
            {
                m_contactName = name;
                m_contactNumber = number;
            }

            Contact::~Contact()
            {

            }

            QString Contact::getContactName() const
            {
                return m_contactName;
            }

            void Contact::setContactName(const QString &newContactName)
            {
                if (m_contactName == newContactName)
                    return;
                m_contactName = newContactName;
                emit contactNameChanged();
            }

            QString Contact::getContactNumber() const
            {
                return m_contactNumber;
            }

            void Contact::setContactNumber(const QString &newContactNumber)
            {
                if (m_contactNumber == newContactNumber)
                    return;
                m_contactNumber = newContactNumber;
                emit contactNumberChanged();
            }
length() > 1)
        {
            m_displayText.chop(1);
        }
        else
        {
            m_displayText = "0";
        }
    }
    else if (button == "=")
    {
        QString expression = m_displayText;

        double result = 0;
        bool sum;

        if (expression.contains("+"))
        {
            QStringList parts = expression.split("+");
            result = 0;
            for (const QString &part : parts)
            {
                double num = part.toDouble(&sum);
                if (sum) result += num;
            }
        }
        else if (expression.contains("-"))
        {
            QStringList parts = expression.split("-");
            if (parts.size() > 0)
                result = parts[0].toDouble(&sum);
            for (int i = 1; i < parts.size(); i++)
            {
                double num = parts[i].toDouble(&sum);
                if (sum) result -= num;
            }
        }
        else if (expression.contains("*"))
        {
            QStringList parts = expression.split("*");
            if (parts.size() > 0)
                result = parts[0].toDouble(&sum);
            for (int i = 1; i < parts.size(); i++)
            {
                double num = parts[i].toDouble(&sum);
                if (sum) result *= num;
            }
        }
        else if (expression.contains("/"))
        {
            QStringList parts = expression.split("/");
            if (parts.size() > 0)
                result = parts[0].toDouble(&sum);
            for (int i = 1; i < parts.size(); i++)
            {
                double num = parts[i].toDouble(&sum);
                if (sum && num != 0)
                    result /= num;
            }
        }

        m_displayText = QString::number(result);
    }
    else
    {
        if (m_displayText == "0" && button != ".")
        {
            m_displayText = button;
        }
        else
        {
            m_displayText += button;
        }
    }

    emit displayChanged(m_displayText);
}
