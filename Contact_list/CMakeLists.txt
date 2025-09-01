cmake_minimum_required(VERSION 3.16)

project(Contact_list VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appContact_list
    main.cpp
)

qt_add_qml_module(appContact_list
    URI Contact_list
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES Call_history.qml
    QML_FILES Whats_app.qml
    QML_FILES Phone_book.qml
    QML_FILES Front_page.qml
    QML_FILES
    QML_FILES AddContact.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appContact_list PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appContact_list
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appContact_list
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appContact_list
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
