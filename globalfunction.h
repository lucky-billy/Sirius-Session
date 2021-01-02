#ifndef GLOBALFUNCTION_H
#define GLOBALFUNCTION_H

#include <QObject>
#include <QTextStream>
#include <QFile>

class GlobalFunction : public QObject
{
    Q_OBJECT
public:
    explicit GlobalFunction(QObject *parent = nullptr);

    Q_INVOKABLE QString read(const QString& source);

    Q_INVOKABLE bool write(const QString& source, const QString& data);

signals:

};

#endif // GLOBALFUNCTION_H
