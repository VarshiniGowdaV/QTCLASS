#include "mywidget.h"
#include <QPainter>
#include <QPaintEvent>
#include <QPainterPath>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QPushButton>
#include <QDebug>
#include <QLabel>

MyWidget::MyWidget(int x, int y, int width, int height, QWidget *parent)
    : QWidget(parent), rectX(x), rectY(y), rectWidth(width), rectHeight(height)
{
    qDebug() << "MyWidget constructor called";

    colorMap["Black"] = Qt::black;
    colorMap["Red"] = Qt::red;
    colorMap["Blue"] = Qt::blue;
    colorMap["Green"] = Qt::green;
    colorMap["White"] = Qt::white;
    colorMap["Yellow"] = Qt::yellow;
    colorMap["Gray"] = Qt::gray;

    QVBoxLayout *mainLayout = new QVBoxLayout(this);

    QHBoxLayout *topLayout = new QHBoxLayout();
    topLayout->addWidget(new QLabel("Pen Size:"));
    penSizeCombo = new QComboBox();
    penSizeCombo->addItems({"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"});
    topLayout->addWidget(penSizeCombo);

    topLayout->addWidget(new QLabel("Border Color:"));
    borderColorCombo = new QComboBox();
    borderColorCombo->addItems(colorMap.keys());
    topLayout->addWidget(borderColorCombo);

    topLayout->addWidget(new QLabel("Fill Color:"));
    fillColorCombo = new QComboBox();
    fillColorCombo->addItems(colorMap.keys());
    topLayout->addWidget(fillColorCombo);

    connect(penSizeCombo, &QComboBox::currentIndexChanged, this, QOverload<>::of(&MyWidget::update));
    connect(borderColorCombo, &QComboBox::currentIndexChanged, this, QOverload<>::of(&MyWidget::update));
    connect(fillColorCombo, &QComboBox::currentIndexChanged, this, QOverload<>::of(&MyWidget::update));

    mainLayout->addLayout(topLayout);

    QHBoxLayout *middleLayout = new QHBoxLayout();

    QVBoxLayout *leftLayout = new QVBoxLayout();
    QStringList shapes = {"Rectangle", "Circle", "Square", "Rhombus", "Triangle", "Line", "Curve"};
    for (const QString &shape : shapes)
    {
        QPushButton *btn = new QPushButton(shape);
        connect(btn, &QPushButton::clicked, this, &MyWidget::setShape);
        leftLayout->addWidget(btn);
    }

    QWidget *leftPanel = new QWidget();
    leftPanel->setLayout(leftLayout);
    leftPanel->setFixedWidth(120);
    middleLayout->addWidget(leftPanel);
    middleLayout->addStretch();

    mainLayout->addLayout(middleLayout);
    setLayout(mainLayout);
}

MyWidget::~MyWidget()
{
    qDebug() << "MyWidget destructor called";
}

void MyWidget::setShape()
{
    QPushButton *btn = qobject_cast<QPushButton *>(sender());
    if (btn)
    {
        selectedShape = btn->text();
        update();
    }
}

void MyWidget::paintEvent(QPaintEvent *event)
{
    Q_UNUSED(event);
    QPainter painter(this);

    QColor borderColor = colorMap.value(borderColorCombo->currentText(), Qt::black);
    QColor fillColor = colorMap.value(fillColorCombo->currentText(), Qt::white);
    int penSize = penSizeCombo->currentText().toInt();

    painter.setPen(QPen(borderColor, penSize));
    painter.setBrush(fillColor);

    QRect drawRect(rectX, rectY, rectWidth, rectHeight);

    if (selectedShape == "Rectangle")
    {
        painter.drawRect(drawRect);
    }
    else if (selectedShape == "Square")
    {
        int size = qMin(rectWidth, rectHeight);
        QRect squareRect(rectX, rectY, size, size);
        painter.drawRect(squareRect);
    }
    else if (selectedShape == "Circle")
    {
        painter.drawEllipse(drawRect);
    }
    else if (selectedShape == "Triangle")
    {
        QPolygon triangle;
        triangle << QPoint(rectX + rectWidth / 2, rectY)
                 << QPoint(rectX, rectY + rectHeight)
                 << QPoint(rectX + rectWidth, rectY + rectHeight);
        painter.drawPolygon(triangle);
    }
    else if (selectedShape == "Rhombus")
    {
        QPolygon rhombus;
        rhombus << QPoint(rectX + rectWidth / 2, rectY)
                << QPoint(rectX + rectWidth, rectY + rectHeight / 2)
                << QPoint(rectX + rectWidth / 2, rectY + rectHeight)
                << QPoint(rectX, rectY + rectHeight / 2);
        painter.drawPolygon(rhombus);
    }
    else if (selectedShape == "Line")
    {
        painter.drawLine(rectX, rectY, rectX + rectWidth, rectY + rectHeight);
    }
    else if (selectedShape == "Curve")
    {
        QPainterPath path;
        path.moveTo(rectX, rectY + rectHeight / 2);
        path.cubicTo(rectX + rectWidth / 3, rectY - 40,
                     rectX + 2 * rectWidth / 3, rectY + rectHeight + 40,
                     rectX + rectWidth, rectY + rectHeight / 2);
        painter.drawPath(path);
    }
}

