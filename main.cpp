#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/BallShoot.qml")));
//    engine.load(QUrl(QLatin1String("qrc:/MyTab.qml")));
//    engine.load(QUrl(QLatin1String("qrc:/TextFieldStates.qml")));
    engine.load(QUrl(QLatin1String("qrc:/MyButton.qml")));
//    engine.load(QUrl(QLatin1String("qrc:/DragDropDemo.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

//    QQuickView qview;
//    qview.setSource(QUrl(QLatin1String("qrc:/BallShoot.qml")));
//    qview.show();

    return app.exec();
}
