#include "MyWidget.h"

#include <QLabel>
#include <QTextEdit>
#include <QPushButton>
#include <QVBoxLayout>
#include <QHBoxLayout>

MyWidget::MyWidget(QWidget *parent)
    : QWidget(parent)
{
    setFixedSize(500,200);

    usernameLabel = new QLabel("Username:");
    passwordLabel = new QLabel("Password:");

    usernameEdit = new QTextEdit;
    usernameEdit->setFixedHeight(30);
    passwordEdit = new QTextEdit;
    passwordEdit->setFixedHeight(30);

    submitButton = new QPushButton("Submit");
    cancelButton = new QPushButton("Cancel");

    QVBoxLayout *formLayout = new QVBoxLayout;
    formLayout->addWidget(usernameLabel);
    formLayout->addWidget(usernameEdit);
    formLayout->addWidget(passwordLabel);
    formLayout->addWidget(passwordEdit);

    QHBoxLayout *buttonLayout = new QHBoxLayout;
    buttonLayout->addWidget(submitButton);
    buttonLayout->addWidget(cancelButton);

    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainLayout->addLayout(formLayout);
    mainLayout->addLayout(buttonLayout);

    setLayout(mainLayout);
    setWindowTitle("User Login");
}

MyWidget::~MyWidget() {}
