#include <QCoreApplication>
//#include <emscripten.h>

// EM_JS(void, NoReturnValueWithNoParameters, (), {
//   console.log("NoReturnValueWithNoParameters called");
// });

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    //NoReturnValueWithNoParameters();
    return a.exec();
}
