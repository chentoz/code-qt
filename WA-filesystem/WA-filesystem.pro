QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DESTDIR = D:/httpd-2.4.41-win32-VC15/Apache24/htdocs/

MOC_DIR	= $$_PRO_FILE_PWD_./build/qt_moc/
OBJECTS_DIR = $$_PRO_FILE_PWD_./build/qt_object/
UI_DIR = $$_PRO_FILE_PWD_./build/qt_ui/
RCC_DIR = $$_PRO_FILE_PWD_./build/qt_rcc/

CONFIG(debug, debug|release) {
    message("================ buiding debug ================");
    message($$PWD);
    # QMAKE_CXXFLAGS += --bind -g4 --source-map-base http://192.168.1.82:8080/wasm/ -std=c++17 -fdebug-compilation-dir='.' --clear-cache SAFE_HEAP=1 -s EXPORT_ALL=1 -v   -s EXPORT_ALL=1 -s EXPORTED_RUNTIME_METHODS="['ccall','cwrap']" -s ENVIRONMENT='web,worker' -s USE_ES6_IMPORT_META=0
    # DEFINES += jqdev
} else {
    message("================ buiding release ================");
    message($$PWD);
    # QMAKE_CXXFLAGS += -s EXPORTED_RUNTIME_METHODS="['ccall','cwrap']" -s ENVIRONMENT='web,worker' -s USE_ES6_IMPORT_META=0
    # DEFINES += jqdev
}
