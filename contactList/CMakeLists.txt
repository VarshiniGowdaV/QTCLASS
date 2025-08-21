cmake_minimum_required(VERSION 3.16)

project(contactList VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(appcontactList
    main.cpp
)

qt_add_qml_module(appcontactList
    URI contactList
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES
    QML_FILES ShowList.qml
    SOURCES Phonebook.h Phonebook.cpp
    SOURCES ContactModel.h ContactModel.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcontactList PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcontactList
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcontactList
    PRIVATE Qt6::Quick)
target_link_libraries(appcontactList PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appcontactList
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
