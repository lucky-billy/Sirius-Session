#include "globalfunction.h"

GlobalFunction::GlobalFunction(QObject *parent) : QObject(parent)
{

}

QString GlobalFunction::read(const QString& source)
{
    if ( source.isEmpty() ) {
        return QString();
    }

    QFile file(source);
    QString result;

    // 以只读的方式打开本地文件，一行一行的读取内容并追加在后面，最后返回一个一行的字符串
    if ( file.open(QIODevice::ReadOnly) ) {
        QString line;
        QTextStream t( &file );
        do {
            line = t.readLine();
            result += line;
        } while (!line.isNull());

        file.close();
    } else {
        return QString();
    }
    return result;
}

bool GlobalFunction::write(const QString& source, const QString& data)
{
    if ( source.isEmpty() ) {
        return false;
    }

    QFile file(source);

    if ( !file.open(QFile::WriteOnly | QFile::Truncate) ) {
        return false;
    }

    QTextStream out(&file);
    out << data;

    file.close();

    return true;
}
