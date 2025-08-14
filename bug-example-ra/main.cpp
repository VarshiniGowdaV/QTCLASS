#include <QApplication>
#include <QMainWindow>
#include <QToolButton>
#include <QToolBar>
#include <QAction>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QMainWindow window;
    QToolBar *toolbar = new QToolBar(&window);
    window.addToolBar(toolbar);

    QToolButton *button = new QToolButton(toolbar);
    QAction *action = new QAction("Test Action", button);
    action->setVisible(true); // Toggle to false to test

    button->setDefaultAction(action);  // This must trigger your override
    toolbar->addWidget(button);

    window.show();
    return app.exec();
}
