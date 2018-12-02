TEMPLATE = app

QT += qml quick

HEADERS +=

SOURCES += main.cpp
        

RESOURCES += qml.qrc

OTHER_FILES +=  qml/main.qml \
                qml/BoatPicker.qml \
                qml/Chat.qml \
                qml/MainButton.qml \
                qml/NewGame.qml \
                qml/Prepare.qml \
                qml/Game.qml \
                qml/SoundSwitch.qml

OTHER_FILES += js/Theme.js

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    qml/NewGame.qml
