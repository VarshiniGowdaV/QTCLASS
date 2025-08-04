
#ifndef MYWIDGET_H
#define MYWIDGET_H

#include <QWidget>
#include <QPushButton>
#include <QComboBox>
#include <QMap>

class MyWidget : public QWidget
{
    Q_OBJECT

private:
    int rectX;
    int rectY;
    int rectWidth;
    int rectHeight;

    QString selectedShape = "Rectangle";

    QComboBox *penSizeCombo;
    QComboBox *borderColorCombo;
    QComboBox *fillColorCombo;

    QMap<QString, QColor> colorMap;

public:
    MyWidget(int x, int y, int width, int height, QWidget *parent = nullptr);
    ~MyWidget();

protected:
    void paintEvent(QPaintEvent *event) override;

private slots:
    void setShape();
};

#endif // MYWIDGET_H
