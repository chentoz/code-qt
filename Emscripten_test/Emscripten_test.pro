QT -= gui

# CONFIG += c++11 console
CONFIG -= app_bundle
CONFIG += c++latest

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# DESTDIR = C:/Users/chentoz/Desktop/cloud-design-hn-web/public/wasm/
DESTDIR = D:/httpd-2.4.41-win32-VC15/Apache24/htdocs/

MOC_DIR	= $$_PRO_FILE_PWD_./build/qt_moc/
OBJECTS_DIR = $$_PRO_FILE_PWD_./build/qt_object/
UI_DIR = $$_PRO_FILE_PWD_./build/qt_ui/
RCC_DIR = $$_PRO_FILE_PWD_./build/qt_rcc/

QMAKE_WASM_SOURCE_MAP_BASE = "http://localhost:88/"

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
