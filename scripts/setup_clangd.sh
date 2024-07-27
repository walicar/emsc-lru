#!/bin/bash

if [ ! -f ".clangd" ]; then
    echo "Creating .clangd"
    emsc_dir_bin=$(eval "echo \$PATH | tr ':' '\n' | grep emscripten")
    emsc_dir=$(eval "echo ${emsc_dir_bin%/bin}")
    inc_cmd="-I$emsc_dir/share/emscripten/system/include"
    inc_cmd="-I$emsc_dir/share/emscripten/system/include"
    echo -e "CompileFlags:\r  Add: [$inc_cmd]" > ".clangd"
fi
