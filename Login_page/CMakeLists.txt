cmake_minimum_required(VERSION 3.16)

project(Login_page VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appLogin_page
    main.cpp
)

qt_add_qml_module(appLogin_page
    URI Login_page
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES Header.qml
    QML_FILES HomePage.qml
    QML_FILES LoginPage.qml
    QML_FILES RegisterPage.qml
    SOURCES student.h student.cpp
    QML_FILES StudentDataList.qml
SOURCES studentdatamodel.h studentdatamodel.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appLogin_page PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appLogin_page
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appLogin_page
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appLogin_page
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
