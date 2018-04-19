#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi
    pyenv activate conan
fi

if [[ "$(uname -s)" == 'Linux' ]]; then
    CC=$C_COMPILER
    CXX=$CXX_COMPILER
fi

mkdir build && cd build
conan remote add conan.io https://server.conan.io False
conan install .. -s build_type=$BUILD_TYPE --build=missing
cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_C_COMPILER=$COMPILER -DCMAKE_CXX_COMPILER=$COMPILER
cmake --build . -- VERBOSE=1
ctest -V