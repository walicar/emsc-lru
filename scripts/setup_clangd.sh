#!/bin/bash

emsc_dir=$(eval "echo \$CMAKE_PREFIX_PATH | tr ':' '\n' | grep emscripten")
inc_cmd="-I$emsc_dir/share/emscripten/system/include"

if [ ! -f ".clangd" ]; then
    echo "Creating .clangd"
    emsc_dir=$(eval "echo \$CMAKE_PREFIX_PATH | tr ':' '\n' | grep emscripten")
    inc_cmd="-I$emsc_dir/share/emscripten/system/include"
    echo -e "CompileFlags:\r  Add: [$inc_cmd]" > ".clangd"
fi
