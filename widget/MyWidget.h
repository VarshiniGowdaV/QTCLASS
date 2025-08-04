#ifndef MYWIDGET_H
#define MYWIDGET_H

#include <QWidget>

class QLabel;
class QTextEdit;
class QPushButton;

class MyWidget : public QWidget
{
    Q_OBJECT
public:
    MyWidget(QWidget *parent = nullptr);
    ~MyWidget();

private:
    QLabel *usernameLabel;
    QLabel *passwordLabel;
    QTextEdit *usernameEdit;
    QTextEdit *passwordEdit;
    QPushButton *submitButton;
    QPushButton *cancelButton;
};

#endif // MYWIDGET_H
