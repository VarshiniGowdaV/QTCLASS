cmake_minimum_required(VERSION 3.16)

project(Student_login_project VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appStudent_login_project
    main.cpp
)

qt_add_qml_module(appStudent_login_project
    URI Student_login_project
    VERSION 1.0
    QML_FILES main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appStudent_login_project PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appStudent_login_project
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appStudent_login_project
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appStudent_login_project
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
