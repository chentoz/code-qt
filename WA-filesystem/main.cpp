#include <QtDebug>
#include <stdlib.h>
#include <stdio.h>
#include <emscripten.h>
#include <emscripten/bind.h>

#include <QFile>
#include <QString>
#include <QStringList>
#include <QDir>

using namespace emscripten;

#include <dirent.h>
#include <stdio.h>

int listfiles(const char* targetDir)
{
    printf("list files in directory : %s", targetDir);

    DIR *d;
    struct dirent *dir;
    d = opendir("C:/Users/chentoz/Desktop/code/WA-filesystem/BLOCK50/");
    if (d)
    {
        while ((dir = readdir(d)) != NULL)
        {
            printf("%s\n", dir->d_name);
        }
        closedir(d);
    }
    return (0);
}

bool EMSCRIPTEN_KEEPALIVE ListFiles()
{
    listfiles(".");

    QDir directory("C:/Users/chentoz/Desktop/code/WA-filesystem/BLOCK50/");
    QStringList blks = directory.entryList(QStringList() << "*.20S",QDir::Files);
    qDebug() << "searching files";
    foreach(QString filename, blks) {
    //do whatever you need to do
        qDebug() << filename ;
    }

    QFile file("C:/Users/chentoz/Desktop/code/WA-filesystem/BLOCK50/96.20S");
    auto isOk = file.open(QFile::ReadOnly);
    qDebug() << "reading files : " << isOk;
    while (!file.atEnd())
    {
        qDebug() << "reading line ";
        QString line = QString::fromUtf8(file.readLine()).trimmed().replace(" ", "");
        if (line.isEmpty())
            continue;
        QStringList cols = line.split(",");
        if (cols.count() == 0)
            continue;

        qDebug() << cols;
    }
    return true;
}

EMSCRIPTEN_BINDINGS(fs)
{
    function("fs_ls", &ListFiles);
}
