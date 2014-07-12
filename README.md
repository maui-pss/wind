Maui Theme
==========

This repository contains themes for Maui.

## Dependencies

This project doesn't have build dependencies per-se, but if you enable
Widgets Factory you will need Qt 5.3 or better with at least the
following modules:

* qtbase
* qtdeclarative
* qtquickcontrols

You can either build Qt from git yourself or download binaries.

More information about building Qt 5 from can be found here:

  http://qt-project.org/wiki/Building-Qt-5-from-Git

Qt 5 binaries can be downloaded from http://qt-project.org/downloads

## Build

Building this project is a piece of cake.

Assuming you are in the source directory, just create a build directory
and run cmake:

```sh
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/hawaii ..
```

If not passed, the `CMAKE_INSTALL_PREFIX` parameter defaults to /usr/local.
You have to specify a path that fits your needs, /opt/hawaii is just an example.

Package maintainers would pass `-DCMAKE_INSTALL_PREFIX=/usr`.

### Options

Widgets Factory build is disabled by default.
To enable pass the ```-DENABLE_WIDGETS_FACTORY:bool=ON``` argument to cmake.

## Installation

It's really easy, it's just a matter of typing:

```sh
make install
```

from the build directory.
