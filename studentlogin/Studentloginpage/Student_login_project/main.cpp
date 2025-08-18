#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Load from actual file system path
    const QUrl url = QUrl::fromLocalFile("/home/varshini-gowda/QTCLASS/Student_login_project/qml/Main.qml");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
