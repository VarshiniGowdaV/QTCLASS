cmake_minimum_required(VERSION 3.16)

project(contact_numbers VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(appcontact_numbers
    main.cpp
)

qt_add_qml_module(appcontact_numbers
    URI contact_numbers
    VERSION 1.0
    QML_FILES main.qml
    SOURCES Contact.h Contact.cpp
    SOURCES ContactDataModel.h ContactDataModel.cpp
    SOURCES Call_History.h Call_History.cpp
    SOURCES PhoneBook.h PhoneBook.cpp
    SOURCES Whats_App.h Whats_App.cpp
    QML_FILES Phone_book.qml
    QML_FILES Whats_app.qml
    QML_FILES Call_History.qml
    QML_FILES
    QML_FILES Add_Contact.qml
    RESOURCES
    QML_FILES
    QML_FILES Frontpage.qml
    SOURCES contactmodelmanager.h contactmodelmanager.cpp
    SOURCES csvloader.h csvloader.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcontact_numbers PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcontact_numbers
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcontact_numbers
    PRIVATE Qt6::Quick)
target_link_libraries(appcontact_numbers PRIVATE Qt6::Core)
target_link_libraries(appcontact_numbers PRIVATE Qt6::Core)
target_link_libraries(appcontact_numbers PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appcontact_numbers
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
